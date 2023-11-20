import '../../../core/app_export.dart';

/// This class is used in the [notificationlist_item_widget] screen.
class NotificationlistItemModel {
  NotificationlistItemModel({
    this.somethinghashappened,
    this.image,
    this.description,
    this.id,
  }) {
    somethinghashappened = somethinghashappened ?? "Something has happened";
    image = image ?? ImageConstant.imgClose;
    description = description ??
        "Lucas ipsum dolor sit amet chewbacca \naayla dantooine obi-wan atrivis.";
    id = id ?? "";
  }

  String? somethinghashappened;

  String? image;

  String? description;

  String? id;
}
