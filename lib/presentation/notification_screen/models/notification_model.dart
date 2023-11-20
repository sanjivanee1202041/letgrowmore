// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'notificationlist_item_model.dart';

/// This class defines the variables used in the [notification_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationModel extends Equatable {
  NotificationModel({this.notificationlistItemList = const []}) {}

  List<NotificationlistItemModel> notificationlistItemList;

  NotificationModel copyWith(
      {List<NotificationlistItemModel>? notificationlistItemList}) {
    return NotificationModel(
      notificationlistItemList:
          notificationlistItemList ?? this.notificationlistItemList,
    );
  }

  @override
  List<Object?> get props => [notificationlistItemList];
}
