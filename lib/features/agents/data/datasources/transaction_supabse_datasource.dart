import 'package:assignment_1/features/agents/domain/models/transaction_model.dart';

import '../../../../core/services/supabase_service.dart';
import '../repos/transaction_repo.dart';

class TransactionSupabseDatasource extends TransactionRepo {
  final _client = SupabaseService.client;
  final String _table = 'transactions';

  @override
  Future<TransactionModel> addTransaction(TransactionModel transaction) async {
    try {
      final res = await _client
          .from(_table)
          .insert({
            'agent_id': transaction.agentId,
            'amount': transaction.amount,
            'currency': transaction.currency,
            'type': transaction.type,
            'details': transaction.details,
          })
          .select()
          .single();

      return TransactionModel.fromJson(res);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteTransaction(String transactionId) async {
    await _client.from(_table).delete().eq('id', transactionId);
  }

  @override
  Future<List<TransactionModel>> getTransactionsList(String agentId) async {
    try {
      final response = await _client
          .from(_table)
          .select()
          .eq('agent_id', agentId)
          .order('created_at', ascending: false);
      return response.map((data) => TransactionModel.fromJson(data)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<List<TransactionModel>> getTransactionsStream(String agentId) {
    return _client
        .from(_table)
        .stream(primaryKey: ['id'])
        .eq('agent_id', agentId)
        .order('created_at', ascending: false)
        .map(
          (data) =>
              data.map((data) => TransactionModel.fromJson(data)).toList(),
        );
  }

  @override
  Future<void> updateTransaction(TransactionModel transaction) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }
}
