enum EmojiStatusAccessRequestedStatus {
  allowed,
  cancelled;

  static EmojiStatusAccessRequestedStatus fromName(String name) {
    switch (name) {
      case "allowed":
        return EmojiStatusAccessRequestedStatus.allowed;
      case "cancelled":
        return EmojiStatusAccessRequestedStatus.cancelled;
      default:
        return EmojiStatusAccessRequestedStatus.cancelled;
    }
  }
}
