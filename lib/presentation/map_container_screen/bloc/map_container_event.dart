// ignore_for_file: must_be_immutable

part of 'map_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MapContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MapContainerEvent extends Equatable {}

/// Event that is dispatched when the MapContainer widget is first created.
class MapContainerInitialEvent extends MapContainerEvent {
  @override
  List<Object?> get props => [];
}
