// ignore_for_file: must_be_immutable

part of 'hospitals_list_container_bloc.dart';

/// Represents the state of HospitalsListContainer in the application.
class HospitalsListContainerState extends Equatable {
  HospitalsListContainerState({this.hospitalsListContainerModelObj});

  HospitalsListContainerModel? hospitalsListContainerModelObj;

  @override
  List<Object?> get props => [
        hospitalsListContainerModelObj,
      ];
  HospitalsListContainerState copyWith(
      {HospitalsListContainerModel? hospitalsListContainerModelObj}) {
    return HospitalsListContainerState(
      hospitalsListContainerModelObj:
          hospitalsListContainerModelObj ?? this.hospitalsListContainerModelObj,
    );
  }
}
