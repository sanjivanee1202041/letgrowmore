// ignore_for_file: must_be_immutable

part of 'hospitals_list_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HospitalsList widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HospitalsListEvent extends Equatable {}

/// Event that is dispatched when the HospitalsList widget is first created.
class HospitalsListInitialEvent extends HospitalsListEvent {
  @override
  List<Object?> get props => [];
}
