import '../models/hospitalslistcontainer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';

// ignore: must_be_immutable
class HospitalslistcontainerItemWidget extends StatelessWidget {
  HospitalslistcontainerItemWidget(
    this.hospitalslistcontainerItemModelObj, {
    Key? key,
    this.onTapImgHandLeft,
  }) : super(
          key: key,
        );

  HospitalslistcontainerItemModel hospitalslistcontainerItemModelObj;

  VoidCallback? onTapImgHandLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder21,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              right: 5.h,
            ),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: hospitalslistcontainerItemModelObj?.image,
                  height: 86.v,
                  width: 152.h,
                  radius: BorderRadius.circular(
                    12.h,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgHandLeft,
                  height: 53.adaptSize,
                  width: 53.adaptSize,
                  margin: EdgeInsets.only(
                    left: 10.h,
                    top: 16.v,
                    bottom: 16.v,
                  ),
                  onTap: () {
                    onTapImgHandLeft!.call();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 4.v),
          Container(
            width: 205.h,
            margin: EdgeInsets.only(right: 17.h),
            child: Text(
              hospitalslistcontainerItemModelObj.nameAyurVAIDlocation!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodySmallInterBlack900,
            ),
          ),
          SizedBox(height: 1.v),
        ],
      ),
    );
  }
}
