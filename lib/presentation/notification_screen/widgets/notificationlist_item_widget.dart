import '../models/notificationlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';

// ignore: must_be_immutable
class NotificationlistItemWidget extends StatelessWidget {
  NotificationlistItemWidget(
    this.notificationlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationlistItemModel notificationlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 1.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 14.v),
          Padding(
            padding: EdgeInsets.only(right: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Text(
                    notificationlistItemModelObj.somethinghashappened!,
                    style: CustomTextStyles.titleSmallPoppinsOnPrimaryContainer,
                  ),
                ),
                CustomImageView(
                  imagePath: notificationlistItemModelObj?.image,
                  height: 11.v,
                  width: 14.h,
                  margin: EdgeInsets.only(bottom: 11.v),
                ),
              ],
            ),
          ),
          SizedBox(height: 13.v),
          SizedBox(
            width: 216.h,
            child: Text(
              notificationlistItemModelObj.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodySmallPoppinsOnPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
