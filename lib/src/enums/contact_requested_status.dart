enum ContactRequestedStatus {
  sent,
  cancelled;

  static ContactRequestedStatus fromName(String name) {
    switch (name) {
      case "sent":
        return ContactRequestedStatus.sent;
      case "cancelled":
        return ContactRequestedStatus.cancelled;
      default:
        return ContactRequestedStatus.cancelled;
    }
  }
}
