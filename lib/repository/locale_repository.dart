import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class LocaleRepository {
  LocaleRepository(SharedPreferences sharedPreferences)
    : _sharedPreferences = sharedPreferences {
    _init();
  }

  final SharedPreferences _sharedPreferences;

  static const _kThemePersistenceKey = '__locale_persistence_key__';

  final _controller = StreamController<String>();

  Future<void> _setValue(String key, String value) =>
      _sharedPreferences.setString(key, value);

  String? _getValue(String key) {
    try {
      return _sharedPreferences.getString(key);
    } catch (_) {
      return null;
    }
  }

  void _init() {
    final savedLocale = _getValue(_kThemePersistenceKey);
    if (savedLocale != null) {
      if (savedLocale == 'en') {
        _controller.sink.add('en');
      } else {
        _controller.sink.add('es');
      }
    } else {
      _controller.sink.add('en');
    }
  }

  Stream<String> getLocale() async* {
    yield* _controller.stream;
  }

  Future<void> saveLocale(String newLocale) {
    _controller.sink.add(newLocale);
    return _setValue(_kThemePersistenceKey, newLocale);
  }

  void dispose() => _controller.close();
}