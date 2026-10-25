import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';

import '/core/utils/date_time_extensions.dart';
import '../data/services/reachability_service.dart';

enum ConnectivityType { mobileData, wifi, disconnected, noInternet, connecting }

class ConnectionViewModel extends ChangeNotifier with WidgetsBindingObserver {
  ConnectionViewModel({
    ReachabilityService? reachability,
    Duration debounceDuration = const Duration(milliseconds: 250),
    this.onWentOfflineCallback,
    this.onBackOnlineCallback,
    bool autoInit = true,
  })  : _reachability = reachability ?? ReachabilityService(),
        _debounceDuration = debounceDuration {
    _connectivity = Connectivity();
    WidgetsBinding.instance.addObserver(this);

    if (autoInit) {
      getConnectivity();
      _listenToConnectivity();
    }
  }

  late final Connectivity _connectivity;
  final ReachabilityService _reachability;
  final VoidCallback? onWentOfflineCallback;
  final void Function(Duration offlineDuration)? onBackOnlineCallback;
  late final Duration _debounceDuration;

  StreamSubscription? _streamSubscription;
  Timer? _debounce;
  Timer? _connectionLostTimer;
  DateTime? _connectionLostDate;

  ConnectivityType _connectionType = ConnectivityType.connecting;
  String _dialogTimer = '00:00:00';
  bool _initialCheckCompleted = false;
  double _timerSeconds = 0.0;

  ConnectivityType get connectionType => _connectionType;
  String get dialogTimer => _dialogTimer;

  void _listenToConnectivity() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((dynamic result) {
      _debounce?.cancel();
      _debounce = Timer(_debounceDuration, () {
        if (result is List<ConnectivityResult>) {
          final first = result.isNotEmpty ? result.first : ConnectivityResult.none;
          _updateState(first);
          return;
        }

        if (result is ConnectivityResult) {
          _updateState(result);
          return;
        }

        _updateState(ConnectivityResult.none);
      });
    });
  }

  Future<void> getConnectivity() async {
    final dynamic connectivityResult = await _connectivity.checkConnectivity();
    final ConnectivityResult result = connectivityResult is List<ConnectivityResult>
        ? (connectivityResult.isNotEmpty ? connectivityResult.first : ConnectivityResult.none)
        : (connectivityResult is ConnectivityResult ? connectivityResult : ConnectivityResult.none);

    if (!_initialCheckCompleted && result == ConnectivityResult.none) {
      _setConnectionType(ConnectivityType.connecting);
      _initialCheckCompleted = true;
      return;
    }

    _initialCheckCompleted = true;
    await _updateState(result);
  }

  bool isConnected() {
    return _connectionType == ConnectivityType.wifi ||
        _connectionType == ConnectivityType.mobileData;
  }

  void _resetAndCancelTimer() {
    _timerSeconds = 0.0;
    _dialogTimer = '00:00:00';
    _connectionLostTimer?.cancel();
    notifyListeners();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getConnectivity();
    }
  }

  void _onConnected() {
    final wasOfflineFor = _connectionLostDate == null
        ? Duration.zero
        : DateTime.now().difference(_connectionLostDate!);
    _resetAndCancelTimer();
    if (onBackOnlineCallback != null) {
      onBackOnlineCallback!(wasOfflineFor);
    }
  }

  void _onLostConnection() {
    if (_connectionLostTimer?.isActive == true) return;

    _connectionLostDate = DateTime.now();
    onWentOfflineCallback?.call();

    _connectionLostTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _timerSeconds = DateTime.now().difference(_connectionLostDate!).inSeconds.toDouble();
      _dialogTimer = Duration(seconds: _timerSeconds.toInt()).format();
      notifyListeners();
    });
  }

  Future<void> _updateState(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.mobile:
        _setConnectionType(ConnectivityType.connecting);
        await _checkInternetConnection(mobile: true);
        break;
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.vpn:
      case ConnectivityResult.other:
        _setConnectionType(ConnectivityType.connecting);
        await _checkInternetConnection();
        break;
      case ConnectivityResult.none:
        _setConnectionType(ConnectivityType.disconnected);
        _onLostConnection();
        break;
    }
  }

  Future<void> _checkInternetConnection({bool mobile = false}) async {
    final ok = await _reachability.isReachable().catchError((_) => false);
    if (ok) {
      _setConnectionType(
        mobile ? ConnectivityType.mobileData : ConnectivityType.wifi,
      );
      _onConnected();
      return;
    }

    _setConnectionType(ConnectivityType.noInternet);
    _onLostConnection();
  }

  /// Lets tests drive the state without platform connectivity plugins.
  @visibleForTesting
  set debugConnectionType(ConnectivityType value) => _setConnectionType(value);

  void _setConnectionType(ConnectivityType value) {
    if (_connectionType == value) return;
    _connectionType = value;
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _debounce?.cancel();
    _streamSubscription?.cancel();
    _resetAndCancelTimer();
    super.dispose();
  }
}
