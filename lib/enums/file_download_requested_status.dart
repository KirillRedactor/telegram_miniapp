enum FileDownloadRequestedStatus {
  downloading,
  cancelled;

  static FileDownloadRequestedStatus fromName(String name) {
    switch (name) {
      case "downloading":
        return FileDownloadRequestedStatus.downloading;
      case "cancelled":
        return FileDownloadRequestedStatus.cancelled;
      default:
        return FileDownloadRequestedStatus.cancelled;
    }
  }
}
