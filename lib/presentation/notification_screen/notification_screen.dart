import 'bloc/notification_bloc.dart';
import 'models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/presentation/hospitals_list_container_page/hospitals_list_container_page.dart';
import 'package:holisticheal/presentation/map_page/map_page.dart';
import 'package:holisticheal/widgets/app_bar/appbar_leading_image.dart';
import 'package:holisticheal/widgets/app_bar/appbar_title.dart';
import 'package:holisticheal/widgets/app_bar/custom_app_bar.dart';
import 'package:holisticheal/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationBloc>(
        create: (context) => NotificationBloc(
            NotificationState(notificationModelObj: NotificationModel()))
          ..add(NotificationInitialEvent()),
        child: NotificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: 362.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.h, vertical: 17.v),
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: _buildSomethinghashappened(context,
                            notificationText: "msg_something_has_happened".tr,
                            notificationDescription: "msg_lucas_ipsum_dolor".tr,
                            closeIcon: ImageConstant.imgClose)),
                    SizedBox(height: 18.v),
                    Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: _buildSomethinghashappened(context,
                            notificationText: "msg_something_has_happened".tr,
                            notificationDescription: "msg_lucas_ipsum_dolor".tr,
                            closeIcon: ImageConstant.imgCloseWhiteA700)),
                    SizedBox(height: 18.v),
                    Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: _buildSomethinghashappened(context,
                            notificationText: "msg_something_has_happened".tr,
                            notificationDescription: "msg_lucas_ipsum_dolor".tr,
                            closeIcon: ImageConstant.imgClose)),
                    SizedBox(height: 18.v),
                    Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: _buildSomethinghashappened(context,
                            notificationText: "msg_something_has_happened".tr,
                            notificationDescription: "msg_lucas_ipsum_dolor".tr,
                            closeIcon: ImageConstant.imgClose)),
                    SizedBox(height: 17.v),
                    Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: _buildSomethinghashappened(context,
                            notificationText: "msg_something_has_happened".tr,
                            notificationDescription: "msg_lucas_ipsum_dolor".tr,
                            closeIcon: ImageConstant.imgClose)),
                    SizedBox(height: 17.v)
                  ])),
              bottomNavigationBar: _buildGear(context)));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 58.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBackTo,
            margin: EdgeInsets.only(left: 23.h, bottom: 25.v)),
        title: AppbarTitle(
            text: "lbl_notifications".tr,
            margin: EdgeInsets.only(left: 29.h, top: 37.v)));
  }

  /// Section Widget
  Widget _buildGear(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildSomethinghashappened(
    BuildContext context, {
    required String notificationText,
    required String notificationDescription,
    required String closeIcon,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 1.v),
                  decoration: AppDecoration.outlineBlack
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder3),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 9.v),
                        Text(notificationText,
                            style: theme.textTheme.labelSmall!.copyWith(
                                color: theme.colorScheme.onPrimaryContainer
                                    .withOpacity(1))),
                        SizedBox(height: 8.v),
                        SizedBox(
                            width: 147.h,
                            child: Text(notificationDescription,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.poppinsWhiteA700
                                    .copyWith(color: appTheme.whiteA700)))
                      ]))),
          CustomImageView(
              imagePath: closeIcon,
              height: 8.v,
              width: 12.h,
              margin: EdgeInsets.only(left: 40.h, top: 11.v, bottom: 41.v))
        ]);
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Searchproperty:
        return AppRoutes.mapPage;
      case BottomBarEnum.Addreminder:
        return AppRoutes.hospitalsListContainerPage;
      case BottomBarEnum.Testaccount:
        return "/";
      case BottomBarEnum.Gear:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.mapPage:
        return MapPage.builder(context);
      case AppRoutes.hospitalsListContainerPage:
        return HospitalsListContainerPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
