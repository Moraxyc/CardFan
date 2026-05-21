// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SimCardsTable extends SimCards with TableInfo<$SimCardsTable, SimCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SimCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _carrierNameMeta = const VerificationMeta(
    'carrierName',
  );
  @override
  late final GeneratedColumn<String> carrierName = GeneratedColumn<String>(
    'carrier_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _planNameMeta = const VerificationMeta(
    'planName',
  );
  @override
  late final GeneratedColumn<String> planName = GeneratedColumn<String>(
    'plan_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _monthlyFeeCentsMeta = const VerificationMeta(
    'monthlyFeeCents',
  );
  @override
  late final GeneratedColumn<int> monthlyFeeCents = GeneratedColumn<int>(
    'monthly_fee_cents',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _billingDayMeta = const VerificationMeta(
    'billingDay',
  );
  @override
  late final GeneratedColumn<int> billingDay = GeneratedColumn<int>(
    'billing_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _renewalDateMeta = const VerificationMeta(
    'renewalDate',
  );
  @override
  late final GeneratedColumn<DateTime> renewalDate = GeneratedColumn<DateTime>(
    'renewal_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    carrierName,
    phoneNumber,
    planName,
    monthlyFeeCents,
    billingDay,
    renewalDate,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    remoteId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sim_cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<SimCard> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('carrier_name')) {
      context.handle(
        _carrierNameMeta,
        carrierName.isAcceptableOrUnknown(
          data['carrier_name']!,
          _carrierNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_carrierNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('plan_name')) {
      context.handle(
        _planNameMeta,
        planName.isAcceptableOrUnknown(data['plan_name']!, _planNameMeta),
      );
    }
    if (data.containsKey('monthly_fee_cents')) {
      context.handle(
        _monthlyFeeCentsMeta,
        monthlyFeeCents.isAcceptableOrUnknown(
          data['monthly_fee_cents']!,
          _monthlyFeeCentsMeta,
        ),
      );
    }
    if (data.containsKey('billing_day')) {
      context.handle(
        _billingDayMeta,
        billingDay.isAcceptableOrUnknown(data['billing_day']!, _billingDayMeta),
      );
    }
    if (data.containsKey('renewal_date')) {
      context.handle(
        _renewalDateMeta,
        renewalDate.isAcceptableOrUnknown(
          data['renewal_date']!,
          _renewalDateMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SimCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SimCard(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      carrierName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}carrier_name'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
      planName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_name'],
      ),
      monthlyFeeCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}monthly_fee_cents'],
      ),
      billingDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}billing_day'],
      ),
      renewalDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}renewal_date'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
    );
  }

  @override
  $SimCardsTable createAlias(String alias) {
    return $SimCardsTable(attachedDatabase, alias);
  }
}

class SimCard extends DataClass implements Insertable<SimCard> {
  final String id;
  final String carrierName;
  final String phoneNumber;
  final String? planName;
  final int? monthlyFeeCents;
  final int? billingDay;
  final DateTime? renewalDate;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? remoteId;
  const SimCard({
    required this.id,
    required this.carrierName,
    required this.phoneNumber,
    this.planName,
    this.monthlyFeeCents,
    this.billingDay,
    this.renewalDate,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.remoteId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['carrier_name'] = Variable<String>(carrierName);
    map['phone_number'] = Variable<String>(phoneNumber);
    if (!nullToAbsent || planName != null) {
      map['plan_name'] = Variable<String>(planName);
    }
    if (!nullToAbsent || monthlyFeeCents != null) {
      map['monthly_fee_cents'] = Variable<int>(monthlyFeeCents);
    }
    if (!nullToAbsent || billingDay != null) {
      map['billing_day'] = Variable<int>(billingDay);
    }
    if (!nullToAbsent || renewalDate != null) {
      map['renewal_date'] = Variable<DateTime>(renewalDate);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  SimCardsCompanion toCompanion(bool nullToAbsent) {
    return SimCardsCompanion(
      id: Value(id),
      carrierName: Value(carrierName),
      phoneNumber: Value(phoneNumber),
      planName: planName == null && nullToAbsent
          ? const Value.absent()
          : Value(planName),
      monthlyFeeCents: monthlyFeeCents == null && nullToAbsent
          ? const Value.absent()
          : Value(monthlyFeeCents),
      billingDay: billingDay == null && nullToAbsent
          ? const Value.absent()
          : Value(billingDay),
      renewalDate: renewalDate == null && nullToAbsent
          ? const Value.absent()
          : Value(renewalDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory SimCard.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SimCard(
      id: serializer.fromJson<String>(json['id']),
      carrierName: serializer.fromJson<String>(json['carrierName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      planName: serializer.fromJson<String?>(json['planName']),
      monthlyFeeCents: serializer.fromJson<int?>(json['monthlyFeeCents']),
      billingDay: serializer.fromJson<int?>(json['billingDay']),
      renewalDate: serializer.fromJson<DateTime?>(json['renewalDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'carrierName': serializer.toJson<String>(carrierName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'planName': serializer.toJson<String?>(planName),
      'monthlyFeeCents': serializer.toJson<int?>(monthlyFeeCents),
      'billingDay': serializer.toJson<int?>(billingDay),
      'renewalDate': serializer.toJson<DateTime?>(renewalDate),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  SimCard copyWith({
    String? id,
    String? carrierName,
    String? phoneNumber,
    Value<String?> planName = const Value.absent(),
    Value<int?> monthlyFeeCents = const Value.absent(),
    Value<int?> billingDay = const Value.absent(),
    Value<DateTime?> renewalDate = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> remoteId = const Value.absent(),
  }) => SimCard(
    id: id ?? this.id,
    carrierName: carrierName ?? this.carrierName,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    planName: planName.present ? planName.value : this.planName,
    monthlyFeeCents: monthlyFeeCents.present
        ? monthlyFeeCents.value
        : this.monthlyFeeCents,
    billingDay: billingDay.present ? billingDay.value : this.billingDay,
    renewalDate: renewalDate.present ? renewalDate.value : this.renewalDate,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
  );
  SimCard copyWithCompanion(SimCardsCompanion data) {
    return SimCard(
      id: data.id.present ? data.id.value : this.id,
      carrierName: data.carrierName.present
          ? data.carrierName.value
          : this.carrierName,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      planName: data.planName.present ? data.planName.value : this.planName,
      monthlyFeeCents: data.monthlyFeeCents.present
          ? data.monthlyFeeCents.value
          : this.monthlyFeeCents,
      billingDay: data.billingDay.present
          ? data.billingDay.value
          : this.billingDay,
      renewalDate: data.renewalDate.present
          ? data.renewalDate.value
          : this.renewalDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SimCard(')
          ..write('id: $id, ')
          ..write('carrierName: $carrierName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('planName: $planName, ')
          ..write('monthlyFeeCents: $monthlyFeeCents, ')
          ..write('billingDay: $billingDay, ')
          ..write('renewalDate: $renewalDate, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    carrierName,
    phoneNumber,
    planName,
    monthlyFeeCents,
    billingDay,
    renewalDate,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    remoteId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SimCard &&
          other.id == this.id &&
          other.carrierName == this.carrierName &&
          other.phoneNumber == this.phoneNumber &&
          other.planName == this.planName &&
          other.monthlyFeeCents == this.monthlyFeeCents &&
          other.billingDay == this.billingDay &&
          other.renewalDate == this.renewalDate &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.remoteId == this.remoteId);
}

class SimCardsCompanion extends UpdateCompanion<SimCard> {
  final Value<String> id;
  final Value<String> carrierName;
  final Value<String> phoneNumber;
  final Value<String?> planName;
  final Value<int?> monthlyFeeCents;
  final Value<int?> billingDay;
  final Value<DateTime?> renewalDate;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const SimCardsCompanion({
    this.id = const Value.absent(),
    this.carrierName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.planName = const Value.absent(),
    this.monthlyFeeCents = const Value.absent(),
    this.billingDay = const Value.absent(),
    this.renewalDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SimCardsCompanion.insert({
    required String id,
    required String carrierName,
    required String phoneNumber,
    this.planName = const Value.absent(),
    this.monthlyFeeCents = const Value.absent(),
    this.billingDay = const Value.absent(),
    this.renewalDate = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       carrierName = Value(carrierName),
       phoneNumber = Value(phoneNumber),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SimCard> custom({
    Expression<String>? id,
    Expression<String>? carrierName,
    Expression<String>? phoneNumber,
    Expression<String>? planName,
    Expression<int>? monthlyFeeCents,
    Expression<int>? billingDay,
    Expression<DateTime>? renewalDate,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (carrierName != null) 'carrier_name': carrierName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (planName != null) 'plan_name': planName,
      if (monthlyFeeCents != null) 'monthly_fee_cents': monthlyFeeCents,
      if (billingDay != null) 'billing_day': billingDay,
      if (renewalDate != null) 'renewal_date': renewalDate,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SimCardsCompanion copyWith({
    Value<String>? id,
    Value<String>? carrierName,
    Value<String>? phoneNumber,
    Value<String?>? planName,
    Value<int?>? monthlyFeeCents,
    Value<int?>? billingDay,
    Value<DateTime?>? renewalDate,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? remoteId,
    Value<int>? rowid,
  }) {
    return SimCardsCompanion(
      id: id ?? this.id,
      carrierName: carrierName ?? this.carrierName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      planName: planName ?? this.planName,
      monthlyFeeCents: monthlyFeeCents ?? this.monthlyFeeCents,
      billingDay: billingDay ?? this.billingDay,
      renewalDate: renewalDate ?? this.renewalDate,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (carrierName.present) {
      map['carrier_name'] = Variable<String>(carrierName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (planName.present) {
      map['plan_name'] = Variable<String>(planName.value);
    }
    if (monthlyFeeCents.present) {
      map['monthly_fee_cents'] = Variable<int>(monthlyFeeCents.value);
    }
    if (billingDay.present) {
      map['billing_day'] = Variable<int>(billingDay.value);
    }
    if (renewalDate.present) {
      map['renewal_date'] = Variable<DateTime>(renewalDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SimCardsCompanion(')
          ..write('id: $id, ')
          ..write('carrierName: $carrierName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('planName: $planName, ')
          ..write('monthlyFeeCents: $monthlyFeeCents, ')
          ..write('billingDay: $billingDay, ')
          ..write('renewalDate: $renewalDate, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BankCardsTable extends BankCards
    with TableInfo<$BankCardsTable, BankCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardNameMeta = const VerificationMeta(
    'cardName',
  );
  @override
  late final GeneratedColumn<String> cardName = GeneratedColumn<String>(
    'card_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastFourDigitsMeta = const VerificationMeta(
    'lastFourDigits',
  );
  @override
  late final GeneratedColumn<String> lastFourDigits = GeneratedColumn<String>(
    'last_four_digits',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statementDayMeta = const VerificationMeta(
    'statementDay',
  );
  @override
  late final GeneratedColumn<int> statementDay = GeneratedColumn<int>(
    'statement_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentDueDayMeta = const VerificationMeta(
    'paymentDueDay',
  );
  @override
  late final GeneratedColumn<int> paymentDueDay = GeneratedColumn<int>(
    'payment_due_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _creditLimitCentsMeta = const VerificationMeta(
    'creditLimitCents',
  );
  @override
  late final GeneratedColumn<int> creditLimitCents = GeneratedColumn<int>(
    'credit_limit_cents',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    bankName,
    cardName,
    lastFourDigits,
    statementDay,
    paymentDueDay,
    creditLimitCents,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    remoteId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<BankCard> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    } else if (isInserting) {
      context.missing(_bankNameMeta);
    }
    if (data.containsKey('card_name')) {
      context.handle(
        _cardNameMeta,
        cardName.isAcceptableOrUnknown(data['card_name']!, _cardNameMeta),
      );
    }
    if (data.containsKey('last_four_digits')) {
      context.handle(
        _lastFourDigitsMeta,
        lastFourDigits.isAcceptableOrUnknown(
          data['last_four_digits']!,
          _lastFourDigitsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastFourDigitsMeta);
    }
    if (data.containsKey('statement_day')) {
      context.handle(
        _statementDayMeta,
        statementDay.isAcceptableOrUnknown(
          data['statement_day']!,
          _statementDayMeta,
        ),
      );
    }
    if (data.containsKey('payment_due_day')) {
      context.handle(
        _paymentDueDayMeta,
        paymentDueDay.isAcceptableOrUnknown(
          data['payment_due_day']!,
          _paymentDueDayMeta,
        ),
      );
    }
    if (data.containsKey('credit_limit_cents')) {
      context.handle(
        _creditLimitCentsMeta,
        creditLimitCents.isAcceptableOrUnknown(
          data['credit_limit_cents']!,
          _creditLimitCentsMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankCard(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      )!,
      cardName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_name'],
      ),
      lastFourDigits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_four_digits'],
      )!,
      statementDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}statement_day'],
      ),
      paymentDueDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}payment_due_day'],
      ),
      creditLimitCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}credit_limit_cents'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
    );
  }

  @override
  $BankCardsTable createAlias(String alias) {
    return $BankCardsTable(attachedDatabase, alias);
  }
}

class BankCard extends DataClass implements Insertable<BankCard> {
  final String id;
  final String bankName;
  final String? cardName;
  final String lastFourDigits;
  final int? statementDay;
  final int? paymentDueDay;
  final int? creditLimitCents;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? remoteId;
  const BankCard({
    required this.id,
    required this.bankName,
    this.cardName,
    required this.lastFourDigits,
    this.statementDay,
    this.paymentDueDay,
    this.creditLimitCents,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.remoteId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['bank_name'] = Variable<String>(bankName);
    if (!nullToAbsent || cardName != null) {
      map['card_name'] = Variable<String>(cardName);
    }
    map['last_four_digits'] = Variable<String>(lastFourDigits);
    if (!nullToAbsent || statementDay != null) {
      map['statement_day'] = Variable<int>(statementDay);
    }
    if (!nullToAbsent || paymentDueDay != null) {
      map['payment_due_day'] = Variable<int>(paymentDueDay);
    }
    if (!nullToAbsent || creditLimitCents != null) {
      map['credit_limit_cents'] = Variable<int>(creditLimitCents);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  BankCardsCompanion toCompanion(bool nullToAbsent) {
    return BankCardsCompanion(
      id: Value(id),
      bankName: Value(bankName),
      cardName: cardName == null && nullToAbsent
          ? const Value.absent()
          : Value(cardName),
      lastFourDigits: Value(lastFourDigits),
      statementDay: statementDay == null && nullToAbsent
          ? const Value.absent()
          : Value(statementDay),
      paymentDueDay: paymentDueDay == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentDueDay),
      creditLimitCents: creditLimitCents == null && nullToAbsent
          ? const Value.absent()
          : Value(creditLimitCents),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory BankCard.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankCard(
      id: serializer.fromJson<String>(json['id']),
      bankName: serializer.fromJson<String>(json['bankName']),
      cardName: serializer.fromJson<String?>(json['cardName']),
      lastFourDigits: serializer.fromJson<String>(json['lastFourDigits']),
      statementDay: serializer.fromJson<int?>(json['statementDay']),
      paymentDueDay: serializer.fromJson<int?>(json['paymentDueDay']),
      creditLimitCents: serializer.fromJson<int?>(json['creditLimitCents']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'bankName': serializer.toJson<String>(bankName),
      'cardName': serializer.toJson<String?>(cardName),
      'lastFourDigits': serializer.toJson<String>(lastFourDigits),
      'statementDay': serializer.toJson<int?>(statementDay),
      'paymentDueDay': serializer.toJson<int?>(paymentDueDay),
      'creditLimitCents': serializer.toJson<int?>(creditLimitCents),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  BankCard copyWith({
    String? id,
    String? bankName,
    Value<String?> cardName = const Value.absent(),
    String? lastFourDigits,
    Value<int?> statementDay = const Value.absent(),
    Value<int?> paymentDueDay = const Value.absent(),
    Value<int?> creditLimitCents = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> remoteId = const Value.absent(),
  }) => BankCard(
    id: id ?? this.id,
    bankName: bankName ?? this.bankName,
    cardName: cardName.present ? cardName.value : this.cardName,
    lastFourDigits: lastFourDigits ?? this.lastFourDigits,
    statementDay: statementDay.present ? statementDay.value : this.statementDay,
    paymentDueDay: paymentDueDay.present
        ? paymentDueDay.value
        : this.paymentDueDay,
    creditLimitCents: creditLimitCents.present
        ? creditLimitCents.value
        : this.creditLimitCents,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
  );
  BankCard copyWithCompanion(BankCardsCompanion data) {
    return BankCard(
      id: data.id.present ? data.id.value : this.id,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      cardName: data.cardName.present ? data.cardName.value : this.cardName,
      lastFourDigits: data.lastFourDigits.present
          ? data.lastFourDigits.value
          : this.lastFourDigits,
      statementDay: data.statementDay.present
          ? data.statementDay.value
          : this.statementDay,
      paymentDueDay: data.paymentDueDay.present
          ? data.paymentDueDay.value
          : this.paymentDueDay,
      creditLimitCents: data.creditLimitCents.present
          ? data.creditLimitCents.value
          : this.creditLimitCents,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankCard(')
          ..write('id: $id, ')
          ..write('bankName: $bankName, ')
          ..write('cardName: $cardName, ')
          ..write('lastFourDigits: $lastFourDigits, ')
          ..write('statementDay: $statementDay, ')
          ..write('paymentDueDay: $paymentDueDay, ')
          ..write('creditLimitCents: $creditLimitCents, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    bankName,
    cardName,
    lastFourDigits,
    statementDay,
    paymentDueDay,
    creditLimitCents,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    remoteId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankCard &&
          other.id == this.id &&
          other.bankName == this.bankName &&
          other.cardName == this.cardName &&
          other.lastFourDigits == this.lastFourDigits &&
          other.statementDay == this.statementDay &&
          other.paymentDueDay == this.paymentDueDay &&
          other.creditLimitCents == this.creditLimitCents &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.remoteId == this.remoteId);
}

class BankCardsCompanion extends UpdateCompanion<BankCard> {
  final Value<String> id;
  final Value<String> bankName;
  final Value<String?> cardName;
  final Value<String> lastFourDigits;
  final Value<int?> statementDay;
  final Value<int?> paymentDueDay;
  final Value<int?> creditLimitCents;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const BankCardsCompanion({
    this.id = const Value.absent(),
    this.bankName = const Value.absent(),
    this.cardName = const Value.absent(),
    this.lastFourDigits = const Value.absent(),
    this.statementDay = const Value.absent(),
    this.paymentDueDay = const Value.absent(),
    this.creditLimitCents = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BankCardsCompanion.insert({
    required String id,
    required String bankName,
    this.cardName = const Value.absent(),
    required String lastFourDigits,
    this.statementDay = const Value.absent(),
    this.paymentDueDay = const Value.absent(),
    this.creditLimitCents = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       bankName = Value(bankName),
       lastFourDigits = Value(lastFourDigits),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<BankCard> custom({
    Expression<String>? id,
    Expression<String>? bankName,
    Expression<String>? cardName,
    Expression<String>? lastFourDigits,
    Expression<int>? statementDay,
    Expression<int>? paymentDueDay,
    Expression<int>? creditLimitCents,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bankName != null) 'bank_name': bankName,
      if (cardName != null) 'card_name': cardName,
      if (lastFourDigits != null) 'last_four_digits': lastFourDigits,
      if (statementDay != null) 'statement_day': statementDay,
      if (paymentDueDay != null) 'payment_due_day': paymentDueDay,
      if (creditLimitCents != null) 'credit_limit_cents': creditLimitCents,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BankCardsCompanion copyWith({
    Value<String>? id,
    Value<String>? bankName,
    Value<String?>? cardName,
    Value<String>? lastFourDigits,
    Value<int?>? statementDay,
    Value<int?>? paymentDueDay,
    Value<int?>? creditLimitCents,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? remoteId,
    Value<int>? rowid,
  }) {
    return BankCardsCompanion(
      id: id ?? this.id,
      bankName: bankName ?? this.bankName,
      cardName: cardName ?? this.cardName,
      lastFourDigits: lastFourDigits ?? this.lastFourDigits,
      statementDay: statementDay ?? this.statementDay,
      paymentDueDay: paymentDueDay ?? this.paymentDueDay,
      creditLimitCents: creditLimitCents ?? this.creditLimitCents,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (cardName.present) {
      map['card_name'] = Variable<String>(cardName.value);
    }
    if (lastFourDigits.present) {
      map['last_four_digits'] = Variable<String>(lastFourDigits.value);
    }
    if (statementDay.present) {
      map['statement_day'] = Variable<int>(statementDay.value);
    }
    if (paymentDueDay.present) {
      map['payment_due_day'] = Variable<int>(paymentDueDay.value);
    }
    if (creditLimitCents.present) {
      map['credit_limit_cents'] = Variable<int>(creditLimitCents.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankCardsCompanion(')
          ..write('id: $id, ')
          ..write('bankName: $bankName, ')
          ..write('cardName: $cardName, ')
          ..write('lastFourDigits: $lastFourDigits, ')
          ..write('statementDay: $statementDay, ')
          ..write('paymentDueDay: $paymentDueDay, ')
          ..write('creditLimitCents: $creditLimitCents, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BillsTable extends Bills with TableInfo<$BillsTable, Bill> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BillsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountCentsMeta = const VerificationMeta(
    'amountCents',
  );
  @override
  late final GeneratedColumn<int> amountCents = GeneratedColumn<int>(
    'amount_cents',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidAtMeta = const VerificationMeta('paidAt');
  @override
  late final GeneratedColumn<DateTime> paidAt = GeneratedColumn<DateTime>(
    'paid_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bankCardIdMeta = const VerificationMeta(
    'bankCardId',
  );
  @override
  late final GeneratedColumn<String> bankCardId = GeneratedColumn<String>(
    'bank_card_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bank_cards (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _simCardIdMeta = const VerificationMeta(
    'simCardId',
  );
  @override
  late final GeneratedColumn<String> simCardId = GeneratedColumn<String>(
    'sim_card_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sim_cards (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    amountCents,
    dueDate,
    paidAt,
    bankCardId,
    simCardId,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    remoteId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bills';
  @override
  VerificationContext validateIntegrity(
    Insertable<Bill> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('amount_cents')) {
      context.handle(
        _amountCentsMeta,
        amountCents.isAcceptableOrUnknown(
          data['amount_cents']!,
          _amountCentsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountCentsMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('paid_at')) {
      context.handle(
        _paidAtMeta,
        paidAt.isAcceptableOrUnknown(data['paid_at']!, _paidAtMeta),
      );
    }
    if (data.containsKey('bank_card_id')) {
      context.handle(
        _bankCardIdMeta,
        bankCardId.isAcceptableOrUnknown(
          data['bank_card_id']!,
          _bankCardIdMeta,
        ),
      );
    }
    if (data.containsKey('sim_card_id')) {
      context.handle(
        _simCardIdMeta,
        simCardId.isAcceptableOrUnknown(data['sim_card_id']!, _simCardIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bill map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bill(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      amountCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_cents'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      )!,
      paidAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}paid_at'],
      ),
      bankCardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_card_id'],
      ),
      simCardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sim_card_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
    );
  }

  @override
  $BillsTable createAlias(String alias) {
    return $BillsTable(attachedDatabase, alias);
  }
}

class Bill extends DataClass implements Insertable<Bill> {
  final String id;
  final String title;
  final int amountCents;
  final DateTime dueDate;
  final DateTime? paidAt;
  final String? bankCardId;
  final String? simCardId;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? remoteId;
  const Bill({
    required this.id,
    required this.title,
    required this.amountCents,
    required this.dueDate,
    this.paidAt,
    this.bankCardId,
    this.simCardId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.remoteId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['amount_cents'] = Variable<int>(amountCents);
    map['due_date'] = Variable<DateTime>(dueDate);
    if (!nullToAbsent || paidAt != null) {
      map['paid_at'] = Variable<DateTime>(paidAt);
    }
    if (!nullToAbsent || bankCardId != null) {
      map['bank_card_id'] = Variable<String>(bankCardId);
    }
    if (!nullToAbsent || simCardId != null) {
      map['sim_card_id'] = Variable<String>(simCardId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  BillsCompanion toCompanion(bool nullToAbsent) {
    return BillsCompanion(
      id: Value(id),
      title: Value(title),
      amountCents: Value(amountCents),
      dueDate: Value(dueDate),
      paidAt: paidAt == null && nullToAbsent
          ? const Value.absent()
          : Value(paidAt),
      bankCardId: bankCardId == null && nullToAbsent
          ? const Value.absent()
          : Value(bankCardId),
      simCardId: simCardId == null && nullToAbsent
          ? const Value.absent()
          : Value(simCardId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory Bill.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bill(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      amountCents: serializer.fromJson<int>(json['amountCents']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      paidAt: serializer.fromJson<DateTime?>(json['paidAt']),
      bankCardId: serializer.fromJson<String?>(json['bankCardId']),
      simCardId: serializer.fromJson<String?>(json['simCardId']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'amountCents': serializer.toJson<int>(amountCents),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'paidAt': serializer.toJson<DateTime?>(paidAt),
      'bankCardId': serializer.toJson<String?>(bankCardId),
      'simCardId': serializer.toJson<String?>(simCardId),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  Bill copyWith({
    String? id,
    String? title,
    int? amountCents,
    DateTime? dueDate,
    Value<DateTime?> paidAt = const Value.absent(),
    Value<String?> bankCardId = const Value.absent(),
    Value<String?> simCardId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> remoteId = const Value.absent(),
  }) => Bill(
    id: id ?? this.id,
    title: title ?? this.title,
    amountCents: amountCents ?? this.amountCents,
    dueDate: dueDate ?? this.dueDate,
    paidAt: paidAt.present ? paidAt.value : this.paidAt,
    bankCardId: bankCardId.present ? bankCardId.value : this.bankCardId,
    simCardId: simCardId.present ? simCardId.value : this.simCardId,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
  );
  Bill copyWithCompanion(BillsCompanion data) {
    return Bill(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      amountCents: data.amountCents.present
          ? data.amountCents.value
          : this.amountCents,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      paidAt: data.paidAt.present ? data.paidAt.value : this.paidAt,
      bankCardId: data.bankCardId.present
          ? data.bankCardId.value
          : this.bankCardId,
      simCardId: data.simCardId.present ? data.simCardId.value : this.simCardId,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Bill(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amountCents: $amountCents, ')
          ..write('dueDate: $dueDate, ')
          ..write('paidAt: $paidAt, ')
          ..write('bankCardId: $bankCardId, ')
          ..write('simCardId: $simCardId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    amountCents,
    dueDate,
    paidAt,
    bankCardId,
    simCardId,
    notes,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    remoteId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bill &&
          other.id == this.id &&
          other.title == this.title &&
          other.amountCents == this.amountCents &&
          other.dueDate == this.dueDate &&
          other.paidAt == this.paidAt &&
          other.bankCardId == this.bankCardId &&
          other.simCardId == this.simCardId &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.remoteId == this.remoteId);
}

class BillsCompanion extends UpdateCompanion<Bill> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> amountCents;
  final Value<DateTime> dueDate;
  final Value<DateTime?> paidAt;
  final Value<String?> bankCardId;
  final Value<String?> simCardId;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const BillsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.amountCents = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.paidAt = const Value.absent(),
    this.bankCardId = const Value.absent(),
    this.simCardId = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BillsCompanion.insert({
    required String id,
    required String title,
    required int amountCents,
    required DateTime dueDate,
    this.paidAt = const Value.absent(),
    this.bankCardId = const Value.absent(),
    this.simCardId = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       amountCents = Value(amountCents),
       dueDate = Value(dueDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Bill> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? amountCents,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? paidAt,
    Expression<String>? bankCardId,
    Expression<String>? simCardId,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (amountCents != null) 'amount_cents': amountCents,
      if (dueDate != null) 'due_date': dueDate,
      if (paidAt != null) 'paid_at': paidAt,
      if (bankCardId != null) 'bank_card_id': bankCardId,
      if (simCardId != null) 'sim_card_id': simCardId,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BillsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? amountCents,
    Value<DateTime>? dueDate,
    Value<DateTime?>? paidAt,
    Value<String?>? bankCardId,
    Value<String?>? simCardId,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? remoteId,
    Value<int>? rowid,
  }) {
    return BillsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      amountCents: amountCents ?? this.amountCents,
      dueDate: dueDate ?? this.dueDate,
      paidAt: paidAt ?? this.paidAt,
      bankCardId: bankCardId ?? this.bankCardId,
      simCardId: simCardId ?? this.simCardId,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amountCents.present) {
      map['amount_cents'] = Variable<int>(amountCents.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (paidAt.present) {
      map['paid_at'] = Variable<DateTime>(paidAt.value);
    }
    if (bankCardId.present) {
      map['bank_card_id'] = Variable<String>(bankCardId.value);
    }
    if (simCardId.present) {
      map['sim_card_id'] = Variable<String>(simCardId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amountCents: $amountCents, ')
          ..write('dueDate: $dueDate, ')
          ..write('paidAt: $paidAt, ')
          ..write('bankCardId: $bankCardId, ')
          ..write('simCardId: $simCardId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relatedBillIdMeta = const VerificationMeta(
    'relatedBillId',
  );
  @override
  late final GeneratedColumn<String> relatedBillId = GeneratedColumn<String>(
    'related_bill_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES bills (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _notificationIdMeta = const VerificationMeta(
    'notificationId',
  );
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
    'notification_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    body,
    scheduledAt,
    relatedBillId,
    notificationId,
    enabled,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    remoteId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('related_bill_id')) {
      context.handle(
        _relatedBillIdMeta,
        relatedBillId.isAcceptableOrUnknown(
          data['related_bill_id']!,
          _relatedBillIdMeta,
        ),
      );
    }
    if (data.containsKey('notification_id')) {
      context.handle(
        _notificationIdMeta,
        notificationId.isAcceptableOrUnknown(
          data['notification_id']!,
          _notificationIdMeta,
        ),
      );
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      ),
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      relatedBillId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_bill_id'],
      ),
      notificationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notification_id'],
      ),
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final String id;
  final String title;
  final String? body;
  final DateTime scheduledAt;
  final String? relatedBillId;
  final int? notificationId;
  final bool enabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? remoteId;
  const Reminder({
    required this.id,
    required this.title,
    this.body,
    required this.scheduledAt,
    this.relatedBillId,
    this.notificationId,
    required this.enabled,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.remoteId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    if (!nullToAbsent || relatedBillId != null) {
      map['related_bill_id'] = Variable<String>(relatedBillId);
    }
    if (!nullToAbsent || notificationId != null) {
      map['notification_id'] = Variable<int>(notificationId);
    }
    map['enabled'] = Variable<bool>(enabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      title: Value(title),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      scheduledAt: Value(scheduledAt),
      relatedBillId: relatedBillId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedBillId),
      notificationId: notificationId == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationId),
      enabled: Value(enabled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
    );
  }

  factory Reminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String?>(json['body']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      relatedBillId: serializer.fromJson<String?>(json['relatedBillId']),
      notificationId: serializer.fromJson<int?>(json['notificationId']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String?>(body),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'relatedBillId': serializer.toJson<String?>(relatedBillId),
      'notificationId': serializer.toJson<int?>(notificationId),
      'enabled': serializer.toJson<bool>(enabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'remoteId': serializer.toJson<String?>(remoteId),
    };
  }

  Reminder copyWith({
    String? id,
    String? title,
    Value<String?> body = const Value.absent(),
    DateTime? scheduledAt,
    Value<String?> relatedBillId = const Value.absent(),
    Value<int?> notificationId = const Value.absent(),
    bool? enabled,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> remoteId = const Value.absent(),
  }) => Reminder(
    id: id ?? this.id,
    title: title ?? this.title,
    body: body.present ? body.value : this.body,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    relatedBillId: relatedBillId.present
        ? relatedBillId.value
        : this.relatedBillId,
    notificationId: notificationId.present
        ? notificationId.value
        : this.notificationId,
    enabled: enabled ?? this.enabled,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
  );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      relatedBillId: data.relatedBillId.present
          ? data.relatedBillId.value
          : this.relatedBillId,
      notificationId: data.notificationId.present
          ? data.notificationId.value
          : this.notificationId,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('relatedBillId: $relatedBillId, ')
          ..write('notificationId: $notificationId, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('remoteId: $remoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    body,
    scheduledAt,
    relatedBillId,
    notificationId,
    enabled,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    remoteId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.scheduledAt == this.scheduledAt &&
          other.relatedBillId == this.relatedBillId &&
          other.notificationId == this.notificationId &&
          other.enabled == this.enabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.remoteId == this.remoteId);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> body;
  final Value<DateTime> scheduledAt;
  final Value<String?> relatedBillId;
  final Value<int?> notificationId;
  final Value<bool> enabled;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> remoteId;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.relatedBillId = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.enabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    required String id,
    required String title,
    this.body = const Value.absent(),
    required DateTime scheduledAt,
    this.relatedBillId = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.enabled = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       scheduledAt = Value(scheduledAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Reminder> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<DateTime>? scheduledAt,
    Expression<String>? relatedBillId,
    Expression<int>? notificationId,
    Expression<bool>? enabled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? remoteId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (relatedBillId != null) 'related_bill_id': relatedBillId,
      if (notificationId != null) 'notification_id': notificationId,
      if (enabled != null) 'enabled': enabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (remoteId != null) 'remote_id': remoteId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? body,
    Value<DateTime>? scheduledAt,
    Value<String?>? relatedBillId,
    Value<int?>? notificationId,
    Value<bool>? enabled,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? remoteId,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      relatedBillId: relatedBillId ?? this.relatedBillId,
      notificationId: notificationId ?? this.notificationId,
      enabled: enabled ?? this.enabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      remoteId: remoteId ?? this.remoteId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (relatedBillId.present) {
      map['related_bill_id'] = Variable<String>(relatedBillId.value);
    }
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('relatedBillId: $relatedBillId, ')
          ..write('notificationId: $notificationId, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('remoteId: $remoteId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const AppSetting({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({String? key, String? value, DateTime? updatedAt}) =>
      AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncRecordsTable extends SyncRecords
    with TableInfo<$SyncRecordsTable, SyncRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _attemptCountMeta = const VerificationMeta(
    'attemptCount',
  );
  @override
  late final GeneratedColumn<int> attemptCount = GeneratedColumn<int>(
    'attempt_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    remoteId,
    operation,
    status,
    attemptCount,
    lastError,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('attempt_count')) {
      context.handle(
        _attemptCountMeta,
        attemptCount.isAcceptableOrUnknown(
          data['attempt_count']!,
          _attemptCountMeta,
        ),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      attemptCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempt_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncRecordsTable createAlias(String alias) {
    return $SyncRecordsTable(attachedDatabase, alias);
  }
}

class SyncRecord extends DataClass implements Insertable<SyncRecord> {
  final String id;
  final String entityType;
  final String entityId;
  final String? remoteId;
  final String operation;
  final String status;
  final int attemptCount;
  final String? lastError;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SyncRecord({
    required this.id,
    required this.entityType,
    required this.entityId,
    this.remoteId,
    required this.operation,
    required this.status,
    required this.attemptCount,
    this.lastError,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['operation'] = Variable<String>(operation);
    map['status'] = Variable<String>(status);
    map['attempt_count'] = Variable<int>(attemptCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncRecordsCompanion toCompanion(bool nullToAbsent) {
    return SyncRecordsCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      operation: Value(operation),
      status: Value(status),
      attemptCount: Value(attemptCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncRecord(
      id: serializer.fromJson<String>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      operation: serializer.fromJson<String>(json['operation']),
      status: serializer.fromJson<String>(json['status']),
      attemptCount: serializer.fromJson<int>(json['attemptCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'remoteId': serializer.toJson<String?>(remoteId),
      'operation': serializer.toJson<String>(operation),
      'status': serializer.toJson<String>(status),
      'attemptCount': serializer.toJson<int>(attemptCount),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncRecord copyWith({
    String? id,
    String? entityType,
    String? entityId,
    Value<String?> remoteId = const Value.absent(),
    String? operation,
    String? status,
    int? attemptCount,
    Value<String?> lastError = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SyncRecord(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    operation: operation ?? this.operation,
    status: status ?? this.status,
    attemptCount: attemptCount ?? this.attemptCount,
    lastError: lastError.present ? lastError.value : this.lastError,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncRecord copyWithCompanion(SyncRecordsCompanion data) {
    return SyncRecord(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      operation: data.operation.present ? data.operation.value : this.operation,
      status: data.status.present ? data.status.value : this.status,
      attemptCount: data.attemptCount.present
          ? data.attemptCount.value
          : this.attemptCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncRecord(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('remoteId: $remoteId, ')
          ..write('operation: $operation, ')
          ..write('status: $status, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    remoteId,
    operation,
    status,
    attemptCount,
    lastError,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncRecord &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.remoteId == this.remoteId &&
          other.operation == this.operation &&
          other.status == this.status &&
          other.attemptCount == this.attemptCount &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SyncRecordsCompanion extends UpdateCompanion<SyncRecord> {
  final Value<String> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String?> remoteId;
  final Value<String> operation;
  final Value<String> status;
  final Value<int> attemptCount;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncRecordsCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.operation = const Value.absent(),
    this.status = const Value.absent(),
    this.attemptCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncRecordsCompanion.insert({
    required String id,
    required String entityType,
    required String entityId,
    this.remoteId = const Value.absent(),
    required String operation,
    this.status = const Value.absent(),
    this.attemptCount = const Value.absent(),
    this.lastError = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       entityType = Value(entityType),
       entityId = Value(entityId),
       operation = Value(operation),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SyncRecord> custom({
    Expression<String>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? remoteId,
    Expression<String>? operation,
    Expression<String>? status,
    Expression<int>? attemptCount,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (remoteId != null) 'remote_id': remoteId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
      if (attemptCount != null) 'attempt_count': attemptCount,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String?>? remoteId,
    Value<String>? operation,
    Value<String>? status,
    Value<int>? attemptCount,
    Value<String?>? lastError,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SyncRecordsCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      remoteId: remoteId ?? this.remoteId,
      operation: operation ?? this.operation,
      status: status ?? this.status,
      attemptCount: attemptCount ?? this.attemptCount,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (attemptCount.present) {
      map['attempt_count'] = Variable<int>(attemptCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncRecordsCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('remoteId: $remoteId, ')
          ..write('operation: $operation, ')
          ..write('status: $status, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SimCardsTable simCards = $SimCardsTable(this);
  late final $BankCardsTable bankCards = $BankCardsTable(this);
  late final $BillsTable bills = $BillsTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $SyncRecordsTable syncRecords = $SyncRecordsTable(this);
  late final SimCardsDao simCardsDao = SimCardsDao(this as AppDatabase);
  late final BankCardsDao bankCardsDao = BankCardsDao(this as AppDatabase);
  late final BillsDao billsDao = BillsDao(this as AppDatabase);
  late final RemindersDao remindersDao = RemindersDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    simCards,
    bankCards,
    bills,
    reminders,
    appSettings,
    syncRecords,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'bank_cards',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('bills', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'sim_cards',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('bills', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'bills',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reminders', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$SimCardsTableCreateCompanionBuilder =
    SimCardsCompanion Function({
      required String id,
      required String carrierName,
      required String phoneNumber,
      Value<String?> planName,
      Value<int?> monthlyFeeCents,
      Value<int?> billingDay,
      Value<DateTime?> renewalDate,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> remoteId,
      Value<int> rowid,
    });
typedef $$SimCardsTableUpdateCompanionBuilder =
    SimCardsCompanion Function({
      Value<String> id,
      Value<String> carrierName,
      Value<String> phoneNumber,
      Value<String?> planName,
      Value<int?> monthlyFeeCents,
      Value<int?> billingDay,
      Value<DateTime?> renewalDate,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> remoteId,
      Value<int> rowid,
    });

final class $$SimCardsTableReferences
    extends BaseReferences<_$AppDatabase, $SimCardsTable, SimCard> {
  $$SimCardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BillsTable, List<Bill>> _billsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.bills,
    aliasName: $_aliasNameGenerator(db.simCards.id, db.bills.simCardId),
  );

  $$BillsTableProcessedTableManager get billsRefs {
    final manager = $$BillsTableTableManager(
      $_db,
      $_db.bills,
    ).filter((f) => f.simCardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_billsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SimCardsTableFilterComposer
    extends Composer<_$AppDatabase, $SimCardsTable> {
  $$SimCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get carrierName => $composableBuilder(
    column: $table.carrierName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planName => $composableBuilder(
    column: $table.planName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get monthlyFeeCents => $composableBuilder(
    column: $table.monthlyFeeCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get billingDay => $composableBuilder(
    column: $table.billingDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get renewalDate => $composableBuilder(
    column: $table.renewalDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> billsRefs(
    Expression<bool> Function($$BillsTableFilterComposer f) f,
  ) {
    final $$BillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bills,
      getReferencedColumn: (t) => t.simCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillsTableFilterComposer(
            $db: $db,
            $table: $db.bills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SimCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $SimCardsTable> {
  $$SimCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get carrierName => $composableBuilder(
    column: $table.carrierName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planName => $composableBuilder(
    column: $table.planName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get monthlyFeeCents => $composableBuilder(
    column: $table.monthlyFeeCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get billingDay => $composableBuilder(
    column: $table.billingDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get renewalDate => $composableBuilder(
    column: $table.renewalDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SimCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SimCardsTable> {
  $$SimCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get carrierName => $composableBuilder(
    column: $table.carrierName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get planName =>
      $composableBuilder(column: $table.planName, builder: (column) => column);

  GeneratedColumn<int> get monthlyFeeCents => $composableBuilder(
    column: $table.monthlyFeeCents,
    builder: (column) => column,
  );

  GeneratedColumn<int> get billingDay => $composableBuilder(
    column: $table.billingDay,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get renewalDate => $composableBuilder(
    column: $table.renewalDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  Expression<T> billsRefs<T extends Object>(
    Expression<T> Function($$BillsTableAnnotationComposer a) f,
  ) {
    final $$BillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bills,
      getReferencedColumn: (t) => t.simCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillsTableAnnotationComposer(
            $db: $db,
            $table: $db.bills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SimCardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SimCardsTable,
          SimCard,
          $$SimCardsTableFilterComposer,
          $$SimCardsTableOrderingComposer,
          $$SimCardsTableAnnotationComposer,
          $$SimCardsTableCreateCompanionBuilder,
          $$SimCardsTableUpdateCompanionBuilder,
          (SimCard, $$SimCardsTableReferences),
          SimCard,
          PrefetchHooks Function({bool billsRefs})
        > {
  $$SimCardsTableTableManager(_$AppDatabase db, $SimCardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SimCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SimCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SimCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> carrierName = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
                Value<String?> planName = const Value.absent(),
                Value<int?> monthlyFeeCents = const Value.absent(),
                Value<int?> billingDay = const Value.absent(),
                Value<DateTime?> renewalDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SimCardsCompanion(
                id: id,
                carrierName: carrierName,
                phoneNumber: phoneNumber,
                planName: planName,
                monthlyFeeCents: monthlyFeeCents,
                billingDay: billingDay,
                renewalDate: renewalDate,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                remoteId: remoteId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String carrierName,
                required String phoneNumber,
                Value<String?> planName = const Value.absent(),
                Value<int?> monthlyFeeCents = const Value.absent(),
                Value<int?> billingDay = const Value.absent(),
                Value<DateTime?> renewalDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SimCardsCompanion.insert(
                id: id,
                carrierName: carrierName,
                phoneNumber: phoneNumber,
                planName: planName,
                monthlyFeeCents: monthlyFeeCents,
                billingDay: billingDay,
                renewalDate: renewalDate,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                remoteId: remoteId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SimCardsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({billsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (billsRefs) db.bills],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (billsRefs)
                    await $_getPrefetchedData<SimCard, $SimCardsTable, Bill>(
                      currentTable: table,
                      referencedTable: $$SimCardsTableReferences
                          ._billsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SimCardsTableReferences(db, table, p0).billsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.simCardId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SimCardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SimCardsTable,
      SimCard,
      $$SimCardsTableFilterComposer,
      $$SimCardsTableOrderingComposer,
      $$SimCardsTableAnnotationComposer,
      $$SimCardsTableCreateCompanionBuilder,
      $$SimCardsTableUpdateCompanionBuilder,
      (SimCard, $$SimCardsTableReferences),
      SimCard,
      PrefetchHooks Function({bool billsRefs})
    >;
typedef $$BankCardsTableCreateCompanionBuilder =
    BankCardsCompanion Function({
      required String id,
      required String bankName,
      Value<String?> cardName,
      required String lastFourDigits,
      Value<int?> statementDay,
      Value<int?> paymentDueDay,
      Value<int?> creditLimitCents,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> remoteId,
      Value<int> rowid,
    });
typedef $$BankCardsTableUpdateCompanionBuilder =
    BankCardsCompanion Function({
      Value<String> id,
      Value<String> bankName,
      Value<String?> cardName,
      Value<String> lastFourDigits,
      Value<int?> statementDay,
      Value<int?> paymentDueDay,
      Value<int?> creditLimitCents,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> remoteId,
      Value<int> rowid,
    });

final class $$BankCardsTableReferences
    extends BaseReferences<_$AppDatabase, $BankCardsTable, BankCard> {
  $$BankCardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BillsTable, List<Bill>> _billsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.bills,
    aliasName: $_aliasNameGenerator(db.bankCards.id, db.bills.bankCardId),
  );

  $$BillsTableProcessedTableManager get billsRefs {
    final manager = $$BillsTableTableManager(
      $_db,
      $_db.bills,
    ).filter((f) => f.bankCardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_billsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BankCardsTableFilterComposer
    extends Composer<_$AppDatabase, $BankCardsTable> {
  $$BankCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cardName => $composableBuilder(
    column: $table.cardName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastFourDigits => $composableBuilder(
    column: $table.lastFourDigits,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get statementDay => $composableBuilder(
    column: $table.statementDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paymentDueDay => $composableBuilder(
    column: $table.paymentDueDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get creditLimitCents => $composableBuilder(
    column: $table.creditLimitCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> billsRefs(
    Expression<bool> Function($$BillsTableFilterComposer f) f,
  ) {
    final $$BillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bills,
      getReferencedColumn: (t) => t.bankCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillsTableFilterComposer(
            $db: $db,
            $table: $db.bills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BankCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $BankCardsTable> {
  $$BankCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cardName => $composableBuilder(
    column: $table.cardName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastFourDigits => $composableBuilder(
    column: $table.lastFourDigits,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get statementDay => $composableBuilder(
    column: $table.statementDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paymentDueDay => $composableBuilder(
    column: $table.paymentDueDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get creditLimitCents => $composableBuilder(
    column: $table.creditLimitCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BankCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BankCardsTable> {
  $$BankCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get cardName =>
      $composableBuilder(column: $table.cardName, builder: (column) => column);

  GeneratedColumn<String> get lastFourDigits => $composableBuilder(
    column: $table.lastFourDigits,
    builder: (column) => column,
  );

  GeneratedColumn<int> get statementDay => $composableBuilder(
    column: $table.statementDay,
    builder: (column) => column,
  );

  GeneratedColumn<int> get paymentDueDay => $composableBuilder(
    column: $table.paymentDueDay,
    builder: (column) => column,
  );

  GeneratedColumn<int> get creditLimitCents => $composableBuilder(
    column: $table.creditLimitCents,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  Expression<T> billsRefs<T extends Object>(
    Expression<T> Function($$BillsTableAnnotationComposer a) f,
  ) {
    final $$BillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.bills,
      getReferencedColumn: (t) => t.bankCardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillsTableAnnotationComposer(
            $db: $db,
            $table: $db.bills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BankCardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BankCardsTable,
          BankCard,
          $$BankCardsTableFilterComposer,
          $$BankCardsTableOrderingComposer,
          $$BankCardsTableAnnotationComposer,
          $$BankCardsTableCreateCompanionBuilder,
          $$BankCardsTableUpdateCompanionBuilder,
          (BankCard, $$BankCardsTableReferences),
          BankCard,
          PrefetchHooks Function({bool billsRefs})
        > {
  $$BankCardsTableTableManager(_$AppDatabase db, $BankCardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BankCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BankCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BankCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> bankName = const Value.absent(),
                Value<String?> cardName = const Value.absent(),
                Value<String> lastFourDigits = const Value.absent(),
                Value<int?> statementDay = const Value.absent(),
                Value<int?> paymentDueDay = const Value.absent(),
                Value<int?> creditLimitCents = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BankCardsCompanion(
                id: id,
                bankName: bankName,
                cardName: cardName,
                lastFourDigits: lastFourDigits,
                statementDay: statementDay,
                paymentDueDay: paymentDueDay,
                creditLimitCents: creditLimitCents,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                remoteId: remoteId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String bankName,
                Value<String?> cardName = const Value.absent(),
                required String lastFourDigits,
                Value<int?> statementDay = const Value.absent(),
                Value<int?> paymentDueDay = const Value.absent(),
                Value<int?> creditLimitCents = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BankCardsCompanion.insert(
                id: id,
                bankName: bankName,
                cardName: cardName,
                lastFourDigits: lastFourDigits,
                statementDay: statementDay,
                paymentDueDay: paymentDueDay,
                creditLimitCents: creditLimitCents,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                remoteId: remoteId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BankCardsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({billsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (billsRefs) db.bills],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (billsRefs)
                    await $_getPrefetchedData<BankCard, $BankCardsTable, Bill>(
                      currentTable: table,
                      referencedTable: $$BankCardsTableReferences
                          ._billsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BankCardsTableReferences(db, table, p0).billsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.bankCardId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BankCardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BankCardsTable,
      BankCard,
      $$BankCardsTableFilterComposer,
      $$BankCardsTableOrderingComposer,
      $$BankCardsTableAnnotationComposer,
      $$BankCardsTableCreateCompanionBuilder,
      $$BankCardsTableUpdateCompanionBuilder,
      (BankCard, $$BankCardsTableReferences),
      BankCard,
      PrefetchHooks Function({bool billsRefs})
    >;
typedef $$BillsTableCreateCompanionBuilder =
    BillsCompanion Function({
      required String id,
      required String title,
      required int amountCents,
      required DateTime dueDate,
      Value<DateTime?> paidAt,
      Value<String?> bankCardId,
      Value<String?> simCardId,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> remoteId,
      Value<int> rowid,
    });
typedef $$BillsTableUpdateCompanionBuilder =
    BillsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int> amountCents,
      Value<DateTime> dueDate,
      Value<DateTime?> paidAt,
      Value<String?> bankCardId,
      Value<String?> simCardId,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> remoteId,
      Value<int> rowid,
    });

final class $$BillsTableReferences
    extends BaseReferences<_$AppDatabase, $BillsTable, Bill> {
  $$BillsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BankCardsTable _bankCardIdTable(_$AppDatabase db) => db.bankCards
      .createAlias($_aliasNameGenerator(db.bills.bankCardId, db.bankCards.id));

  $$BankCardsTableProcessedTableManager? get bankCardId {
    final $_column = $_itemColumn<String>('bank_card_id');
    if ($_column == null) return null;
    final manager = $$BankCardsTableTableManager(
      $_db,
      $_db.bankCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bankCardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SimCardsTable _simCardIdTable(_$AppDatabase db) => db.simCards
      .createAlias($_aliasNameGenerator(db.bills.simCardId, db.simCards.id));

  $$SimCardsTableProcessedTableManager? get simCardId {
    final $_column = $_itemColumn<String>('sim_card_id');
    if ($_column == null) return null;
    final manager = $$SimCardsTableTableManager(
      $_db,
      $_db.simCards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_simCardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RemindersTable, List<Reminder>>
  _remindersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reminders,
    aliasName: $_aliasNameGenerator(db.bills.id, db.reminders.relatedBillId),
  );

  $$RemindersTableProcessedTableManager get remindersRefs {
    final manager = $$RemindersTableTableManager(
      $_db,
      $_db.reminders,
    ).filter((f) => f.relatedBillId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BillsTableFilterComposer extends Composer<_$AppDatabase, $BillsTable> {
  $$BillsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountCents => $composableBuilder(
    column: $table.amountCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paidAt => $composableBuilder(
    column: $table.paidAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  $$BankCardsTableFilterComposer get bankCardId {
    final $$BankCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bankCardId,
      referencedTable: $db.bankCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BankCardsTableFilterComposer(
            $db: $db,
            $table: $db.bankCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SimCardsTableFilterComposer get simCardId {
    final $$SimCardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.simCardId,
      referencedTable: $db.simCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SimCardsTableFilterComposer(
            $db: $db,
            $table: $db.simCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> remindersRefs(
    Expression<bool> Function($$RemindersTableFilterComposer f) f,
  ) {
    final $$RemindersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.relatedBillId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableFilterComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BillsTableOrderingComposer
    extends Composer<_$AppDatabase, $BillsTable> {
  $$BillsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountCents => $composableBuilder(
    column: $table.amountCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paidAt => $composableBuilder(
    column: $table.paidAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  $$BankCardsTableOrderingComposer get bankCardId {
    final $$BankCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bankCardId,
      referencedTable: $db.bankCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BankCardsTableOrderingComposer(
            $db: $db,
            $table: $db.bankCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SimCardsTableOrderingComposer get simCardId {
    final $$SimCardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.simCardId,
      referencedTable: $db.simCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SimCardsTableOrderingComposer(
            $db: $db,
            $table: $db.simCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BillsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BillsTable> {
  $$BillsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get amountCents => $composableBuilder(
    column: $table.amountCents,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get paidAt =>
      $composableBuilder(column: $table.paidAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  $$BankCardsTableAnnotationComposer get bankCardId {
    final $$BankCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bankCardId,
      referencedTable: $db.bankCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BankCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.bankCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SimCardsTableAnnotationComposer get simCardId {
    final $$SimCardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.simCardId,
      referencedTable: $db.simCards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SimCardsTableAnnotationComposer(
            $db: $db,
            $table: $db.simCards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> remindersRefs<T extends Object>(
    Expression<T> Function($$RemindersTableAnnotationComposer a) f,
  ) {
    final $$RemindersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.relatedBillId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableAnnotationComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BillsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BillsTable,
          Bill,
          $$BillsTableFilterComposer,
          $$BillsTableOrderingComposer,
          $$BillsTableAnnotationComposer,
          $$BillsTableCreateCompanionBuilder,
          $$BillsTableUpdateCompanionBuilder,
          (Bill, $$BillsTableReferences),
          Bill,
          PrefetchHooks Function({
            bool bankCardId,
            bool simCardId,
            bool remindersRefs,
          })
        > {
  $$BillsTableTableManager(_$AppDatabase db, $BillsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BillsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BillsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BillsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> amountCents = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
                Value<DateTime?> paidAt = const Value.absent(),
                Value<String?> bankCardId = const Value.absent(),
                Value<String?> simCardId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BillsCompanion(
                id: id,
                title: title,
                amountCents: amountCents,
                dueDate: dueDate,
                paidAt: paidAt,
                bankCardId: bankCardId,
                simCardId: simCardId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                remoteId: remoteId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required int amountCents,
                required DateTime dueDate,
                Value<DateTime?> paidAt = const Value.absent(),
                Value<String?> bankCardId = const Value.absent(),
                Value<String?> simCardId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BillsCompanion.insert(
                id: id,
                title: title,
                amountCents: amountCents,
                dueDate: dueDate,
                paidAt: paidAt,
                bankCardId: bankCardId,
                simCardId: simCardId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                remoteId: remoteId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BillsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({bankCardId = false, simCardId = false, remindersRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (remindersRefs) db.reminders],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (bankCardId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.bankCardId,
                                    referencedTable: $$BillsTableReferences
                                        ._bankCardIdTable(db),
                                    referencedColumn: $$BillsTableReferences
                                        ._bankCardIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (simCardId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.simCardId,
                                    referencedTable: $$BillsTableReferences
                                        ._simCardIdTable(db),
                                    referencedColumn: $$BillsTableReferences
                                        ._simCardIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (remindersRefs)
                        await $_getPrefetchedData<Bill, $BillsTable, Reminder>(
                          currentTable: table,
                          referencedTable: $$BillsTableReferences
                              ._remindersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BillsTableReferences(
                                db,
                                table,
                                p0,
                              ).remindersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.relatedBillId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BillsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BillsTable,
      Bill,
      $$BillsTableFilterComposer,
      $$BillsTableOrderingComposer,
      $$BillsTableAnnotationComposer,
      $$BillsTableCreateCompanionBuilder,
      $$BillsTableUpdateCompanionBuilder,
      (Bill, $$BillsTableReferences),
      Bill,
      PrefetchHooks Function({
        bool bankCardId,
        bool simCardId,
        bool remindersRefs,
      })
    >;
typedef $$RemindersTableCreateCompanionBuilder =
    RemindersCompanion Function({
      required String id,
      required String title,
      Value<String?> body,
      required DateTime scheduledAt,
      Value<String?> relatedBillId,
      Value<int?> notificationId,
      Value<bool> enabled,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> remoteId,
      Value<int> rowid,
    });
typedef $$RemindersTableUpdateCompanionBuilder =
    RemindersCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> body,
      Value<DateTime> scheduledAt,
      Value<String?> relatedBillId,
      Value<int?> notificationId,
      Value<bool> enabled,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> remoteId,
      Value<int> rowid,
    });

final class $$RemindersTableReferences
    extends BaseReferences<_$AppDatabase, $RemindersTable, Reminder> {
  $$RemindersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BillsTable _relatedBillIdTable(_$AppDatabase db) =>
      db.bills.createAlias(
        $_aliasNameGenerator(db.reminders.relatedBillId, db.bills.id),
      );

  $$BillsTableProcessedTableManager? get relatedBillId {
    final $_column = $_itemColumn<String>('related_bill_id');
    if ($_column == null) return null;
    final manager = $$BillsTableTableManager(
      $_db,
      $_db.bills,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_relatedBillIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  $$BillsTableFilterComposer get relatedBillId {
    final $$BillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedBillId,
      referencedTable: $db.bills,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillsTableFilterComposer(
            $db: $db,
            $table: $db.bills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  $$BillsTableOrderingComposer get relatedBillId {
    final $$BillsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedBillId,
      referencedTable: $db.bills,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillsTableOrderingComposer(
            $db: $db,
            $table: $db.bills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  $$BillsTableAnnotationComposer get relatedBillId {
    final $$BillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedBillId,
      referencedTable: $db.bills,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillsTableAnnotationComposer(
            $db: $db,
            $table: $db.bills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          Reminder,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (Reminder, $$RemindersTableReferences),
          Reminder,
          PrefetchHooks Function({bool relatedBillId})
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> body = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<String?> relatedBillId = const Value.absent(),
                Value<int?> notificationId = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                title: title,
                body: body,
                scheduledAt: scheduledAt,
                relatedBillId: relatedBillId,
                notificationId: notificationId,
                enabled: enabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                remoteId: remoteId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> body = const Value.absent(),
                required DateTime scheduledAt,
                Value<String?> relatedBillId = const Value.absent(),
                Value<int?> notificationId = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                title: title,
                body: body,
                scheduledAt: scheduledAt,
                relatedBillId: relatedBillId,
                notificationId: notificationId,
                enabled: enabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                remoteId: remoteId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RemindersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({relatedBillId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (relatedBillId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.relatedBillId,
                                referencedTable: $$RemindersTableReferences
                                    ._relatedBillIdTable(db),
                                referencedColumn: $$RemindersTableReferences
                                    ._relatedBillIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      Reminder,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (Reminder, $$RemindersTableReferences),
      Reminder,
      PrefetchHooks Function({bool relatedBillId})
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;
typedef $$SyncRecordsTableCreateCompanionBuilder =
    SyncRecordsCompanion Function({
      required String id,
      required String entityType,
      required String entityId,
      Value<String?> remoteId,
      required String operation,
      Value<String> status,
      Value<int> attemptCount,
      Value<String?> lastError,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SyncRecordsTableUpdateCompanionBuilder =
    SyncRecordsCompanion Function({
      Value<String> id,
      Value<String> entityType,
      Value<String> entityId,
      Value<String?> remoteId,
      Value<String> operation,
      Value<String> status,
      Value<int> attemptCount,
      Value<String?> lastError,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SyncRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncRecordsTable> {
  $$SyncRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncRecordsTable> {
  $$SyncRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncRecordsTable> {
  $$SyncRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncRecordsTable,
          SyncRecord,
          $$SyncRecordsTableFilterComposer,
          $$SyncRecordsTableOrderingComposer,
          $$SyncRecordsTableAnnotationComposer,
          $$SyncRecordsTableCreateCompanionBuilder,
          $$SyncRecordsTableUpdateCompanionBuilder,
          (
            SyncRecord,
            BaseReferences<_$AppDatabase, $SyncRecordsTable, SyncRecord>,
          ),
          SyncRecord,
          PrefetchHooks Function()
        > {
  $$SyncRecordsTableTableManager(_$AppDatabase db, $SyncRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncRecordsCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                remoteId: remoteId,
                operation: operation,
                status: status,
                attemptCount: attemptCount,
                lastError: lastError,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String entityType,
                required String entityId,
                Value<String?> remoteId = const Value.absent(),
                required String operation,
                Value<String> status = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SyncRecordsCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                remoteId: remoteId,
                operation: operation,
                status: status,
                attemptCount: attemptCount,
                lastError: lastError,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncRecordsTable,
      SyncRecord,
      $$SyncRecordsTableFilterComposer,
      $$SyncRecordsTableOrderingComposer,
      $$SyncRecordsTableAnnotationComposer,
      $$SyncRecordsTableCreateCompanionBuilder,
      $$SyncRecordsTableUpdateCompanionBuilder,
      (
        SyncRecord,
        BaseReferences<_$AppDatabase, $SyncRecordsTable, SyncRecord>,
      ),
      SyncRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SimCardsTableTableManager get simCards =>
      $$SimCardsTableTableManager(_db, _db.simCards);
  $$BankCardsTableTableManager get bankCards =>
      $$BankCardsTableTableManager(_db, _db.bankCards);
  $$BillsTableTableManager get bills =>
      $$BillsTableTableManager(_db, _db.bills);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$SyncRecordsTableTableManager get syncRecords =>
      $$SyncRecordsTableTableManager(_db, _db.syncRecords);
}
