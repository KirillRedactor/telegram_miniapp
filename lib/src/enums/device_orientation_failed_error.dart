enum DeviceOrientationFailedError {
  unsupported;

  static DeviceOrientationFailedError fromName(String name) {
    switch (name) {
      case "UNSUPPORTED":
        return DeviceOrientationFailedError.unsupported;
      default:
        return DeviceOrientationFailedError.unsupported;
    }
  }
}
