enum ShareMessageFailedError {
  unsupported,
  messageExpired,
  messageSendFailed,
  userDeclined,
  unknownError;

  static ShareMessageFailedError fromName(String name) {
    switch (name) {
      case "UNSUPPORTED":
        return ShareMessageFailedError.unsupported;
      case "MESSAGE_EXPIRED":
        return ShareMessageFailedError.messageExpired;
      case "MESSAGE_SEND_FAILED":
        return ShareMessageFailedError.messageSendFailed;
      case "USER_DECLINED":
        return ShareMessageFailedError.userDeclined;
      case "UNKNOWN_ERROR":
        return ShareMessageFailedError.unknownError;
      default:
        return ShareMessageFailedError.unknownError;
    }
  }
}
