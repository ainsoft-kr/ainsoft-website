import 'package:flutter_modular/flutter_modular.dart';

class _TestModule extends Module {
  _TestModule(this._register);

  final void Function(Injector i) _register;

  @override
  void binds(Injector i) => _register(i);
}

/// Registers instances for widgets that resolve dependencies through
/// `Modular.get`. Pair with [unbindTestModule] in `tearDown`.
void bindTestModule(void Function(Injector i) register) {
  Modular.bindModule(_TestModule(register));
}

void unbindTestModule() => Modular.destroy();
