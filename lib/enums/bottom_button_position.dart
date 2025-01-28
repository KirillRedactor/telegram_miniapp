enum BottomButtonPosition {
  left,
  right,
  top,
  bottom;

  static BottomButtonPosition fromName(String name) {
    switch (name) {
      case "left":
        return BottomButtonPosition.left;
      case "right":
        return BottomButtonPosition.right;
      case "top":
        return BottomButtonPosition.top;
      case "bottom":
        return BottomButtonPosition.bottom;
      default:
        return BottomButtonPosition.left;
    }
  }
}
