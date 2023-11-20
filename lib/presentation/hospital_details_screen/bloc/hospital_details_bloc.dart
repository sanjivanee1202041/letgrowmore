import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:holisticheal/presentation/hospital_details_screen/models/hospital_details_model.dart';
part 'hospital_details_event.dart';
part 'hospital_details_state.dart';

/// A bloc that manages the state of a HospitalDetails according to the event that is dispatched to it.
class HospitalDetailsBloc
    extends Bloc<HospitalDetailsEvent, HospitalDetailsState> {
  HospitalDetailsBloc(HospitalDetailsState initialState) : super(initialState) {
    on<HospitalDetailsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HospitalDetailsInitialEvent event,
    Emitter<HospitalDetailsState> emit,
  ) async {}
}
