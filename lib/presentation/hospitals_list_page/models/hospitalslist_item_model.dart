import '../../../core/app_export.dart';

/// This class is used in the [hospitalslist_item_widget] screen.
class HospitalslistItemModel {
  HospitalslistItemModel({
    this.image,
    this.nameAyurVAIDlocation,
    this.id,
  }) {
    image = image ?? ImageConstant.imgImage2;
    nameAyurVAIDlocation = nameAyurVAIDlocation ??
        "Name: AyurVAID\nlocation: Domlur Extension, Bengaluru";
    id = id ?? "";
  }

  String? image;

  String? nameAyurVAIDlocation;

  String? id;
}
