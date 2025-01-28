enum WriteAccessRequestedStatus {
  allowed,
  cancelled;

  static WriteAccessRequestedStatus fromName(String name) {
    switch (name) {
      case "allowed":
        return WriteAccessRequestedStatus.allowed;
      case "cancelled":
        return WriteAccessRequestedStatus.cancelled;
      default:
        return WriteAccessRequestedStatus.cancelled;
    }
  }
}
