import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

final toggleProvider = NotifierProvider<ToggleNotifier, bool>(
  () => ToggleNotifier(),
);
