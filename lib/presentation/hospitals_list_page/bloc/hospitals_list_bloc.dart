import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/hospitalslist_item_model.dart';
import 'package:holisticheal/presentation/hospitals_list_page/models/hospitals_list_model.dart';
part 'hospitals_list_event.dart';
part 'hospitals_list_state.dart';

/// A bloc that manages the state of a HospitalsList according to the event that is dispatched to it.
class HospitalsListBloc extends Bloc<HospitalsListEvent, HospitalsListState> {
  HospitalsListBloc(HospitalsListState initialState) : super(initialState) {
    on<HospitalsListInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HospitalsListInitialEvent event,
    Emitter<HospitalsListState> emit,
  ) async {
    emit(state.copyWith(
        hospitalsListModelObj: state.hospitalsListModelObj
            ?.copyWith(hospitalslistItemList: fillHospitalslistItemList())));
  }

  List<HospitalslistItemModel> fillHospitalslistItemList() {
    return [
      HospitalslistItemModel(
          image: ImageConstant.imgImage2,
          nameAyurVAIDlocation:
              "Name: AyurVAID\nlocation: Domlur Extension, Bengaluru"),
      HospitalslistItemModel(
          image: ImageConstant.imgImage4,
          nameAyurVAIDlocation:
              "Name: Maharshi Ayurveda \nlocation: Shalimar Bagh, New Delhi")
    ];
  }
}
