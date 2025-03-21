import 'dart:async';
import 'dart:js_interop';

import '../../flutter_telegram_miniapp.dart';

@JS("$webAppPath.onEvent")
external void _onEvent(JSString eventType, JSFunction eventHandler);

class EventHandler {
  static final EventHandler _eventHandler = EventHandler._();
  factory EventHandler() => _eventHandler;
  EventHandler._();

  void init() {
    _onEvent(
        "activated".toJS, (() => _activatedStreamController.add(true)).toJS);
    _onEvent("deactivated".toJS,
        (() => _deactivatedStreamController.add(true)).toJS);
    _onEvent(
        "themeChanged".toJS,
        (() => _themeChangedStreamController
            .add((WebApp().colorScheme, WebApp().themeParams))).toJS);
    _onEvent(
        "viewportChanged".toJS,
        ((JSBoolean isStateStable) => _viewportChangedStreamController
            .add((isStateStable.toDart, WebApp().viewportHeight))).toJS);
    _onEvent(
        "safeAreaChanged".toJS,
        (() => _safeAreaChangedStreamController.add(WebApp().safeAreaInsert))
            .toJS);
    _onEvent(
        "contentSafeAreaChanged".toJS,
        (() => _contentSafeAreaChangedStreamController
            .add(WebApp().contentSafeAreaInsert)).toJS);
    _onEvent(
        "mainButtonClicked".toJS,
        (() => _mainButtonClickedStreamController.add(WebApp().mainButton))
            .toJS);
    _onEvent(
        "secondaryButtonClicked".toJS,
        (() => _secondaryButtonClickedStreamController
            .add(WebApp().secondaryButton)).toJS);
    _onEvent(
        "backButtonClicked".toJS,
        (() => _backButtonClickedStreamController.add(WebApp().backButton))
            .toJS);
    _onEvent(
        "settingsButtonClicked".toJS,
        (() => _settingsButtonClickedStreamController
            .add(WebApp().settingsButton)).toJS);
    _onEvent(
        "invoiceClosed".toJS,
        ((JSString url, JSString status) => _invoiceClosedStreamController
            .add((url.toDart, InvoiceResult.fromName(status.toDart)))).toJS);
    _onEvent(
        "popupClosed".toJS,
        ((JSString? buttonId) =>
            _popupClosedStreamController.add(buttonId?.toDart)).toJS);
    _onEvent(
        "qrTextReceived".toJS,
        ((JSString data) => _qrTextReceivedStreamController.add(data.toDart))
            .toJS);
    _onEvent(
        "scanQrPopupClosed".toJS,
        ((JSString? buttonId) => _scanQrPopupClosedStreamController.add(true))
            .toJS);
    _onEvent(
        "clipboardTextReceived".toJS,
        ((JSString? data) =>
            _clipboardTextReceivedStreamController.add(data?.toDart)).toJS);
    _onEvent(
        "writeAccessRequested".toJS,
        ((JSString status) => _writeAccessRequestedStreamController
            .add(WriteAccessRequestedStatus.fromName(status.toDart))).toJS);
    _onEvent(
        "contactRequested".toJS,
        ((JSString status) => _contactRequestedStreamController
            .add(ContactRequestedStatus.fromName(status.toDart))).toJS);
    _onEvent(
        "biometricManagerUpdated".toJS,
        ((JSString status) => _biometricManagerUpdatedStreamController
            .add(WebApp().biometricManager)).toJS);
    _onEvent(
        "biometricAuthRequested".toJS,
        ((JSBoolean isAuthenticated, JSString? biometricToken) =>
            _biometricAuthRequestedStreamController
                .add((isAuthenticated.toDart, biometricToken?.toDart))).toJS);
    _onEvent(
        "biometricTokenUpdated".toJS,
        ((JSBoolean isUpdated) =>
            _biometricTokenUpdatedStreamController.add(isUpdated.toDart)).toJS);
    _onEvent(
        "fullscreenChanged".toJS,
        (() => _fullscreenChangedStreamController.add(WebApp().isFullscreen))
            .toJS);
    _onEvent(
        "fullscreenFailed".toJS,
        ((JSString error) => _fullscreenFailedStreamController
            .add(FullscreenFailedError.fromName(error.toDart))).toJS);
    _onEvent("homeScreenAdded".toJS,
        (() => _homeScreenAddedStreamController.add(true)).toJS);
    _onEvent(
        "homeScreenChecked ".toJS,
        ((JSString status) => _homeScreenCheckedStreamController
            .add(HomeScreenCheckedStatus.fromName(status.toDart))).toJS);

    _onEvent(
        "accelerometerStarted".toJS,
        (() => _accelerometerStartedStreamController
            .add(WebApp().accelerometer)).toJS);
    _onEvent(
        "accelerometerStopped ".toJS,
        (() => _accelerometerStoppedStreamController
            .add(WebApp().accelerometer)).toJS);
    _onEvent(
        "accelerometerChanged".toJS,
        (() => _accelerometerChangedStreamController
            .add(WebApp().accelerometer)).toJS);
    _onEvent(
        "accelerometerFailed".toJS,
        ((JSString error) => _accelerometerFailedStreamController
            .add(AccelerometerFailedError.fromName(error.toDart))).toJS);

    _onEvent(
        "deviceOrientationStarted".toJS,
        (() => _deviceOrientationStartedStreamController
            .add(WebApp().deviceOrientation)).toJS);
    _onEvent(
        "deviceOrientationStopped".toJS,
        (() => _deviceOrientationStoppedStreamController
            .add(WebApp().deviceOrientation)).toJS);
    _onEvent(
        "deviceOrientationChanged".toJS,
        (() => _deviceOrientationChangedStreamController
            .add(WebApp().deviceOrientation)).toJS);
    _onEvent(
        "deviceOrientationFailed".toJS,
        ((JSString error) => _deviceOrientationFailedStreamController
            .add(DeviceOrientationFailedError.fromName(error.toDart))).toJS);

    _onEvent("gyroscopeStarted".toJS,
        (() => _gyroscopeStartedStreamController.add(WebApp().gyroscope)).toJS);
    _onEvent("gyroscopeStopped".toJS,
        (() => _gyroscopeStoppedStreamController.add(WebApp().gyroscope)).toJS);
    _onEvent("gyroscopeChanged".toJS,
        (() => _gyroscopeChangedStreamController.add(WebApp().gyroscope)).toJS);
    _onEvent(
        "gyroscopeFailed".toJS,
        ((JSString error) => _gyroscopeFailedStreamController
            .add(GyroscopeFailedError.fromName(error.toDart))).toJS);

    _onEvent(
        "locationManagerUpdated".toJS,
        (() => _locationManagerUpdatedStreamController
            .add(WebApp().locationManager)).toJS);
    _onEvent(
        "locationRequested".toJS,
        ((LocationDataExternal ext) => _locationRequestedStreamController
            .add(LocationData.fromExternal(ext))).toJS);

    _onEvent("shareMessageSent".toJS,
        (() => _shareMessageSentStreamController.add(true)).toJS);
    _onEvent(
        "shareMessageFailed".toJS,
        ((JSString error) => _shareMessageFailedStreamController
            .add(ShareMessageFailedError.fromName(error.toDart))).toJS);

    _onEvent("emojiStatusSet".toJS,
        (() => _emojiStatusSetStreamController.add(true)).toJS);
    _onEvent(
        "emojiStatusFailed".toJS,
        ((JSString error) => _emojiStatusFailedStreamController
            .add(EmojiStatusFailedError.fromName(error.toDart))).toJS);

    _onEvent(
        "emojiStatusAccessRequested".toJS,
        ((JSString status) => _emojiStatusAccessRequestedStreamController.add(
            EmojiStatusAccessRequestedStatus.fromName(status.toDart))).toJS);

    _onEvent(
        "fileDownloadRequested".toJS,
        ((JSString error) => _fileDownloadRequestedStreamController
            .add(FileDownloadRequestedStatus.fromName(error.toDart))).toJS);
  }

  final StreamController<bool> _activatedStreamController =
      StreamController.broadcast();
  Stream<bool> get activated => _activatedStreamController.stream;

  final StreamController<bool> _deactivatedStreamController =
      StreamController.broadcast();
  Stream<bool> get deactivated => _deactivatedStreamController.stream;

  final StreamController<(WebAppColorScheme, ThemeParams)>
      _themeChangedStreamController = StreamController.broadcast();
  Stream<(WebAppColorScheme, ThemeParams)> get themeChanged =>
      _themeChangedStreamController.stream;

  final StreamController<(bool, double)> _viewportChangedStreamController =
      StreamController.broadcast();
  Stream<(bool, double)> get viewportChanged =>
      _viewportChangedStreamController.stream;

  final StreamController<SafeAreaInsert> _safeAreaChangedStreamController =
      StreamController.broadcast();
  Stream<SafeAreaInsert> get safeAreaChanged =>
      _safeAreaChangedStreamController.stream;

  final StreamController<ContentSafeAreaInsert>
      _contentSafeAreaChangedStreamController = StreamController.broadcast();
  Stream<ContentSafeAreaInsert> get contentSafeAreaChanged =>
      _contentSafeAreaChangedStreamController.stream;

  final StreamController<MainButton> _mainButtonClickedStreamController =
      StreamController.broadcast();
  Stream<MainButton> get mainButtonClicked =>
      _mainButtonClickedStreamController.stream;

  final StreamController<SecondaryButton>
      _secondaryButtonClickedStreamController = StreamController.broadcast();
  Stream<SecondaryButton> get secondaryButtonClicked =>
      _secondaryButtonClickedStreamController.stream;

  final StreamController<BackButton> _backButtonClickedStreamController =
      StreamController.broadcast();
  Stream<BackButton> get backButtonClicked =>
      _backButtonClickedStreamController.stream;

  final StreamController<SettingsButton>
      _settingsButtonClickedStreamController = StreamController.broadcast();
  Stream<SettingsButton> get settingsButtonClicked =>
      _settingsButtonClickedStreamController.stream;

  final StreamController<(String, InvoiceResult)>
      _invoiceClosedStreamController = StreamController.broadcast();
  Stream<(String, InvoiceResult)> get invoiceClosed =>
      _invoiceClosedStreamController.stream;

  final StreamController<String?> _popupClosedStreamController =
      StreamController.broadcast();
  Stream<String?> get popupClosed => _popupClosedStreamController.stream;

  final StreamController<String> _qrTextReceivedStreamController =
      StreamController.broadcast();
  Stream<String> get qrTextReceived => _qrTextReceivedStreamController.stream;

  final StreamController<bool> _scanQrPopupClosedStreamController =
      StreamController.broadcast();
  Stream<bool> get scanQrPopupClosed =>
      _scanQrPopupClosedStreamController.stream;

  final StreamController<String?> _clipboardTextReceivedStreamController =
      StreamController.broadcast();
  Stream<String?> get clipboardTextReceived =>
      _clipboardTextReceivedStreamController.stream;

  final StreamController<WriteAccessRequestedStatus>
      _writeAccessRequestedStreamController = StreamController.broadcast();
  Stream<WriteAccessRequestedStatus> get writeAccessRequested =>
      _writeAccessRequestedStreamController.stream;

  final StreamController<ContactRequestedStatus>
      _contactRequestedStreamController = StreamController.broadcast();
  Stream<ContactRequestedStatus> get contactRequested =>
      _contactRequestedStreamController.stream;

  final StreamController<BiometricManager>
      _biometricManagerUpdatedStreamController = StreamController.broadcast();
  Stream<BiometricManager> get biometricManagerUpdated =>
      _biometricManagerUpdatedStreamController.stream;

  final StreamController<(bool, String?)>
      _biometricAuthRequestedStreamController = StreamController.broadcast();
  Stream<(bool, String?)> get biometricAuthRequested =>
      _biometricAuthRequestedStreamController.stream;

  final StreamController<bool> _biometricTokenUpdatedStreamController =
      StreamController.broadcast();
  Stream<bool> get biometricTokenUpdated =>
      _biometricTokenUpdatedStreamController.stream;

  final StreamController<bool> _fullscreenChangedStreamController =
      StreamController.broadcast();
  Stream<bool> get fullscreenChanged =>
      _fullscreenChangedStreamController.stream;

  final StreamController<FullscreenFailedError>
      _fullscreenFailedStreamController = StreamController.broadcast();
  Stream<FullscreenFailedError> get fullscreenFailed =>
      _fullscreenFailedStreamController.stream;

  final StreamController<bool> _homeScreenAddedStreamController =
      StreamController.broadcast();
  Stream<bool> get homeScreenAdded => _homeScreenAddedStreamController.stream;

  final StreamController<HomeScreenCheckedStatus>
      _homeScreenCheckedStreamController = StreamController.broadcast();
  Stream<HomeScreenCheckedStatus> get homeScreenChecked =>
      _homeScreenCheckedStreamController.stream;

  final StreamController<Accelerometer> _accelerometerStartedStreamController =
      StreamController.broadcast();
  Stream<Accelerometer> get accelerometerStarted =>
      _accelerometerStartedStreamController.stream;

  final StreamController<Accelerometer> _accelerometerStoppedStreamController =
      StreamController.broadcast();
  Stream<Accelerometer> get accelerometerStopped =>
      _accelerometerStoppedStreamController.stream;

  final StreamController<Accelerometer> _accelerometerChangedStreamController =
      StreamController.broadcast();
  Stream<Accelerometer> get accelerometerChanged =>
      _accelerometerChangedStreamController.stream;

  final StreamController<AccelerometerFailedError>
      _accelerometerFailedStreamController = StreamController.broadcast();
  Stream<AccelerometerFailedError> get accelerometerFailed =>
      _accelerometerFailedStreamController.stream;

  final StreamController<DeviceOrientation>
      _deviceOrientationStartedStreamController = StreamController.broadcast();
  Stream<DeviceOrientation> get deviceOrientationStarted =>
      _deviceOrientationStartedStreamController.stream;

  final StreamController<DeviceOrientation>
      _deviceOrientationStoppedStreamController = StreamController.broadcast();
  Stream<DeviceOrientation> get deviceOrientationStopped =>
      _deviceOrientationStoppedStreamController.stream;

  final StreamController<DeviceOrientation>
      _deviceOrientationChangedStreamController = StreamController.broadcast();
  Stream<DeviceOrientation> get deviceOrientationChanged =>
      _deviceOrientationChangedStreamController.stream;

  final StreamController<DeviceOrientationFailedError>
      _deviceOrientationFailedStreamController = StreamController.broadcast();
  Stream<DeviceOrientationFailedError> get deviceOrientationFailed =>
      _deviceOrientationFailedStreamController.stream;

  final StreamController<Gyroscope> _gyroscopeStartedStreamController =
      StreamController.broadcast();
  Stream<Gyroscope> get gyroscopeStarted =>
      _gyroscopeStartedStreamController.stream;

  final StreamController<Gyroscope> _gyroscopeStoppedStreamController =
      StreamController.broadcast();
  Stream<Gyroscope> get gyroscopeStopped =>
      _gyroscopeStoppedStreamController.stream;

  final StreamController<Gyroscope> _gyroscopeChangedStreamController =
      StreamController.broadcast();
  Stream<Gyroscope> get gyroscopeChanged =>
      _gyroscopeChangedStreamController.stream;

  final StreamController<GyroscopeFailedError>
      _gyroscopeFailedStreamController = StreamController.broadcast();
  Stream<GyroscopeFailedError> get gyroscopeFailed =>
      _gyroscopeFailedStreamController.stream;

  final StreamController<LocationManager>
      _locationManagerUpdatedStreamController = StreamController.broadcast();
  Stream<LocationManager> get locationManagerUpdated =>
      _locationManagerUpdatedStreamController.stream;

  final StreamController<LocationData> _locationRequestedStreamController =
      StreamController.broadcast();
  Stream<LocationData> get locationRequested =>
      _locationRequestedStreamController.stream;

  final StreamController<bool> _shareMessageSentStreamController =
      StreamController.broadcast();
  Stream<bool> get shareMessageSent => _shareMessageSentStreamController.stream;

  final StreamController<ShareMessageFailedError>
      _shareMessageFailedStreamController = StreamController.broadcast();
  Stream<ShareMessageFailedError> get shareMessageFailed =>
      _shareMessageFailedStreamController.stream;

  final StreamController<bool> _emojiStatusSetStreamController =
      StreamController.broadcast();
  Stream<bool> get emojiStatusSet => _emojiStatusSetStreamController.stream;

  final StreamController<EmojiStatusFailedError>
      _emojiStatusFailedStreamController = StreamController.broadcast();
  Stream<EmojiStatusFailedError> get emojiStatusFailed =>
      _emojiStatusFailedStreamController.stream;

  final StreamController<EmojiStatusAccessRequestedStatus>
      _emojiStatusAccessRequestedStreamController =
      StreamController.broadcast();
  Stream<EmojiStatusAccessRequestedStatus> get emojiStatusAccessRequested =>
      _emojiStatusAccessRequestedStreamController.stream;

  final StreamController<FileDownloadRequestedStatus>
      _fileDownloadRequestedStreamController = StreamController.broadcast();
  Stream<FileDownloadRequestedStatus> get fileDownloadRequested =>
      _fileDownloadRequestedStreamController.stream;
}
