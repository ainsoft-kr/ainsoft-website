import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_starter/modules/connections/controllers/connection_view_model.dart';
import 'package:getx_starter/modules/connections/views/connection_handler.dart';

import '../../helpers/modular_test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ConnectionHandler', () {
    late ConnectionViewModel vm;

    setUp(() {
      vm = ConnectionViewModel(autoInit: false);
      bindTestModule((i) => i.addInstance<ConnectionViewModel>(vm));
    });

    tearDown(unbindTestModule);

    testWidgets(
      'shows connecting widget, then retry UI offline, then connected content',
      (tester) async {
        var tries = 0;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ConnectionHandler(
                connectedWidget: const Text('CONNECTED'),
                onConnectingWidget: const Text('CONNECTING...'),
                tryAgainAction: () => tries++,
              ),
            ),
          ),
        );

        expect(find.text('CONNECTING...'), findsOneWidget);
        expect(find.text('CONNECTED'), findsNothing);

        vm.debugConnectionType = ConnectivityType.noInternet;
        await tester.pump();
        expect(find.text('Try again'), findsOneWidget);

        await tester.tap(find.text('Try again'));
        expect(tries, 1);

        vm.debugConnectionType = ConnectivityType.wifi;
        await tester.pump();
        expect(find.text('CONNECTED'), findsOneWidget);
      },
    );
  });
}
