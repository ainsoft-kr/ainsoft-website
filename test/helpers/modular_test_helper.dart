import 'package:flutter_modular/flutter_modular.dart';

/// Registers instances for widgets that resolve dependencies through
/// `inject`. Pair with [unbindTestModule] in `tearDown`.
void bindTestModule(void Function(ModularContext c) register) {
  _bootstrap = bootstrapModule(createModule(register: register));
}

void unbindTestModule() {
  _bootstrap?.injector.dispose();
  _bootstrap = null;
}

ModularBootstrap? _bootstrap;
