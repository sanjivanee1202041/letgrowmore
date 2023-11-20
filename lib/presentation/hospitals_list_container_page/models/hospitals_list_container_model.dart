// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'hospitalslistcontainer_item_model.dart';

/// This class defines the variables used in the [hospitals_list_container_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HospitalsListContainerModel extends Equatable {
  HospitalsListContainerModel(
      {this.hospitalslistcontainerItemList = const []}) {}

  List<HospitalslistcontainerItemModel> hospitalslistcontainerItemList;

  HospitalsListContainerModel copyWith(
      {List<HospitalslistcontainerItemModel>? hospitalslistcontainerItemList}) {
    return HospitalsListContainerModel(
      hospitalslistcontainerItemList:
          hospitalslistcontainerItemList ?? this.hospitalslistcontainerItemList,
    );
  }

  @override
  List<Object?> get props => [hospitalslistcontainerItemList];
}
