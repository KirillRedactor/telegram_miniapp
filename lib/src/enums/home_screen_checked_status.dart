enum HomeScreenCheckedStatus {
  unsupported,
  unknown,
  added,
  missed;

  static HomeScreenCheckedStatus fromName(String name) {
    switch (name) {
      case "unsupported":
        return HomeScreenCheckedStatus.unsupported;
      case "unknown":
        return HomeScreenCheckedStatus.unknown;
      case "added":
        return HomeScreenCheckedStatus.added;
      case "missed":
        return HomeScreenCheckedStatus.missed;
      default:
        return HomeScreenCheckedStatus.unknown;
    }
  }
}
