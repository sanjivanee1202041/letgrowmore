// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'hospitalslist_item_model.dart';

/// This class defines the variables used in the [hospitals_list_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HospitalsListModel extends Equatable {
  HospitalsListModel({this.hospitalslistItemList = const []}) {}

  List<HospitalslistItemModel> hospitalslistItemList;

  HospitalsListModel copyWith(
      {List<HospitalslistItemModel>? hospitalslistItemList}) {
    return HospitalsListModel(
      hospitalslistItemList:
          hospitalslistItemList ?? this.hospitalslistItemList,
    );
  }

  @override
  List<Object?> get props => [hospitalslistItemList];
}
