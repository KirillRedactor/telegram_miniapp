enum WebAppChatType {
  sender,
  private,
  group,
  supergroup,
  channel,
  unknown;

  static WebAppChatType fromName(String name) {
    switch (name) {
      case "sender":
        return WebAppChatType.sender;
      case "private":
        return WebAppChatType.private;
      case "group":
        return WebAppChatType.group;
      case "supergroup":
        return WebAppChatType.supergroup;
      case "channel":
        return WebAppChatType.channel;
      default:
        return WebAppChatType.unknown;
    }
  }
}
