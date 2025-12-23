// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

enum TransactionType { credit, debit }

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    @JsonKey(name: 'agent_id') required String agentId,
    required double amount,
    required String currency, // USD | TRY | EUR
    required String type, // credit | debit
    String? details,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
