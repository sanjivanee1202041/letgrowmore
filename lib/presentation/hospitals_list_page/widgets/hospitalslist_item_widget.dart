import '../models/hospitalslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';

// ignore: must_be_immutable
class HospitalslistItemWidget extends StatelessWidget {
  HospitalslistItemWidget(
    this.hospitalslistItemModelObj, {
    Key? key,
    this.onTapImgHandLeft,
  }) : super(
          key: key,
        );

  HospitalslistItemModel hospitalslistItemModelObj;

  VoidCallback? onTapImgHandLeft;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 14.v,
        ),
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder31,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 2.h,
                right: 7.h,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: hospitalslistItemModelObj?.image,
                    height: 126.v,
                    width: 223.h,
                    radius: BorderRadius.circular(
                      18.h,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgHandLeft,
                    height: 78.adaptSize,
                    width: 78.adaptSize,
                    margin: EdgeInsets.only(
                      left: 15.h,
                      top: 24.v,
                      bottom: 24.v,
                    ),
                    onTap: () {
                      onTapImgHandLeft!.call();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.v),
            Container(
              width: 301.h,
              margin: EdgeInsets.only(right: 25.h),
              child: Text(
                hospitalslistItemModelObj.nameAyurVAIDlocation!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 2.v),
          ],
        ),
      ),
    );
  }
}
