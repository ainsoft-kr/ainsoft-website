import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ainsoft_website/modules/connections/controllers/connection_view_model.dart';
import 'package:ainsoft_website/modules/connections/views/connection_overlay.dart';

import '../../helpers/modular_test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ConnectionOverlay', () {
    late ConnectionViewModel vm;

    setUp(() {
      // autoInit: false avoids platform connectivity calls in tests.
      vm = ConnectionViewModel(autoInit: false);
      bindTestModule((i) => i.addInstance<ConnectionViewModel>(vm));
    });

    tearDown(unbindTestModule);

    Widget buildApp() => const MaterialApp(
      home: Scaffold(body: ConnectionOverlay(child: SizedBox.shrink())),
    );

    testWidgets('shows a banner while reconnecting', (tester) async {
      await tester.pumpWidget(buildApp());

      expect(find.text('Reconnecting...'), findsOneWidget);
    });

    testWidgets('shows the offline card when there is no internet', (
      tester,
    ) async {
      await tester.pumpWidget(buildApp());

      vm.debugConnectionType = ConnectivityType.noInternet;
      await tester.pump();

      expect(find.text('Connection lost'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('shows nothing once connected', (tester) async {
      await tester.pumpWidget(buildApp());

      vm.debugConnectionType = ConnectivityType.wifi;
      await tester.pump();

      expect(find.text('Connection lost'), findsNothing);
      expect(find.text('Reconnecting...'), findsNothing);
    });
  });
}
