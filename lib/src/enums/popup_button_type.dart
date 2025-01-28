enum PopupButtonType {
  defaultType,
  ok,
  close,
  cansel,
  destructive;

  static PopupButtonType fromName(String name) {
    switch (name) {
      case "default":
        return PopupButtonType.defaultType;
      case "ok":
        return PopupButtonType.ok;
      case "close":
        return PopupButtonType.close;
      case "cansel":
        return PopupButtonType.cansel;
      case "destructive":
        return PopupButtonType.destructive;
      default:
        return PopupButtonType.defaultType;
    }
  }
}
