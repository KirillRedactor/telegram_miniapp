enum PopupButtonType {
  defaultType,
  ok,
  close,
  cancel,
  destructive;

  static PopupButtonType fromName(String name) {
    switch (name) {
      case "default":
        return PopupButtonType.defaultType;
      case "ok":
        return PopupButtonType.ok;
      case "close":
        return PopupButtonType.close;
      case "cancel":
        return PopupButtonType.cancel;
      case "destructive":
        return PopupButtonType.destructive;
      default:
        return PopupButtonType.defaultType;
    }
  }
}
