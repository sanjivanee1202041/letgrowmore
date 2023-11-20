import '../../../core/app_export.dart';

/// This class is used in the [hospitalslistcontainer_item_widget] screen.
class HospitalslistcontainerItemModel {
  HospitalslistcontainerItemModel({
    this.image,
    this.nameAyurVAIDlocation,
    this.id,
  }) {
    image = image ?? ImageConstant.imgImage286x152;
    nameAyurVAIDlocation = nameAyurVAIDlocation ??
        "Name: AyurVAID\nlocation: Domlur Extension, Bengaluru";
    id = id ?? "";
  }

  String? image;

  String? nameAyurVAIDlocation;

  String? id;
}
