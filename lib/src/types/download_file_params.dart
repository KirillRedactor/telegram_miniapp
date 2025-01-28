part of '../../flutter_telegram_miniapp.dart';

/// This object describes the parameters for the file download request.
///
///
/// >Note: To ensure consistent file download behavior across platforms, it is
/// >recommended to include the HTTP header `Content-Disposition: attachment;
// ignore: unintended_html_in_doc_comment
/// >filename="<file_name>"` in the server response. This header helps prompt
/// >the download action and suggests a file name for the downloaded file,
/// >especially on web platforms where forced downloads cannot always be
/// >guaranteed.
///
/// [API Reference](https://core.telegram.org/bots/webapps#downloadfileparams)
@JSExport()
class DownloadFileParams {
  /// The HTTPS URL of the file to be downloaded.
  String url;

  /// The suggested name for the downloaded file.
  // ignore: non_constant_identifier_names
  String file_name;

  DownloadFileParams({
    required this.url,
    required String fileName,
  }) : file_name = fileName;

  DownloadFileParamsExternal get _toExt =>
      createJSInteropWrapper<DownloadFileParams>(this)
          as DownloadFileParamsExternal;
}

extension type DownloadFileParamsExternal(JSObject _) implements JSObject {
  external String url;
  // ignore: non_constant_identifier_names
  external String file_name;
}
