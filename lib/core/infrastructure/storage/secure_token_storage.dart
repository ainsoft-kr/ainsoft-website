import 'package:get_storage/get_storage.dart';
import 'contracts/token_storage.dart';

/// **SecureTokenStorage**
///
/// Singleton implementation of [TokenStorage] backed by local app storage.
///
/// **Why**
/// - Keep token access behind a dedicated interface.
/// - Provide synchronous reads via in-memory caches after initialization.
///
/// **Key Features**
/// - `initialize()` hydrates in-memory caches from local storage.
/// - Synchronous getters for common hot paths (HTTP header building).
/// - Writes delete keys when a null/empty value is provided.
///
/// **Example**
/// ```dart
/// await SecureTokenStorage.instance.initialize();
/// await SecureTokenStorage.instance.writeAccessToken('jwt');
/// final token = SecureTokenStorage.instance.readAccessTokenSync;
/// ```
///
// ────────────────────────────────────────────────
class SecureTokenStorage implements TokenStorage {
  SecureTokenStorage._internal();

  static final SecureTokenStorage _instance = SecureTokenStorage._internal();
  static SecureTokenStorage get instance => _instance;

  static const String _kAccess = 'accessToken';
  static const String _kRefresh = 'refreshToken';
  static const String _container = 'appName-app';

  late GetStorage _box;

  String? _accessCache;
  String? _refreshCache;

  /// **initialize**
  ///
  /// Hydrate in-memory caches from local storage.
  // ────────────────────────────────────────────────
  @override
  Future<void> initialize() async {
    await GetStorage.init(_container);
    _box = GetStorage(_container);
    _accessCache = _box.read<String>(_kAccess);
    _refreshCache = _box.read<String>(_kRefresh);
  }

  /// **readAccessTokenSync**
  // ────────────────────────────────────────────────
  @override
  String? get readAccessTokenSync => _accessCache;

  /// **readRefreshTokenSync**
  // ────────────────────────────────────────────────
  @override
  String? get readRefreshTokenSync => _refreshCache;

  /// **writeAccessToken**
  // ────────────────────────────────────────────────
  @override
  Future<void> writeAccessToken(String? value) async {
    _accessCache = value;
    if (value == null || value.isEmpty) {
      await _box.remove(_kAccess);
    } else {
      await _box.write(_kAccess, value);
    }
  }

  /// **writeRefreshToken**
  // ────────────────────────────────────────────────
  @override
  Future<void> writeRefreshToken(String? value) async {
    _refreshCache = value;
    if (value == null || value.isEmpty) {
      await _box.remove(_kRefresh);
    } else {
      await _box.write(_kRefresh, value);
    }
  }

  /// **clearTokens**
  // ────────────────────────────────────────────────
  @override
  Future<void> clearTokens() async {
    _accessCache = null;
    _refreshCache = null;
    await _box.remove(_kAccess);
    await _box.remove(_kRefresh);
  }
}
