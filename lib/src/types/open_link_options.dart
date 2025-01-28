// ignore_for_file: non_constant_identifier_names

part of '../../flutter_telegram_miniapp.dart';

@JSExport()
class _OpenLinkOptions {
  bool try_instant_view;

  _OpenLinkOptions({
    this.try_instant_view = false,
  });

  OpenLinkOptionsExternal get _toExt =>
      createJSInteropWrapper<_OpenLinkOptions>(this) as OpenLinkOptionsExternal;
}

extension type OpenLinkOptionsExternal(JSObject _) implements JSObject {
  external JSBoolean try_instant_view;
}
