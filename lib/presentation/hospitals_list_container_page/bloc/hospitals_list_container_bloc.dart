import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/hospitalslistcontainer_item_model.dart';
import 'package:holisticheal/presentation/hospitals_list_container_page/models/hospitals_list_container_model.dart';
part 'hospitals_list_container_event.dart';
part 'hospitals_list_container_state.dart';

/// A bloc that manages the state of a HospitalsListContainer according to the event that is dispatched to it.
class HospitalsListContainerBloc
    extends Bloc<HospitalsListContainerEvent, HospitalsListContainerState> {
  HospitalsListContainerBloc(HospitalsListContainerState initialState)
      : super(initialState) {
    on<HospitalsListContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HospitalsListContainerInitialEvent event,
    Emitter<HospitalsListContainerState> emit,
  ) async {
    emit(state.copyWith(
        hospitalsListContainerModelObj: state.hospitalsListContainerModelObj
            ?.copyWith(
                hospitalslistcontainerItemList:
                    fillHospitalslistcontainerItemList())));
  }

  List<HospitalslistcontainerItemModel> fillHospitalslistcontainerItemList() {
    return [
      HospitalslistcontainerItemModel(
          image: ImageConstant.imgImage286x152,
          nameAyurVAIDlocation:
              "Name: AyurVAID\nlocation: Domlur Extension, Bengaluru"),
      HospitalslistcontainerItemModel(
          image: ImageConstant.imgImage481x152,
          nameAyurVAIDlocation:
              "Name: Maharshi Ayurveda \nlocation: Shalimar Bagh, New Delhi"),
      HospitalslistcontainerItemModel(
          image: ImageConstant.imgImage186x152,
          nameAyurVAIDlocation:
              "Name:Sahaya Holistic Integrative\nlocation: Jayanagar, Bengaluru")
    ];
  }
}
