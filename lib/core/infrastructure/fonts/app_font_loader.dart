import 'package:flutter/services.dart';

/// Loads the bundled Korean font before the first Flutter frame is rendered.
class AppFontLoader {
  AppFontLoader._();

  static const String family = 'Noto Sans KR';
  static const String asset = 'google_fonts/NotoSansKR[wght].ttf';

  static Future<void>? _loading;
  static bool _isReady = false;

  static bool get isReady => _isReady;

  static Future<void> ensureReady() {
    return _loading ??= _load();
  }

  static Future<void> _load() async {
    final loader = FontLoader(family)
      ..addFont(rootBundle.load(asset));

    await loader.load();
    _isReady = true;
  }
}
