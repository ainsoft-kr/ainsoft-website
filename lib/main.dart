import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '/app.dart';
import '/app_module.dart';
import '/core/infrastructure/fonts/app_font_loader.dart';
import '/core/infrastructure/loading/app_loading_indicator.dart';
import '/core/infrastructure/storage/app_storage_service.dart';
import '/modules/locale/data/services/localization_service.dart';
import '/core/infrastructure/cache/cache_manager.dart';
import '/core/infrastructure/cache/contracts/cache_store.dart';
import '/core/infrastructure/cache/default_cache_key_strategy.dart';
import '/core/infrastructure/cache/simple_ttl_cache_policy.dart';
import '/core/infrastructure/cache/get_storage_cache_store.dart';
import '/core/infrastructure/http/api_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppFontLoader.ensureReady();
  await AppStorageService.instance.initialize();

  // Initialize localization with saved preference
  LocalizationService.init();
  // 1) Create a CacheStore backed by GetStorage (async factory ensures init)
  final CacheStore store = await GetStorageCacheStorage.create(
    container: AppStorageService.container, // aligned with preferences container
  );

  // 2) Choose key strategy and policy (defaults: cache GET only, 2xx, fixed TTL)
  const keyStrategy = DefaultCacheKeyStrategy();
  final policy = SimpleTimeToLiveCachePolicy(
    timeToLive: const Duration(hours: 6), // adjust TTL to your needs
    // cacheGetRequestsOnly: true, // default
  );

  // 3) Compose the manager and register it globally with ApiService
  final cacheManager = CacheManager(store, keyStrategy, policy);
  ApiService.configureCache(cacheManager);

  runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );

  WidgetsBinding.instance.addPostFrameCallback((_) {
    hideAinsoftLoading();
  });
}
