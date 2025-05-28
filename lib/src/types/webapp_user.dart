part of '../../flutter_telegram_miniapp.dart';

class WebAppUser {
  final int id;
  final bool isBot;
  final String firstName;
  final String? lastName;
  final String? username;
  final String? languageCode;
  final bool isPremium;
  final bool addedToAttachmentMenu;
  final bool allowsWriteToPm;
  final String? photoUrl;

  WebAppUser._({
    required this.id,
    this.isBot = false,
    required this.firstName,
    this.lastName,
    this.username,
    this.languageCode,
    this.isPremium = false,
    this.addedToAttachmentMenu = false,
    this.allowsWriteToPm = false,
    this.photoUrl,
  });

  factory WebAppUser._fromExternal(WebAppUserExternal ext) => WebAppUser._(
        id: ext.id.toDartInt,
        isBot: ext.isBot ?? false,
        firstName: ext.firstName,
        lastName: ext.lastName,
        username: ext.username,
        languageCode: ext.languageCode,
        isPremium: ext.isPremium ?? false,
        addedToAttachmentMenu: ext.addedToAttachmentMenu ?? false,
        allowsWriteToPm: ext.allowsWriteToPm ?? false,
        photoUrl: ext.photoUrl,
      );

  @override
  String toString() {
    return 'WebAppUser(id: $id, isBot: $isBot, firstName: $firstName, lastName: $lastName, username: $username, languageCode: $languageCode, isPremium: $isPremium, addedToAttachmentMenu: $addedToAttachmentMenu, allowsWriteToPm: $allowsWriteToPm, photoUrl: $photoUrl)';
  }
}

extension type WebAppUserExternal(JSObject _) implements JSObject {
  @JS("id")
  external JSNumber id;
  @JS("is_bot")
  external bool? isBot;
  @JS("first_name")
  external String firstName;
  @JS("last_name")
  external String? lastName;
  @JS("username")
  external String? username;
  @JS("language_code")
  external String? languageCode;
  @JS("is_premium")
  external bool? isPremium;
  @JS("added_to_attachment_menu")
  external bool? addedToAttachmentMenu;
  @JS("allows_write_to_pm")
  external bool? allowsWriteToPm;
  @JS("photo_url")
  external String? photoUrl;
}
