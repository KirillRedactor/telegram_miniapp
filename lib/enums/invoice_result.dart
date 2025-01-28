enum InvoiceResult {
  paid,
  cancelled,
  failed,
  pending;

  static InvoiceResult fromName(String name) {
    switch (name) {
      case "paid":
        return InvoiceResult.paid;
      case "cancelled":
        return InvoiceResult.cancelled;
      case "failed":
        return InvoiceResult.failed;
      case "pending":
        return InvoiceResult.pending;
      default:
        return InvoiceResult.pending;
    }
  }
}
