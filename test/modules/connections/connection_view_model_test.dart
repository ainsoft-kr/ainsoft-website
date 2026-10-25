import 'package:flutter_test/flutter_test.dart';
import 'package:getx_starter/modules/connections/controllers/connection_view_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ConnectionViewModel basics', () {
    test('starts in connecting state', () {
      final vm = ConnectionViewModel(autoInit: false);
      addTearDown(vm.dispose);

      expect(vm.connectionType, ConnectivityType.connecting);
      expect(vm.isConnected(), isFalse);
    });

    test('isConnected returns true only for wifi or mobileData', () {
      final vm = ConnectionViewModel(autoInit: false);
      addTearDown(vm.dispose);

      final expected = {
        ConnectivityType.connecting: false,
        ConnectivityType.disconnected: false,
        ConnectivityType.noInternet: false,
        ConnectivityType.wifi: true,
        ConnectivityType.mobileData: true,
      };

      for (final MapEntry(key: type, value: connected) in expected.entries) {
        vm.debugConnectionType = type;
        expect(vm.isConnected(), connected, reason: '$type');
      }
    });

    test('notifies listeners only when the state changes', () {
      final vm = ConnectionViewModel(autoInit: false);
      addTearDown(vm.dispose);
      var notifications = 0;
      vm.addListener(() => notifications++);

      vm.debugConnectionType = ConnectivityType.wifi;
      vm.debugConnectionType = ConnectivityType.wifi;

      expect(notifications, 1);
    });
  });
}
