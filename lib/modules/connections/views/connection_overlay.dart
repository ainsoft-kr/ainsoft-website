import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/connection_view_model.dart';

class ConnectionOverlay extends StatelessWidget {
  const ConnectionOverlay({
    super.key,
    required this.child,
    this.alignment = Alignment.bottomCenter,
  });

  final Widget child;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    final controller = inject<ConnectionViewModel>();

    return Stack(
      children: [
        child,
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            switch (controller.connectionType) {
              case ConnectivityType.connecting:
                return const _StatusBanner(label: 'Reconnecting...');
              case ConnectivityType.disconnected:
              case ConnectivityType.noInternet:
                return _OfflineStatusCard(controller: controller);
              case ConnectivityType.mobileData:
              case ConnectivityType.wifi:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

class _OfflineStatusCard extends StatelessWidget {
  const _OfflineStatusCard({required this.controller});

  final ConnectionViewModel controller;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Material(
      color: Colors.black26,
      child: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: cs.errorContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.wifi_off_outlined,
                  color: cs.onErrorContainer,
                  size: 40,
                ),
                const SizedBox(height: 16),
                Text(
                  'Connection lost',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: cs.onErrorContainer,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We will reconnect automatically when the network is back.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: cs.onErrorContainer,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Offline for ${controller.dialogTimer}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: cs.onErrorContainer,
                      ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: controller.getConnectivity,
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusBanner extends StatelessWidget {
  const _StatusBanner({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      child: Container(
        width: double.infinity,
        color: cs.surfaceContainerHighest,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: Text(label)),
            const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ],
        ),
      ),
    );
  }
}
