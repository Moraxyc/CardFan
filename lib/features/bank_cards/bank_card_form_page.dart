import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';
import '../../shared/utils.dart';

class BankCardFormPage extends ConsumerStatefulWidget {
  const BankCardFormPage({super.key, this.bankCardId});

  final String? bankCardId;

  @override
  ConsumerState<BankCardFormPage> createState() => _BankCardFormPageState();
}

class _BankCardFormPageState extends ConsumerState<BankCardFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _bankNameController = TextEditingController();
  final _lastFourDigitsController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _creditLimitController = TextEditingController();
  final _notesController = TextEditingController();
  int? _statementDay;
  int? _paymentDueDay;

  BankCard? _existing;
  bool _loaded = false;
  bool _saving = false;

  bool get _isEditing => widget.bankCardId != null;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      _loadExisting();
    }
  }

  @override
  void dispose() {
    _bankNameController.dispose();
    _lastFourDigitsController.dispose();
    _cardNameController.dispose();
    _creditLimitController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _loadExisting() async {
    final id = widget.bankCardId;
    if (id == null) return;

    final bankCard = await ref.read(bankCardsDaoProvider).getById(id);
    if (!mounted) return;

    if (bankCard == null || bankCard.deletedAt != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('银行卡不存在')));
      context.pop();
      return;
    }

    setState(() {
      _existing = bankCard;
      _bankNameController.text = bankCard.bankName;
      _lastFourDigitsController.text = bankCard.lastFourDigits;
      _cardNameController.text = bankCard.cardName ?? '';
      _creditLimitController.text = bankCard.creditLimitCents == null
          ? ''
          : (bankCard.creditLimitCents! / 100).toStringAsFixed(2);
      _statementDay = bankCard.statementDay;
      _paymentDueDay = bankCard.paymentDueDay;
      _notesController.text = bankCard.notes ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? '编辑银行卡' : '新增银行卡'),
        actions: [
          if (_isEditing)
            TextButton(
              onPressed: _saving || _existing == null ? null : _confirmDelete,
              child: const Text('删除'),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  key: const Key('bankNameField'),
                  controller: _bankNameController,
                  decoration: const InputDecoration(labelText: '银行名称'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '请输入银行名称';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('lastFourDigitsField'),
                  controller: _lastFourDigitsController,
                  decoration: const InputDecoration(labelText: '卡号后四位'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    final trimmed = value?.trim() ?? '';
                    if (trimmed.isEmpty) {
                      return '请输入 4 位数字尾号';
                    }
                    if (!RegExp(r'^\d{4}$').hasMatch(trimmed)) {
                      return '请输入 4 位数字尾号';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('cardNameField'),
                  controller: _cardNameController,
                  decoration: const InputDecoration(labelText: '卡片名称'),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('creditLimitField'),
                  controller: _creditLimitController,
                  decoration: const InputDecoration(labelText: '信用额度（元）'),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    final trimmed = value?.trim() ?? '';
                    if (trimmed.isEmpty) return null;
                    if (trimmed.startsWith('-')) {
                      return '请输入有效额度';
                    }
                    if (!RegExp(r'^\d{1,8}(\.\d{1,2})?$').hasMatch(trimmed)) {
                      return '信用额度最多支持 2 位小数';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  key: const Key('statementDayField'),
                  decoration: const InputDecoration(labelText: '账单日'),
                  initialValue: _statementDay,
                  items: [
                    const DropdownMenuItem<int>(child: Text('未设置')),
                    ...List.generate(31, (index) {
                      final day = index + 1;
                      return DropdownMenuItem(
                        value: day,
                        child: Text('$day 日'),
                      );
                    }),
                  ],
                  onChanged: (value) {
                    setState(() => _statementDay = value);
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  key: const Key('paymentDueDayField'),
                  decoration: const InputDecoration(labelText: '还款日'),
                  initialValue: _paymentDueDay,
                  items: [
                    const DropdownMenuItem<int>(child: Text('未设置')),
                    ...List.generate(31, (index) {
                      final day = index + 1;
                      return DropdownMenuItem(
                        value: day,
                        child: Text('$day 日'),
                      );
                    }),
                  ],
                  onChanged: (value) {
                    setState(() => _paymentDueDay = value);
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('notesField'),
                  controller: _notesController,
                  decoration: const InputDecoration(labelText: '备注'),
                  maxLines: 3,
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: _saving ? null : _save,
                  icon: _saving
                      ? const SizedBox.square(
                          dimension: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.save),
                  label: const Text('保存'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int? _parseCreditLimitCents(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;
    final parts = trimmed.split('.');
    final yuan = int.parse(parts[0]);
    final cents = parts.length == 2 ? int.parse(parts[1].padRight(2, '0')) : 0;
    return yuan * 100 + cents;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);
    final now = DateTime.now().toUtc();
    final dao = ref.read(bankCardsDaoProvider);
    final id = _existing?.id ?? 'bc-${DateTime.now().microsecondsSinceEpoch}';
    final creditLimitCents = _parseCreditLimitCents(
      _creditLimitController.text,
    );

    try {
      if (_existing == null) {
        await dao.create(
          BankCardsCompanion.insert(
            id: id,
            bankName: _bankNameController.text.trim(),
            lastFourDigits: _lastFourDigitsController.text.trim(),
            cardName: Value(blankToNull(_cardNameController.text)),
            statementDay: Value(_statementDay),
            paymentDueDay: Value(_paymentDueDay),
            creditLimitCents: Value(creditLimitCents),
            notes: Value(blankToNull(_notesController.text)),
            createdAt: now,
            updatedAt: now,
          ),
        );
      } else {
        await dao.updateRecord(
          BankCardsCompanion(
            id: Value(id),
            bankName: Value(_bankNameController.text.trim()),
            lastFourDigits: Value(_lastFourDigitsController.text.trim()),
            cardName: Value(blankToNull(_cardNameController.text)),
            statementDay: Value(_statementDay),
            paymentDueDay: Value(_paymentDueDay),
            creditLimitCents: Value(creditLimitCents),
            notes: Value(blankToNull(_notesController.text)),
            updatedAt: Value(now),
          ),
        );
      }

      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _confirmDelete() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('删除银行卡'),
          content: const Text('删除后会从列表隐藏，并保留同步所需记录。'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('取消'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('确认删除'),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true || _existing == null) return;

    await ref
        .read(bankCardsDaoProvider)
        .softDelete(_existing!.id, DateTime.now().toUtc());
    if (mounted) context.pop();
  }
}
