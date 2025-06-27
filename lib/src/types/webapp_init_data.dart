part of '../../flutter_telegram_miniapp.dart';

class WebAppInitData {
  final String? queryId;
  final WebAppUser? user;
  final WebAppUser? reveiver;
  final WebAppChat? chat;
  final WebAppChatType? chatType;
  final String? chatInstance;
  final String? startParam;
  final int? canSendAfter;
  final int authDate;
  final String hash;
  final String signature;

  DateTime get authDateDateTime =>
      DateTime.fromMillisecondsSinceEpoch(authDate * 1000);

  factory WebAppInitData._fromExternal(WebAppInitDataExternal ext) =>
      WebAppInitData(
        queryId: ext.queryId,
        user: ext.user != null ? WebAppUser._fromExternal(ext.user!) : null,
        reveiver: ext.receiver != null
            ? WebAppUser._fromExternal(ext.receiver!)
            : null,
        chat: ext.chat != null ? WebAppChat._fromExternal(ext.chat!) : null,
        chatType: ext.chatType != null
            ? WebAppChatType.fromName(ext.chatType!)
            : null,
        chatInstance: ext.chatInstance,
        startParam: ext.startParam,
        canSendAfter: ext.canSendAfter?.toDartInt,
        authDate: int.tryParse(ext.authDate) ?? 0,
        hash: ext.hash,
        signature: ext.signature,
      );

  WebAppInitData({
    this.queryId,
    this.user,
    this.reveiver,
    this.chat,
    this.chatType,
    this.chatInstance,
    this.startParam,
    this.canSendAfter,
    required this.authDate,
    required this.hash,
    required this.signature,
  });

  @override
  String toString() {
    return 'WebAppInitData(queryId: $queryId, user: $user, reveiver: $reveiver, chat: $chat, chatType: $chatType, chatInstance: $chatInstance, startParam: $startParam, canSendAfter: $canSendAfter, authDate: $authDate ($authDateDateTime), hash: $hash, signature: $signature)';
  }
}

extension type WebAppInitDataExternal(JSObject _) implements JSObject {
  @JS("query_id")
  external String? queryId;
  external WebAppUserExternal? user;
  external WebAppUserExternal? receiver;
  external WebAppChatExternal? chat;
  @JS("chat_type")
  external String? chatType;
  @JS("chat_instance")
  external String? chatInstance;
  @JS("start_param")
  external String? startParam;
  @JS("can_send_after")
  external JSNumber? canSendAfter;
  @JS("auth_date")
  external String authDate;
  external String hash;
  external String signature;
}
