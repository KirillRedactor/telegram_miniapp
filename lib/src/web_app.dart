part of '../telegram_miniapp.dart';

@JS("window.Telegram")
external JSAny? get _window;

@JS("console.log")
// ignore: unused_element
external void _consoleLog(JSAny object);

@JS("$webAppPath.initData")
external String get _initData;

@JS("$webAppPath.initDataUnsafe")
external WebAppInitDataExternal get _initDataUnsafe;

@JS("$webAppPath.version")
external String get _version;

@JS("$webAppPath.platform")
external String get _platform;

@JS("$webAppPath.colorScheme")
external String get _colorScheme;

@JS("$webAppPath.themeParams")
external ThemeParamsExternal get _themeParams;

@JS("$webAppPath.isActive")
external bool get _isActive;

@JS("$webAppPath.isExpanded")
external bool get _isExpanded;

@JS("$webAppPath.viewportHeight")
external double get _viewportHeight;

@JS("$webAppPath.viewportStableHeight")
external double get _viewportStableHeight;

@JS("$webAppPath.headerColor")
external String? get _headColor;

@JS("$webAppPath.backgroundColor")
external String? get _backgroundColor;

@JS("$webAppPath.bottomBarColor")
external String? get _bottomBarColor;

@JS("$webAppPath.isClosingConfirmationEnabled")
external bool get _isClosingConfirmationEnabled;

@JS("$webAppPath.isVerticalSwipesEnabled")
external bool get _isVerticalSwipesEnabled;

@JS("$webAppPath.isFullscreen")
external bool get _isFullscreen;

@JS("$webAppPath.isOrientationLocked")
external bool get _isOrientationLocked;

@JS("$webAppPath.safeAreaInset")
external SafeAreaInsertExternal get _safeAreaInsert;

@JS("$webAppPath.contentSafeAreaInsert")
external ContentSafeAreaInsertExternal get _contentSafeAreaInsert;

@JS("$webAppPath.isVersionAtLeast")
external bool _isVersionAtLeast(JSString version);

@JS("$webAppPath.setHeaderColor")
external void _setHeaderColor(JSString color);

@JS("$webAppPath.setBackgroundColor")
external void _setBackgroundColor(JSString color);

@JS("$webAppPath.setBottomBarColor")
external void _setBottomBarColor(JSString color);

@JS("$webAppPath.enableClosingConfirmation")
external void _enableClosingConfirmation();

@JS("$webAppPath.disableClosingConfirmation")
external void _disableClosingConfirmation();

@JS("$webAppPath.enableVerticalSwipes")
external void _enableVerticalSwipes();

@JS("$webAppPath.disableVerticalSwipes")
external void _disableVerticalSwipes();

@JS("$webAppPath.requestFullscreen")
external void _requestFullscreen();

@JS("$webAppPath.exitFullscreen")
external void _exitFullscreen();

@JS("$webAppPath.lockOrientation")
external void _lockOrientation();

@JS("$webAppPath.unlockOrientation")
external void _unlockOrientation();

@JS("$webAppPath.addToHomeScreen")
external void _addToHomeScreen();

@JS("$webAppPath.checkHomeScreenStatus")
external void _checkHomeScreenStatus([JSFunction? callback]);

@JS("$webAppPath.sendData")
external void _sendData(JSString data);

@JS("$webAppPath.switchInlineQuery")
external void _switchInlineQuery(JSString query,
    [JSArray<JSString>? chooseChatTypes]);

@JS("$webAppPath.openLink")
external void _openLink(JSString url,
    [OpenLinkOptionsExternal? tryInstantView]);

@JS("$webAppPath.openTelegramLink")
external void _openTelegramLink(JSString url);

@JS("$webAppPath.openInvoice")
external void _openInvoice(JSString url, [JSFunction? callback]);

@JS("$webAppPath.shareToStory")
external void _shareToStory(JSString mediaUrl,
    [StoryShareParamsExternal? storyShareParams]);

@JS("$webAppPath.shareMessage")
external void _shareMessage(JSString msgId, [JSFunction? callback]);

@JS("$webAppPath.setEmojiStatus")
external void _setEmojiStatus(JSString customEmojiId,
    [EmojiStatusParamsExternal? params, JSFunction? callback]);

@JS("$webAppPath.requestEmojiStatusAccess")
external void _requestEmojiStatusAccess(JSFunction? callback);

@JS("$webAppPath.downloadFile")
external void _downloadFile(DownloadFileParamsExternal params,
    [JSFunction? callback]);

@JS("$webAppPath.showPopup")
external void _showPopup(PopupParamsExternal params, JSFunction? callback);

@JS("$webAppPath.showAlert")
external void _showAlert(JSString message, JSFunction? callback);

@JS("$webAppPath.showConfirm")
external void _showConfirm(JSString message, JSFunction? callback);

@JS("$webAppPath.showScanQrPopup")
external void _showScanQrPopup(
    ScanQrPopupParamsExternal? params, JSFunction? callback);

@JS("$webAppPath.closeScanQrPopup")
external void _closeScanQrPopup();

@JS("$webAppPath.readTextFromClipboard")
external void _readTextFromClipboard(JSFunction? callback);

@JS("$webAppPath.requestWriteAccess")
external void _requestWriteAccess(JSFunction? callback);

@JS("$webAppPath.requestContact")
external void _requestContact(JSFunction? callback);

@JS("$webAppPath.ready")
external void _ready();

@JS("$webAppPath.expand")
external void _expand();

@JS("$webAppPath.close")
external void _close();

class WebApp {
  static final WebApp _webApp = WebApp._();
  factory WebApp() => _webApp;
  WebApp._();

  bool _isInited = false;

  // dynamic get window => _window;
  // bool get isSupported => _window != null;
  bool get isSupported {
    if (_window == null) {
      throw Exception(
          "Telegram script is not added to index.html\nSee: https://core.telegram.org/bots/webapps#initializing-mini-apps");
    }
    if (_initData != "") {
      return true;
    }
    return false;
  }

  void init() {
    if (_isInited) return;
    EventHandler().init();
    _isInited = true;
  }

  EventHandler get eventHandler => EventHandler();

  /// A string with raw data transferred to the Mini App,
  /// convenient for validating data.
  ///
  /// **WARNING:** Validate data from this field before using it on the bot's server.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  String get initData => _initData;

  /// An object with input data transferred to the Mini App.
  ///
  /// **WARNING:** Data from this field should not be trusted. You should only use
  /// data from initData on the bot's server and only after it has been validated.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  WebAppInitData get initDataUnsafe =>
      WebAppInitData._fromExternal(_initDataUnsafe);

  /// The version of the Bot API available in the user's Telegram app.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  String get version => _version;

  /// The name of the platform of the user's Telegram app.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  String get platform => _platform;

  /// The color scheme currently used in the Telegram app. Either “light” or “dark”.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  WebAppColorScheme get colorScheme => WebAppColorScheme.fromName(_colorScheme);

  /// An object containing the current theme settings used in the Telegram app.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  ThemeParams get themeParams => ThemeParams._fromExternal(_themeParams);

  /// `Bot API 8.0+` True, if the Mini App is currently active. False, if the Mini App is minimized.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  bool get isActive => _isActive;

  /// True, if the Mini App is expanded to the maximum available height.
  /// False, if the Mini App occupies part of the screen and can be expanded to
  /// the full height using the expand() method.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  bool get isExpanded => _isExpanded;

  /// The current height of the visible area of the Mini App.
  ///
  /// The application can display just the top part of the Mini App, with its lower
  /// part remaining outside the screen area. From this position, the user can “pull”
  /// the Mini App to its maximum height, while the bot can do the same by calling the
  /// **expand()** method. As the position of the Mini App changes, the current height value
  /// of the visible area will be updated in real time.
  ///
  ///Please note that the refresh rate of this value is not sufficient to smoothly
  ///follow the lower border of the window. It should not be used to pin interface
  ///elements to the bottom of the visible area. It's more appropriate to use the
  ///value of the `viewportStableHeight` field for this purpose.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  double get viewportHeight => _viewportHeight;

  /// The height of the visible area of the Mini App in its last stable state.
  ///
  /// The application can display just the top part of the Mini App, with its
  /// lower part remaining outside the screen area. From this position, the user
  /// can “pull” the Mini App to its maximum height, while the bot can do the same
  /// by calling the **expand()** method. Unlike the value of `viewportHeight`, the value
  /// of `viewportStableHeight` does not change as the position of the Mini App changes
  /// with user gestures or during animations. The value of `viewportStableHeight` will
  /// be updated after all gestures and animations are completed and the Mini App
  /// reaches its final size.
  ///
  /// *Note the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// `viewportChanged` with the passed parameter `isStateStable=true`, which will
  /// allow you to track when the stable state of the height of the visible area changes.*
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  double get viewportStableHeight => _viewportStableHeight;

  /// Current header color.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Color? get headerColor => _headColor != null ? fromHex(_headColor!) : null;

  /// Current header color in the `#RRGGBB` format.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  String? get headerColorRaw => _headColor;

  /// Current background color.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Color? get backgroundColor =>
      _backgroundColor != null ? fromHex(_backgroundColor!) : null;

  /// Current background color in the `#RRGGBB` format.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  String? get backgroundColorRaw => _backgroundColor;

  /// Current bottom bar color.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Color? get bottomBarColor =>
      _bottomBarColor != null ? fromHex(_bottomBarColor!) : null;

  /// Current bottom bar color in the `#RRGGBB` format.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  String? get bottomBarColorRaw => _bottomBarColor;

  /// *True*, if the confirmation dialog is enabled while the user is trying to
  /// close the Mini App. *False*, if the confirmation dialog is disabled.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  bool get isClosingConfirmationEnabled => _isClosingConfirmationEnabled;

  /// *True*, if vertical swipes to close or minimize the Mini App are enabled.
  /// *False*, if vertical swipes to close or minimize the Mini App are disabled.
  /// In any case, the user will still be able to minimize and close the Mini
  /// App by swiping the Mini App's header.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  bool get isVerticalSwipesEnabled => _isVerticalSwipesEnabled;

  /// *True*, if the Mini App is currently being displayed in fullscreen mode.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  bool get isFullscreen => _isFullscreen;

  /// *True*, if the Mini App’s orientation is currently locked.
  /// *False*, if orientation changes freely based on the device’s rotation.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  bool get isOrientationLocked => _isOrientationLocked;

  /// An object representing the device's safe area insets, accounting for system
  /// UI elements like notches or navigation bars.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  SafeAreaInsert get safeAreaInsert =>
      SafeAreaInsert._fromExternal(_safeAreaInsert);

  /// An object representing the safe area for displaying content within the app,
  /// free from overlapping Telegram UI elements.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  ContentSafeAreaInsert get contentSafeAreaInsert =>
      ContentSafeAreaInsert._fromExternal(_contentSafeAreaInsert);

  /// An object for controlling the back button which can be displayed in the
  /// header of the Mini App in the Telegram interface.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  BackButton get backButton => BackButton();

  /// An object for controlling the main button, which is displayed at the bottom
  /// of the Mini App in the Telegram interface.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  MainButton get mainButton => MainButton();

  /// An object for controlling the secondary button, which is displayed at the
  /// bottom of the Mini App in the Telegram interface.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  SecondaryButton get secondaryButton => SecondaryButton();

  /// An object for controlling the Settings item in the context menu of the
  /// Mini App in the Telegram interface.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  SettingsButton get settingsButton => SettingsButton();

  /// An object for controlling haptic feedback.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  HapticFeedback get hapticFeedback => HapticFeedback();

  /// An object for controlling cloud storage.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  CloudStorage get cloudStorage => CloudStorage();

  /// An object for controlling biometrics on the device.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  BiometricManager get biometricManager => BiometricManager();

  /// An object for accessing accelerometer data on the device.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Accelerometer get accelerometer => Accelerometer();

  /// An object for accessing device orientation data on the device.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  DeviceOrientation get deviceOrientation => DeviceOrientation();

  /// An object for accessing gyroscope data on the device.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Gyroscope get gyroscope => Gyroscope();

  /// An object for controlling location on the device.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  LocationManager get locationManager => LocationManager();

  /// Returns true if the user's app supports a version of the Bot API that is
  /// equal to or higher than the version passed as the parameter.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  bool isVersionAtLeast({required String version}) =>
      _isVersionAtLeast(version.toJS);

  /// `Bot API 6.1+` A method that sets the app header color.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void setHeaderColor(Color color) => _setHeaderColor(toHex(color).toJS);

  /// `Bot API 6.1+` A method that sets the app header color in the `#RRGGBB` format.
  /// You can also use keywords *bg_color* and *secondary_bg_color*.
  ///
  // Up to `Bot API 6.9` You can only pass *Telegram.WebApp.themeParams.bg_color*
  // or *Telegram.WebApp.themeParams.secondary_bg_color* as a color or *bg_color*,
  // *secondary_bg_color* keywords.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void setHeaderColorRaw(String color) => _setHeaderColor(color.toJS);

  /// `Bot API 6.1+` A method that sets the app background color.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void setBackgroundColor(Color color) =>
      _setBackgroundColor(toHex(color).toJS);

  /// `Bot API 6.1+` A method that sets the app background color in the `#RRGGBB`
  /// format. You can also use keywords bg_color and secondary_bg_color.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void setBackgroundColorRaw(String color) => _setBackgroundColor(color.toJS);

  /// Bot API 7.10+ A method that sets the app's bottom bar color.
  /// This color is also applied to the navigation bar on Android.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void setBottomBarColor(Color color) => _setBottomBarColor(toHex(color).toJS);

  /// `Bot API 7.10+` A method that sets the app's bottom bar color in the `#RRGGBB`
  /// format. You can also use the keywords `bg_color`, `secondary_bg_color`, and
  /// bottom_bar_bg_color. This color is also applied to the navigation bar on Android.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void setBottomBarColorRaw(String color) => _setBottomBarColor(color.toJS);

  /// `Bot API 6.2+` A method that enables a confirmation dialog while the user
  /// is trying to close the Mini App.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void enableClosingConfirmation() => _enableClosingConfirmation();

  /// `Bot API 6.2+` A method that disables the confirmation dialog while the
  /// user is trying to close the Mini App.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void disableClosingConfirmation() => _disableClosingConfirmation();

  /// `Bot API 7.7+` A method that enables vertical swipes to close or
  /// minimize the Mini App. For user convenience, it is recommended to
  /// always enable swipes unless they conflict with the Mini App's own gestures.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void enableVerticalSwipes() => _enableVerticalSwipes();

  /// `Bot API 7.7+` A method that disables vertical swipes to close or minimize
  /// the Mini App. This method is useful if your Mini App uses swipe gestures
  /// that may conflict with the gestures for minimizing and closing the app.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void disableVerticalSwipes() => _disableVerticalSwipes();

  /// `Bot API 8.0+` A method that requests opening the Mini App in fullscreen mode.
  /// Although the header is transparent in fullscreen mode, it is recommended
  /// that the Mini App sets the header color using the *setHeaderColor* method.
  /// This color helps determine a contrasting color for the status bar and other
  /// UI controls.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void requestFullscreen() => _requestFullscreen();

  /// `Bot API 8.0+` A method that requests exiting fullscreen mode.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void exitFullscreen() => _exitFullscreen();

  /// `Bot API 8.0+` A method that locks the Mini App’s orientation to its current
  /// mode (either portrait or landscape). Once locked, the orientation remains
  /// fixed, regardless of device rotation. This is useful if a stable orientation
  /// is needed during specific interactions.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void lockOrientation() => _lockOrientation();

  /// `Bot API 8.0+` A method that unlocks the Mini App’s orientation, allowing
  /// it to follow the device's rotation freely. Use this to restore automatic
  /// orientation adjustments based on the device orientation.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void unlockOrientation() => _unlockOrientation();

  /// `Bot API 8.0+` A method that prompts the user to add the Mini App to the
  /// home screen. After successfully adding the icon, the `homeScreenAdded` event
  /// will be triggered if supported by the device. Note that if the device cannot
  /// determine the installation status, the event may not be received even if
  /// the icon has been added.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void addToHomeScreen() => _addToHomeScreen();

  /// `Bot API 8.0+` A method that checks if adding to the home screen is supported
  /// and if the Mini App has already been added. If an optional callback parameter
  /// is provided, the callback function will be called with a single argument
  /// status, which is a string indicating the home screen status. Possible values
  /// for status are:
  /// - unsupported – the feature is not supported, and it is not possible to add
  /// the icon to the home screen,
  /// - unknown – the feature is supported, and the icon can be added, but it is
  /// not possible to determine if the icon has already been added,
  /// - added – the icon has already been added to the home screen,
  /// - missed – the icon has not been added to the home screen.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void checkHomeScreenStatus(
      {void Function(HomeScreenCheckedStatus status)? callback}) {
    callback == null
        ? _checkHomeScreenStatus()
        : _checkHomeScreenStatus(
            ((JSString ext) =>
                callback(HomeScreenCheckedStatus.fromName(ext.toDart))).toJS,
          );
  }

  /// `Bot API 8.0+` A method that checks if adding to the home screen is supported
  /// and if the Mini App has already been added. If an optional callback parameter
  /// is provided, the callback function will be called with a single argument
  /// status, which is a string indicating the home screen status. Possible values
  /// for status are:
  /// - unsupported – the feature is not supported, and it is not possible to add
  /// the icon to the home screen,
  /// - unknown – the feature is supported, and the icon can be added, but it is
  /// not possible to determine if the icon has already been added,
  /// - added – the icon has already been added to the home screen,
  /// - missed – the icon has not been added to the home screen.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<HomeScreenCheckedStatus> checkHomeScreenStatusAsync() async {
    StreamController<String> streamController = StreamController();
    void callbackFunction(JSString ext) => streamController.add(ext.toDart);

    _checkHomeScreenStatus(callbackFunction.toJS);
    return HomeScreenCheckedStatus.fromName(
        await StreamQueue(streamController.stream).next);
  }

  /// A method used to send data to the bot. When this method is called, a service
  /// message is sent to the bot containing the data data of the length up to 4096
  /// bytes, and the Mini App is closed. See the field web_app_data in the class
  /// [Message](https://core.telegram.org/bots/api#message).
  ///
  /// *This method is only available for Mini Apps launched via a
  /// [Keyboard button](https://core.telegram.org/bots/webapps#keyboard-button-mini-apps).*
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void sendData({required String data}) => _sendData(data.toJS);

  /// `Bot API 6.7+` A method that inserts the bot's username and the specified
  /// inline *query* in the current chat's input field. Query may be empty, in
  /// which case only the bot's username will be inserted. If an optional
  /// *choose_chat_types* parameter was passed, the client prompts the user to
  /// choose a specific chat, then opens that chat and inserts the bot's username
  /// and the specified inline query in the input field. You can specify which
  /// types of chats the user will be able to choose from. It can be one or more
  /// of the following types: *users, bots, groups, channels.*
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void switchInlineQuery(
          {required String query, List<WebAppChatType>? chooseChatTypes}) =>
      _switchInlineQuery(
          query.toJS,
          (chooseChatTypes?..remove(WebAppChatType.sender))
              ?.map((e) => e.name.toJS)
              .toList()
              .toJS);

  /// A method that opens a link in an external browser. The Mini App will not be closed.
  /// `Bot API 6.4+` If the optional options parameter is passed with the field
  /// *try_instant_view=true*, the link will be opened in Instant
  /// [View mode](https://instantview.telegram.org/) if possible.
  ///
  /// *Note that this method can be called only in response to user interaction
  /// with the Mini App interface (e.g. a click inside the Mini App or on the main
  /// button)*
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void openLink({required String url, bool? tryInstantView}) => _openLink(
      url.toJS,
      _OpenLinkOptions(try_instant_view: tryInstantView ?? false)._toExt);

  /// A method that opens a telegram link inside the Telegram app. The Mini App
  /// will *not* be closed after this method is called.
  ///
  /// Up to `Bot API 7.0` The Mini App *will* be closed after this method is called.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void openTelegramLink({required String url}) => _openTelegramLink(url.toJS);

  /// `Bot API 6.1+` A method that opens an invoice using the link *url*. The Mini
  /// App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// *invoiceClosed* when the invoice is closed. If an optional *callback* parameter
  /// was passed, the *callback* function will be called and the invoice status will
  /// be passed as the first argument.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void openInvoice(
          {required String url,
          void Function(InvoiceResult result)? callback}) =>
      _openInvoice(
        url.toJS,
        callback != null
            ? ((JSString result) =>
                callback(InvoiceResult.fromName(result.toDart))).toJS
            : null,
      );

  /// `Bot API 6.1+` A method that opens an invoice using the link *url*. The Mini
  /// App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// *invoiceClosed* when the invoice is closed. Function will be returned the invoice status.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<InvoiceResult> openInvoiceAsync({required String url}) async {
    StreamController<String> streamController = StreamController();
    void callback(JSString result) => streamController.add(result.toDart);

    _openInvoice(url.toJS, callback.toJS);
    return InvoiceResult.fromName(
        await StreamQueue(streamController.stream).next);
  }

  /// `Bot API 7.8+` A method that opens the native story editor with the media
  /// specified in the *media_url* parameter as an HTTPS URL. An optional *params*
  /// argument of the type [StoryShareParams](https://core.telegram.org/bots/webapps#storyshareparams)
  /// describes additional sharing settings.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void shareToStory(
          {required String mediaUrl, StoryShareParams? storyShareParams}) =>
      _shareToStory(mediaUrl.toJS, storyShareParams?._toExt);

  /// `Bot API 8.0+` A method that opens a dialog allowing the user to share a
  /// message provided by the bot. If an optional *callback* parameter is provided,
  /// the *callback* function will be called with a boolean as the first argument,
  /// indicating whether the message was successfully sent. The message id passed
  /// to this method must belong to a [PreparedInlineMessage](https://core.telegram.org/bots/api#preparedinlinemessage)
  /// previously obtained via the Bot API method
  /// [savePreparedInlineMessage](https://core.telegram.org/bots/api#savepreparedinlinemessage).
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void shareMessage(
          {required String msgId, void Function(bool result)? callback}) =>
      _shareMessage(msgId.toJS, callback?.toJS);

  /// `Bot API 8.0+` A method that opens a dialog allowing the user to share a
  /// message provided by the bot. Function will be return a boolean,
  /// indicating whether the message was successfully sent. The message id passed
  /// to this method must belong to a [PreparedInlineMessage](https://core.telegram.org/bots/api#preparedinlinemessage)
  /// previously obtained via the Bot API method
  /// [savePreparedInlineMessage](https://core.telegram.org/bots/api#savepreparedinlinemessage).
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<bool> shareMessageAsync({required String msgId}) async {
    StreamController<bool> streamController = StreamController();
    void callbackFunction(JSBoolean ext) => streamController.add(ext.toDart);

    _shareMessage(msgId.toJS, callbackFunction.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  /// Bot API 8.0+ A method that opens a dialog allowing the user to set the
  /// specified custom emoji as their status. An optional *params* argument of type
  /// [EmojiStatusParams](https://core.telegram.org/bots/webapps#emojistatusparams)
  /// specifies additional settings, such as duration. If an optional *callback*
  /// parameter is provided, the *callback* function will be called with a boolean
  /// as the first argument, indicating whether the status was set.
  ///
  /// *Note: this method opens a native dialog and cannot be used to set the emoji
  /// status without manual user interaction. For fully programmatic changes, you
  /// should instead use the Bot API method [setUserEmojiStatus](https://core.telegram.org/bots/bots/api#setuseremojistatus)
  /// after obtaining authorization to do so via the Mini App method
  /// requestEmojiStatusAccess.*
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void setEmojiStatus(
          {required String customEmojiId,
          EmojiStatusParams? params,
          void Function(bool result)? callback}) =>
      _setEmojiStatus(
        customEmojiId.toJS,
        params?._toExt,
        callback?.toJS,
      );

  /// Bot API 8.0+ A method that opens a dialog allowing the user to set the
  /// specified custom emoji as their status. An optional *params* argument of type
  /// [EmojiStatusParams](https://core.telegram.org/bots/webapps#emojistatusparams)
  /// specifies additional settings, such as duration. Function will return a boolean
  /// as the first argument, indicating whether the status was set.
  ///
  /// *Note: this method opens a native dialog and cannot be used to set the emoji
  /// status without manual user interaction. For fully programmatic changes, you
  /// should instead use the Bot API method [setUserEmojiStatus](https://core.telegram.org/bots/bots/api#setuseremojistatus)
  /// after obtaining authorization to do so via the Mini App method
  /// requestEmojiStatusAccess.*
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<bool> setEmojiStatusAsync(
      {required String customEmojiId, EmojiStatusParams? params}) async {
    StreamController<bool> streamController = StreamController();
    void callbackFunction(JSBoolean ext) => streamController.add(ext.toDart);

    _setEmojiStatus(customEmojiId.toJS, params?._toExt, callbackFunction.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  /// `Bot API 8.0+` A method that shows a native popup requesting permission for
  /// the bot to manage user's emoji status. If an optional *callback* parameter
  /// was passed, the *callback* function will be called when the popup is closed
  /// and the first argument will be a boolean indicating whether the user
  /// granted this access.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void requestEmojiStatusAccess({void Function(bool result)? callback}) =>
      _requestEmojiStatusAccess(callback?.toJS);

  /// `Bot API 8.0+` A method that shows a native popup requesting permission for
  /// the bot to manage user's emoji status. Function return boolean indicating
  /// whether the user granted this access.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<bool> requestEmojiStatusAccessAsync() async {
    StreamController<bool> streamController = StreamController();
    void callbackFunction(JSBoolean ext) => streamController.add(ext.toDart);

    _requestEmojiStatusAccess(callbackFunction.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  /// `Bot API 8.0+` A method that displays a native popup prompting the user to
  /// download a file specified by the *params* argument of type
  /// [DownloadFileParams](https://core.telegram.org/bots/webapps#downloadfileparams).
  /// If an optional callback parameter is provided, the callback function will be
  /// called when the popup is closed, with the first argument as a boolean indicating
  /// whether the user accepted the download request.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void downloadFile(
          {required DownloadFileParams params,
          void Function(bool result)? callback}) =>
      _downloadFile(params._toExt, callback?.toJS);

  /// `Bot API 8.0+` A method that displays a native popup prompting the user to
  /// download a file specified by the *params* argument of type
  /// [DownloadFileParams](https://core.telegram.org/bots/webapps#downloadfileparams).
  /// Function return boolean indicating whether the user accepted the download request.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<bool> downloadFileAsync({
    required DownloadFileParams params,
  }) async {
    StreamController<bool> streamController = StreamController();
    void callback(JSBoolean ext) => streamController.add(ext.toDart);

    _downloadFile(params._toExt, callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  /// `Bot API 6.2+` A method that shows a native popup described by the *params*
  /// argument of the type [PopupParams](https://core.telegram.org/bots/webapps#popupparams).
  /// The Mini App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// *popupClosed* when the popup is closed. If an optional *callback* parameter
  /// was passed, the *callback* function will be called and the field *id* of
  /// the pressed button will be passed as the first argument.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void showPopup(
          {required PopupParams params,
          void Function(String? buttonId)? callback}) =>
      _showPopup(
        params._toExt,
        callback?.toJS,
      );

  /// `Bot API 6.2+` A method that shows a native popup described by the *params*
  /// argument of the type [PopupParams](https://core.telegram.org/bots/webapps#popupparams).
  /// The Mini App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// *popupClosed* when the popup is closed. The field *id* of
  /// the pressed button will be returned.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<String?> showPopupAsync({required PopupParams params}) async {
    StreamController<String?> streamController = StreamController();
    void callback(JSString? buttonId) => streamController.add(buttonId?.toDart);

    _showPopup(params._toExt, callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  /// `Bot API 6.2+` A method that shows *message* in a simple alert with a 'Close'
  /// button. If an optional *callback* parameter was passed, the *callback* function
  /// will be called when the popup is closed.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void showAlert({required String message, void Function()? callback}) =>
      _showAlert(message.toJS, callback?.toJS);

  /// `Bot API 6.2+` A method that shows *message* in a simple alert with a 'Close'
  /// button. Function will return *true* when the popup is closed.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<bool> showAlertAsync({required String message}) async {
    StreamController<bool> streamController = StreamController();
    void callback() => streamController.add(true);

    _showAlert(message.toJS, callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  /// `Bot API 6.2+` A method that shows *message* in a simple confirmation window
  /// with 'OK' and 'Cancel' buttons. If an optional *callback* parameter was
  /// passed, the *callback* function will be called when the popup is closed and
  /// the first argument will be a boolean indicating whether the user pressed the
  /// 'OK' button.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void showConfirm(
          {required String message, void Function(bool result)? callback}) =>
      _showConfirm(message.toJS, callback?.toJS);

  /// `Bot API 6.2+` A method that shows *message* in a simple confirmation window
  /// with 'OK' and 'Cancel' buttons. Function will returb a boolean indicating
  /// whether the user pressed the 'OK' button.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<bool> showConfirmAsync({required String message}) async {
    StreamController<bool> streamController = StreamController();
    void callback(JSBoolean ext) => streamController.add(ext.toDart);

    _showConfirm(
      message.toJS,
      callback.toJS,
    );
    return await StreamQueue(streamController.stream).next;
  }

  /// `Bot API 6.4+` A method that shows a native popup for scanning a QR code
  /// described by the params argument of the type
  /// [ScanQrPopupParams](https://core.telegram.org/bots/webapps#scanqrpopupparams).
  /// The Mini App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// *qrTextReceived* every time the scanner catches a code with text data. If an
  /// optional callback parameter was passed, the *callback* function will be called
  /// and the text from the QR code will be passed as the first argument. Returning
  /// true inside this *callback* function causes the popup to be closed. Starting
  /// from `Bot API 7.7`, the Mini App will receive the scanQrPopupClosed event if
  /// the user closes the native popup for scanning a QR code.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void showScanQrPopup(
          {ScanQrPopupParams? params,
          void Function(String result)? callback,
          bool closeOnFirstResult = true}) =>
      _showScanQrPopup(
          params?._toExt,
          (JSString result) {
            if (callback != null) callback(result.toDart);
            return closeOnFirstResult;
          }.toJS);

  /// `Bot API 6.4+` A method that shows a native popup for scanning a QR code
  /// described by the params argument of the type
  /// [ScanQrPopupParams](https://core.telegram.org/bots/webapps#scanqrpopupparams).
  /// The Mini App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// *qrTextReceived* every time the scanner catches a code with text data. Starting
  /// from `Bot API 7.7`, the Mini App will receive the scanQrPopupClosed event if
  /// the user closes the native popup for scanning a QR code.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<String> showScanQrPopupAsync(
      {ScanQrPopupParams? params,
      bool Function(String result)? condition}) async {
    StreamController<String> streamController = StreamController();
    bool callback(JSString result) {
      if (condition == null || condition(result.toDart)) {
        streamController.add(result.toDart);
        return true;
      } else {
        return false;
      }
    }

    _showScanQrPopup(params?._toExt, callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  /// `Bot API 6.4+` A method that shows a native popup for scanning a QR code
  /// described by the params argument of the type
  /// [ScanQrPopupParams](https://core.telegram.org/bots/webapps#scanqrpopupparams).
  /// The Mini App will receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// *qrTextReceived* every time the scanner catches a code with text data. Starting
  /// from `Bot API 7.7`, the Mini App will receive the scanQrPopupClosed event if
  /// the user closes the native popup for scanning a QR code.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Stream<String> showScanQrPopupStream({
    ScanQrPopupParams? params,
  }) {
    StreamController<String> streamController = StreamController();
    void callback(JSString result) {
      streamController.add(result.toDart);
    }

    _showScanQrPopup(params?._toExt, callback.toJS);
    return streamController.stream;
  }

  /// `Bot API 6.4+` A method that closes the native popup for scanning a QR
  /// code opened with the *showScanQrPopup method*. Run it if you received valid
  /// data in the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// *qrTextReceived*.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void closeScanQrPopup() => _closeScanQrPopup();

  /// Bot API 6.4+ A method that requests text from the clipboard. The Mini App will
  /// receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// *clipboardTextReceived*. If an optional *callback* parameter was passed, the *callback*
  /// function will be called and the text from the clipboard will be passed as the
  /// first argument.
  ///
  /// *Note: this method can be called only for Mini Apps launched from the
  /// attachment menu and only in response to a user interaction with the Mini
  /// App interface (e.g. a click inside the Mini App or on the main button).*
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void readTextFromClipboard({void Function(String result)? callback}) =>
      _readTextFromClipboard(callback?.toJS);

  /// `Bot API 6.4+` A method that requests text from the clipboard. The Mini App will
  /// receive the [event](https://core.telegram.org/bots/webapps#events-available-for-mini-apps)
  /// *clipboardTextReceived*. Function will return text from the clipboard.
  ///
  /// *Note: this method can be called only for Mini Apps launched from the
  /// attachment menu and only in response to a user interaction with the Mini
  /// App interface (e.g. a click inside the Mini App or on the main button).*
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<String?> readTextFromClipboardAsync() async {
    StreamController<String?> streamController = StreamController();
    void callback(JSString? result) => streamController.add(result?.toDart);

    _readTextFromClipboard(callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  /// `Bot API 6.9+` A method that shows a native popup requesting permission
  /// for the bot to send messages to the user. If an optional *callback* parameter
  /// was passed, the *callback* function will be called when the popup is closed
  /// and the first argument will be a boolean indicating whether the user granted
  /// this access.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void requestWriteAccess({void Function(bool result)? callback}) =>
      _requestWriteAccess(callback?.toJS);

  /// `Bot API 6.9+` A method that shows a native popup requesting permission
  /// for the bot to send messages to the user. Function will return a boolean
  /// indicating whether the user granted this access.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<bool> requestWriteAccessAsync() async {
    StreamController<bool> streamController = StreamController();
    void callback(JSBoolean result) => streamController.add(result.toDart);

    _requestWriteAccess(callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  /// `Bot API 6.9+` A method that shows a native popup prompting the user for
  /// their phone number. If an optional *callback* parameter was passed, the *callback*
  /// function will be called when the popup is closed and the first argument will
  /// be a boolean indicating whether the user shared its phone number.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void requestContact({void Function(bool result)? callback}) =>
      _requestContact(callback?.toJS);

  /// `Bot API 6.9+` A method that shows a native popup prompting the user for
  /// their phone number. Function will return a boolean indicating whether the
  /// user shared its phone number.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  Future<bool> requestContactAsync() async {
    StreamController<bool> streamController = StreamController();
    void callback(JSBoolean result) => streamController.add(result.toDart);

    _requestContact(callback.toJS);
    return await StreamQueue(streamController.stream).next;
  }

  /// A method that informs the Telegram app that the Mini App is ready to be
  /// displayed.
  ///
  /// It is recommended to call this method as early as possible, as soon as all
  /// essential interface elements are loaded. Once this method is called, the
  /// loading placeholder is hidden and the Mini App is shown.
  ///
  /// If the method is not called, the placeholder will be hidden only when the
  /// page is fully loaded.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void ready() => _ready();

  /// A method that expands the Mini App to the maximum available height. To find
  /// out if the Mini App is expanded to the maximum height, refer to the value
  /// of the *Telegram.WebApp.isExpanded* parameter
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void expand() => _expand();

  /// A method that closes the Mini App.
  ///
  /// [API reference](https://core.telegram.org/bots/webapps#initializing-mini-apps)
  void close() => _close();
}
