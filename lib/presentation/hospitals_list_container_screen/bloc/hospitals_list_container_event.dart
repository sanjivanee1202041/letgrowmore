// ignore_for_file: must_be_immutable

part of 'hospitals_list_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HospitalsListContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HospitalsListContainerEvent extends Equatable {}

/// Event that is dispatched when the HospitalsListContainer widget is first created.
class HospitalsListContainerInitialEvent extends HospitalsListContainerEvent {
  @override
  List<Object?> get props => [];
}
