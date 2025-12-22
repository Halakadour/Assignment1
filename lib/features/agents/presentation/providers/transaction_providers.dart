import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/transaction_supabse_datasource.dart';
import '../../data/repos/transaction_repo.dart';
import '../../domain/models/transaction_model.dart';

final transactionsRepositoryProvider = Provider<TransactionRepo>((ref) {
  return TransactionSupabseDatasource();
});

final transactionsProvider =
    AsyncNotifierProvider.family<
      TransactionsNotifier,
      List<TransactionModel>,
      String
    >(TransactionsNotifier.new);

class TransactionsNotifier extends AsyncNotifier<List<TransactionModel>> {
  late final TransactionRepo _repo;
  final String id;
  TransactionsNotifier(this.id);

  @override
  Future<List<TransactionModel>> build() async {
    _repo = ref.read(transactionsRepositoryProvider);
    return _repo.getTransactionsList(id);
  }

  Future<void> addTransaction({
    required double amount,
    required String currency,
    required TransactionType type,
    String? details,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final newTx = await _repo.addTransaction(
        TransactionModel(
          id: "",
          agentId: id,
          amount: amount,
          currency: currency,
          type: type,
          createdAt: DateTime.now(),
        ),
      );

      final current = state.value ?? [];
      return [newTx, ...current];
    });
  }

  Future<void> deleteTransaction(String id) async {
    final current = state.value ?? [];

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _repo.deleteTransaction(id);
      return current.where((t) => t.id != id).toList();
    });
  }
}
