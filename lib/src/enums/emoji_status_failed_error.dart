enum EmojiStatusFailedError {
  unsupported,
  suggestedEmojiInvalid,
  durationInvalid,
  userDeclined,
  serverError,
  unknownError;

  static EmojiStatusFailedError fromName(String name) {
    switch (name) {
      case "UNSUPPORTED":
        return EmojiStatusFailedError.unsupported;
      case "SUGGESTED_EMOJI_INVALID":
        return EmojiStatusFailedError.suggestedEmojiInvalid;
      case "DURATION_INVALID":
        return EmojiStatusFailedError.durationInvalid;
      case "USER_DECLINED":
        return EmojiStatusFailedError.userDeclined;
      case "SERVER_ERROR":
        return EmojiStatusFailedError.serverError;
      case "UNKNOWN_ERROR":
        return EmojiStatusFailedError.unknownError;
      default:
        return EmojiStatusFailedError.unknownError;
    }
  }
}
