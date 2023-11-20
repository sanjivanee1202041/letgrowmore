import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/notificationlist_item_model.dart';
import 'package:holisticheal/presentation/notification_screen/models/notification_model.dart';
part 'notification_event.dart';
part 'notification_state.dart';

/// A bloc that manages the state of a Notification according to the event that is dispatched to it.
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(NotificationState initialState) : super(initialState) {
    on<NotificationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NotificationInitialEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(state.copyWith(
        notificationModelObj: state.notificationModelObj?.copyWith(
            notificationlistItemList: fillNotificationlistItemList())));
  }

  List<NotificationlistItemModel> fillNotificationlistItemList() {
    return [
      NotificationlistItemModel(
          somethinghashappened: "Something has happened",
          image: ImageConstant.imgClose,
          description:
              "Lucas ipsum dolor sit amet chewbacca \naayla dantooine obi-wan atrivis."),
      NotificationlistItemModel(
          somethinghashappened: "Something has happened",
          image: ImageConstant.imgCloseWhiteA700,
          description:
              "Lucas ipsum dolor sit amet chewbacca \naayla dantooine obi-wan atrivis."),
      NotificationlistItemModel(
          somethinghashappened: "Something has happened",
          image: ImageConstant.imgClose,
          description:
              "Lucas ipsum dolor sit amet chewbacca \naayla dantooine obi-wan atrivis."),
      NotificationlistItemModel(
          somethinghashappened: "Something has happened",
          image: ImageConstant.imgClose,
          description:
              "Lucas ipsum dolor sit amet chewbacca \naayla dantooine obi-wan atrivis."),
      NotificationlistItemModel(
          somethinghashappened: "Something has happened",
          image: ImageConstant.imgClose,
          description:
              "Lucas ipsum dolor sit amet chewbacca \naayla dantooine obi-wan atrivis.")
    ];
  }
}
