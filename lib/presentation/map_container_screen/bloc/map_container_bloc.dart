import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:holisticheal/presentation/map_container_screen/models/map_container_model.dart';
part 'map_container_event.dart';
part 'map_container_state.dart';

/// A bloc that manages the state of a MapContainer according to the event that is dispatched to it.
class MapContainerBloc extends Bloc<MapContainerEvent, MapContainerState> {
  MapContainerBloc(MapContainerState initialState) : super(initialState) {
    on<MapContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MapContainerInitialEvent event,
    Emitter<MapContainerState> emit,
  ) async {}
}
