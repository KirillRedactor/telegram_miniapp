enum GyroscopeFailedError {
  unsupported;

  static GyroscopeFailedError fromName(String name) {
    switch (name) {
      case "UNSUPPORTED":
        return GyroscopeFailedError.unsupported;
      default:
        return GyroscopeFailedError.unsupported;
    }
  }
}
