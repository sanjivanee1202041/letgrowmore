// ignore_for_file: must_be_immutable

part of 'hospitals_list_bloc.dart';

/// Represents the state of HospitalsList in the application.
class HospitalsListState extends Equatable {
  HospitalsListState({this.hospitalsListModelObj});

  HospitalsListModel? hospitalsListModelObj;

  @override
  List<Object?> get props => [
        hospitalsListModelObj,
      ];
  HospitalsListState copyWith({HospitalsListModel? hospitalsListModelObj}) {
    return HospitalsListState(
      hospitalsListModelObj:
          hospitalsListModelObj ?? this.hospitalsListModelObj,
    );
  }
}
