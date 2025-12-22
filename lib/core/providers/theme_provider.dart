import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends Notifier<ThemeMode> {
  static const String key = "theme_mode";
  late SharedPreferences _prefs;

  @override
  ThemeMode build() {
    _loadTheme();
    return ThemeMode.system;
  }

  Future<void> _loadTheme() async {
    _prefs = await SharedPreferences.getInstance();
    final savedTheme = _prefs.getString(key);
    state = fromString(savedTheme);
  }

  ThemeMode fromString(String? mode) {
    return mode == "light"
        ? ThemeMode.light
        : mode == "dark"
        ? ThemeMode.dark
        : ThemeMode.dark;
  }

  Future<void> changeTheme(ThemeMode theme) async {
    state = theme;
    await _prefs.setString(key, fromTheme(theme));
  }

  void toggleTheme() {
    state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeMode getMode() {
    return state;
  }

  String fromTheme(ThemeMode mode) {
    return mode == ThemeMode.light
        ? "light"
        : mode == ThemeMode.dark
        ? "dark"
        : "system";
  }
}

final themeNotifierProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);
