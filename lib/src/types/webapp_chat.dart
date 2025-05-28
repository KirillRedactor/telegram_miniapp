part of '../../flutter_telegram_miniapp.dart';

class WebAppChat {
  final int id;
  final WebAppChatType type;
  final String title;
  final String? username;
  final String? photoUrl;

  factory WebAppChat._fromExternal(WebAppChatExternal ext) => WebAppChat(
        id: ext.id.toDartInt,
        type: WebAppChatType.fromName(ext.type),
        title: ext.title,
        username: ext.username,
        photoUrl: ext.photoUrl,
      );

  WebAppChat({
    required this.id,
    required this.type,
    required this.title,
    this.username,
    this.photoUrl,
  });

  @override
  String toString() {
    return 'WebAppChat(id: $id, type: $type, title: $title, username: $username, photoUrl: $photoUrl)';
  }
}

extension type WebAppChatExternal(JSObject _) implements JSObject {
  external JSNumber id;
  external String type;
  external String title;
  external String? username;
  @JS("photo_url")
  external String? photoUrl;
}
