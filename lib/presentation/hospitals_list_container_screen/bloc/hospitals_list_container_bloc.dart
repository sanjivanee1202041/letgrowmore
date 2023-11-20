import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:holisticheal/presentation/hospitals_list_container_screen/models/hospitals_list_container_model.dart';
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
  ) async {}
}
