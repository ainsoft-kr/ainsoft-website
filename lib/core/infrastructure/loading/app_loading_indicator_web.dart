import 'dart:js_interop';

@JS('window.hideAinsoftLoading')
external void _hideAinsoftLoading();

void hideAinsoftLoading() => _hideAinsoftLoading();
