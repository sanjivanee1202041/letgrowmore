// ignore_for_file: must_be_immutable

part of 'hospital_details_bloc.dart';

/// Represents the state of HospitalDetails in the application.
class HospitalDetailsState extends Equatable {
  HospitalDetailsState({this.hospitalDetailsModelObj});

  HospitalDetailsModel? hospitalDetailsModelObj;

  @override
  List<Object?> get props => [
        hospitalDetailsModelObj,
      ];
  HospitalDetailsState copyWith(
      {HospitalDetailsModel? hospitalDetailsModelObj}) {
    return HospitalDetailsState(
      hospitalDetailsModelObj:
          hospitalDetailsModelObj ?? this.hospitalDetailsModelObj,
    );
  }
}
