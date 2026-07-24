import 'dart:async';
import 'dart:js_interop';

/// Exception thrown when a Telegram WebApp method reports an error through its
/// Node-style `(error, result)` callback.
class TelegramMiniAppException implements Exception {
  const TelegramMiniAppException(this.message);

  /// Human-readable error message provided by the Telegram client.
  final String message;

  @override
  String toString() => 'TelegramMiniAppException: $message';
}

/// Bridges a Telegram WebApp Node-style callback (`(error, result)`) to a
/// [Future].
///
/// [invoke] is called with the JS callback that must be passed to the
/// underlying WebApp method. On success the raw `result` is mapped via [map];
/// on error the returned future completes with a [TelegramMiniAppException].
Future<R> completeNodeCallback<R>(
  R Function(JSAny? result) map,
  void Function(JSFunction callback) invoke,
) {
  final completer = Completer<R>();
  void callback(JSString? error, JSAny? result) {
    if (error != null) {
      completer.completeError(TelegramMiniAppException(error.toDart));
    } else {
      completer.complete(map(result));
    }
  }

  invoke(callback.toJS);
  return completer.future;
}
