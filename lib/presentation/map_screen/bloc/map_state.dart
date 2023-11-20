// ignore_for_file: must_be_immutable

part of 'map_bloc.dart';

/// Represents the state of Map in the application.
class MapState extends Equatable {
  MapState({
    this.searchController,
    this.mapModelObj,
  });

  TextEditingController? searchController;

  MapModel? mapModelObj;

  @override
  List<Object?> get props => [
        searchController,
        mapModelObj,
      ];
  MapState copyWith({
    TextEditingController? searchController,
    MapModel? mapModelObj,
  }) {
    return MapState(
      searchController: searchController ?? this.searchController,
      mapModelObj: mapModelObj ?? this.mapModelObj,
    );
  }
}
