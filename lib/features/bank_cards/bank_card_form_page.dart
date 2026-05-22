import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/database/app_database.dart';
import '../../core/providers/database_provider.dart';
import '../../l10n/generated/app_localizations.dart';
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
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).bankCardMissing)),
      );
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
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing ? l10n.bankCardEditTitle : l10n.bankCardAddTitle,
        ),
        actions: [
          if (_isEditing)
            TextButton(
              onPressed: _saving || _existing == null ? null : _confirmDelete,
              child: Text(l10n.actionDelete),
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
                  decoration: InputDecoration(
                    labelText: l10n.bankCardBankNameLabel,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.bankCardBankNameRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('lastFourDigitsField'),
                  controller: _lastFourDigitsController,
                  decoration: InputDecoration(
                    labelText: l10n.bankCardLastFourLabel,
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    final trimmed = value?.trim() ?? '';
                    if (trimmed.isEmpty) {
                      return l10n.bankCardLastFourInvalid;
                    }
                    if (!RegExp(r'^\d{4}$').hasMatch(trimmed)) {
                      return l10n.bankCardLastFourInvalid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('cardNameField'),
                  controller: _cardNameController,
                  decoration: InputDecoration(
                    labelText: l10n.bankCardNameLabel,
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  key: const Key('creditLimitField'),
                  controller: _creditLimitController,
                  decoration: InputDecoration(
                    labelText: l10n.bankCardCreditLimitLabel,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    final trimmed = value?.trim() ?? '';
                    if (trimmed.isEmpty) return null;
                    if (trimmed.startsWith('-')) {
                      return l10n.bankCardCreditLimitInvalid;
                    }
                    if (!RegExp(r'^\d{1,8}(\.\d{1,2})?$').hasMatch(trimmed)) {
                      return l10n.bankCardCreditLimitTooPrecise;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  key: const Key('statementDayField'),
                  decoration: InputDecoration(
                    labelText: l10n.bankCardStatementDayLabel,
                  ),
                  initialValue: _statementDay,
                  items: [
                    DropdownMenuItem<int>(child: Text(l10n.commonNotSet)),
                    ...List.generate(31, (index) {
                      final day = index + 1;
                      return DropdownMenuItem(
                        value: day,
                        child: Text(l10n.commonDayOfMonth(day: day)),
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
                  decoration: InputDecoration(
                    labelText: l10n.bankCardPaymentDueDayLabel,
                  ),
                  initialValue: _paymentDueDay,
                  items: [
                    DropdownMenuItem<int>(child: Text(l10n.commonNotSet)),
                    ...List.generate(31, (index) {
                      final day = index + 1;
                      return DropdownMenuItem(
                        value: day,
                        child: Text(l10n.commonDayOfMonth(day: day)),
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
                  decoration: InputDecoration(labelText: l10n.commonNotesLabel),
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
                  label: Text(l10n.actionSave),
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
    final l10n = AppLocalizations.of(context);
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.bankCardDeleteTitle),
          content: Text(l10n.bankCardDeleteMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.actionCancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.actionConfirmDelete),
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
