// ignore_for_file: must_be_immutable

part of 'hospital_details_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HospitalDetails widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HospitalDetailsEvent extends Equatable {}

/// Event that is dispatched when the HospitalDetails widget is first created.
class HospitalDetailsInitialEvent extends HospitalDetailsEvent {
  @override
  List<Object?> get props => [];
}
