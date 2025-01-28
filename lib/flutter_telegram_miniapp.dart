library;

import 'dart:async';
import 'dart:js_interop';
import 'dart:ui';

import 'package:async/async.dart';
import 'package:flutter/rendering.dart';

import 'flutter_telegram_miniapp.dart';
import 'src/types/event_handler.dart';

export 'src/extensions/color_hex_extension.dart';

export 'src/types/back_button.dart';
export 'src/types/main_button.dart';
export 'src/types/secondary_button.dart';
export 'src/types/settings_button.dart';
export 'src/types/haptic_feedback.dart';
export 'src/types/cloud_storage.dart';
export 'src/types/biometric_manager.dart';
export 'src/types/accelerometer.dart';
export 'src/types/device_orientation.dart';
export 'src/types/gyroscope.dart';
export 'src/types/location_manager.dart';

export 'src/enums/home_screen_checked_status.dart';
export 'src/enums/invoice_result.dart';
export 'src/enums/popup_button_type.dart';
export 'src/enums/webapp_chat_type.dart';
export 'src/enums/webapp_color_scheme.dart';
export 'src/enums/write_access_requested_status.dart';
export 'src/enums/contact_requested_status.dart';
export 'src/enums/fullscreen_failed_error.dart';
export 'src/enums/accelerometer_failed_error.dart';
export 'src/enums/device_orientation_failed_error.dart';
export 'src/enums/gyroscope_failed_error.dart';
export 'src/enums/share_message_failed_error.dart';
export 'src/enums/emoji_status_failed_error.dart';
export 'src/enums/emoji_status_access_requested_status.dart';
export 'src/enums/file_download_requested_status.dart';

part 'src/types/download_file_params.dart';
part 'src/types/emoji_status_params.dart';
part 'src/types/open_link_options.dart';
part 'src/types/popub_button.dart';
part 'src/types/popup_params.dart';
part 'src/types/scan_qr_popup_params.dart';
part 'src/types/story_share_params.dart';
part 'src/types/story_widget_link.dart';
part 'src/types/theme_params.dart';
part 'src/types/webapp_chat.dart';
part 'src/types/webapp_init_data.dart';
part 'src/types/webapp_user.dart';
part 'src/types/safe_area_insert.dart';
part 'src/types/content_safe_area_insert.dart';
part 'src/web_app.dart';

const String webAppPath = "window.Telegram.WebApp";
