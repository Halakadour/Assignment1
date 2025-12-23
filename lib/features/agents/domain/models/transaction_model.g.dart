// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      id: json['id'] as String,
      agentId: json['agent_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      type: json['type'] as String,
      details: json['details'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agent_id': instance.agentId,
      'amount': instance.amount,
      'currency': instance.currency,
      'type': instance.type,
      'details': instance.details,
      'created_at': instance.createdAt.toIso8601String(),
    };
