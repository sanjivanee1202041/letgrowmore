// ignore_for_file: must_be_immutable

part of 'map_container_bloc.dart';

/// Represents the state of MapContainer in the application.
class MapContainerState extends Equatable {
  MapContainerState({this.mapContainerModelObj});

  MapContainerModel? mapContainerModelObj;

  @override
  List<Object?> get props => [
        mapContainerModelObj,
      ];
  MapContainerState copyWith({MapContainerModel? mapContainerModelObj}) {
    return MapContainerState(
      mapContainerModelObj: mapContainerModelObj ?? this.mapContainerModelObj,
    );
  }
}
