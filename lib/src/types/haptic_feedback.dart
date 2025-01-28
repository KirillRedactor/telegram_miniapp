import 'dart:js_interop';

import '../enums/haptic_feedback_impact_style.dart';
import '../enums/haptic_feedback_notification_type.dart';
import '../../telegram_miniapp.dart';

const _hapticFeedbackPath = "$webAppPath.HapticFeedback";

@JS("$_hapticFeedbackPath.impactOccured")
external void _impactOccured(JSString style);

@JS("$_hapticFeedbackPath.notificationOccured")
external void _notificationOccured(JSString type);

@JS("$_hapticFeedbackPath.selectionChanged")
external void _selectionChanged();

class HapticFeedback {
  void impactOccured({required HapticFeedbackImpactStyle style}) =>
      _impactOccured(style.name.toJS);

  void notificationOccured({required HapticFeedbackNotificationType type}) =>
      _notificationOccured(type.name.toJS);

  void selectionChanged() => _selectionChanged();
}
