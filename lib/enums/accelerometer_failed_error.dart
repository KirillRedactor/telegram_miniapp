enum AccelerometerFailedError {
  unsupported;

  static AccelerometerFailedError fromName(String name) {
    switch (name) {
      case "UNSUPPORTED":
        return AccelerometerFailedError.unsupported;
      default:
        return AccelerometerFailedError.unsupported;
    }
  }
}
