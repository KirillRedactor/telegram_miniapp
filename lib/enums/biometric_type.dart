enum BiometricType {
  finger,
  face,
  unknown;

  static BiometricType fromName(String name) {
    switch (name) {
      case "finger":
        return BiometricType.finger;
      case "face":
        return BiometricType.face;
      case "unknown":
        return BiometricType.unknown;
      default:
        return BiometricType.unknown;
    }
  }
}
