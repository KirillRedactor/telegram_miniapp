library;

import 'dart:async';
import 'dart:js_interop';
import 'dart:ui';

import 'package:async/async.dart';
import 'package:flutter/rendering.dart';

import './telegram_miniapp.dart';
import './types/event_handler.dart';

export './extensions/color_hex_extension.dart';

export './types/back_button.dart';
export './types/main_button.dart';
export './types/secondary_button.dart';
export './types/settings_button.dart';
export './types/haptic_feedback.dart';
export './types/cloud_storage.dart';
export './types/biometric_manager.dart';
export './types/accelerometer.dart';
export './types/device_orientation.dart';
export './types/gyroscope.dart';
export './types/location_manager.dart';

export './enums/home_screen_checked_status.dart';
export './enums/invoice_result.dart';
export './enums/popup_button_type.dart';
export './enums/webapp_chat_type.dart';
export './enums/webapp_color_scheme.dart';
export './enums/write_access_requested_status.dart';
export './enums/contact_requested_status.dart';
export './enums/fullscreen_failed_error.dart';
export './enums/accelerometer_failed_error.dart';
export './enums/device_orientation_failed_error.dart';
export './enums/gyroscope_failed_error.dart';
export './enums/share_message_failed_error.dart';
export './enums/emoji_status_failed_error.dart';
export './enums/emoji_status_access_requested_status.dart';
export './enums/file_download_requested_status.dart';

part './types/download_file_params.dart';
part './types/emoji_status_params.dart';
part './types/open_link_options.dart';
part './types/popub_button.dart';
part './types/popup_params.dart';
part './types/scan_qr_popup_params.dart';
part './types/story_share_params.dart';
part './types/story_widget_link.dart';
part './types/theme_params.dart';
part './types/webapp_chat.dart';
part './types/webapp_init_data.dart';
part './types/webapp_user.dart';
part './types/safe_area_insert.dart';
part './types/content_safe_area_insert.dart';
part 'web_app.dart';

const String webAppPath = "window.Telegram.WebApp";
