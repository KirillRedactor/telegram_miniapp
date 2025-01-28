enum WebAppColorScheme {
  light,
  dark;

  static WebAppColorScheme fromName(String name) {
    switch (name) {
      case "light":
        return WebAppColorScheme.light;
      case "dark":
        return WebAppColorScheme.dark;
      default:
        return WebAppColorScheme.light;
    }
  }
}
