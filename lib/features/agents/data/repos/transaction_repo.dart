import '../../domain/models/transaction_model.dart';

abstract class TransactionRepo {
  Future<List<TransactionModel>> getTransactionsList(String agentId);
  Stream<List<TransactionModel>> getTransactionsStream(String agentId);
  Future<TransactionModel> addTransaction(TransactionModel transaction);
  Future<void> updateTransaction(TransactionModel transaction);
  Future<void> deleteTransaction(String transactionId);
}
