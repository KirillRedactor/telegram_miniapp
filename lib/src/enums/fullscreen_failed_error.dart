enum FullscreenFailedError {
  unsupported,
  alreadyFullscreen;

  static FullscreenFailedError fromName(String name) {
    switch (name) {
      case "UNSUPPORTED":
        return FullscreenFailedError.unsupported;
      case "ALREADY_FULLSCREEN":
        return FullscreenFailedError.alreadyFullscreen;
      default:
        return FullscreenFailedError.unsupported;
    }
  }
}
