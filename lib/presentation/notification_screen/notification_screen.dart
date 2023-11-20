import '../notification_screen/widgets/notificationlist_item_widget.dart';
import 'bloc/notification_bloc.dart';
import 'models/notification_model.dart';
import 'models/notificationlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/presentation/hospitals_list_page/hospitals_list_page.dart';
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
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 17.h),
                child: Column(children: [
                  SizedBox(height: 25.v),
                  _buildNotificationList(context),
                  SizedBox(height: 50.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(left: 65.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                    height: 177.v,
                                    width: 173.h,
                                    child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgFindClinic,
                                              height: 66.v,
                                              width: 80.h,
                                              alignment: Alignment.bottomRight,
                                              margin:
                                                  EdgeInsets.only(right: 24.h)),
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgAddReminder,
                                              height: 66.v,
                                              width: 59.h,
                                              alignment: Alignment.bottomLeft,
                                              margin: EdgeInsets.only(
                                                  left: 38.h, bottom: 15.v)),
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgFindClinic,
                                              height: 62.v,
                                              width: 64.h,
                                              alignment: Alignment.bottomRight,
                                              margin: EdgeInsets.only(
                                                  bottom: 13.v)),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                  height: 111.v,
                                                  width: 98.h,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 19.h,
                                                      vertical: 13.v),
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: fs.Svg(
                                                              ImageConstant
                                                                  .imgEllipse9),
                                                          fit: BoxFit.cover)),
                                                  child: CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgAddReminder,
                                                      height: 66.v,
                                                      width: 59.h,
                                                      alignment:
                                                          Alignment.topCenter)))
                                        ])),
                                Container(
                                    height: 73.v,
                                    width: 74.h,
                                    margin: EdgeInsets.only(
                                        left: 8.h, top: 95.v, bottom: 9.v),
                                    child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgTestAccount,
                                              height: 72.v,
                                              width: 65.h,
                                              alignment: Alignment.center),
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgTestAccount,
                                              height: 72.v,
                                              width: 65.h,
                                              alignment: Alignment.centerRight),
                                          CustomImageView(
                                              imagePath: ImageConstant.imgGear,
                                              height: 72.v,
                                              width: 65.h,
                                              alignment: Alignment.centerLeft,
                                              onTap: () {
                                                onTapImgGear(context);
                                              })
                                        ])),
                                Container(
                                    height: 74.v,
                                    width: 66.h,
                                    margin: EdgeInsets.only(
                                        left: 10.h, top: 95.v, bottom: 8.v),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant.imgGear,
                                              height: 72.v,
                                              width: 65.h,
                                              alignment: Alignment.center),
                                          CustomImageView(
                                              imagePath: ImageConstant.imgGear,
                                              height: 72.v,
                                              width: 65.h,
                                              alignment: Alignment.center),
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgTestAccount,
                                              height: 72.v,
                                              width: 65.h,
                                              alignment: Alignment.center)
                                        ]))
                              ])))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 86.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBackTo,
            margin: EdgeInsets.only(left: 34.h, bottom: 37.v)),
        centerTitle: true,
        title: AppbarTitle(
            text: "lbl_notifications".tr, margin: EdgeInsets.only(top: 55.v)));
  }

  /// Section Widget
  Widget _buildNotificationList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h),
        child: BlocSelector<NotificationBloc, NotificationState,
                NotificationModel?>(
            selector: (state) => state.notificationModelObj,
            builder: (context, notificationModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 27.v);
                  },
                  itemCount:
                      notificationModelObj?.notificationlistItemList.length ??
                          0,
                  itemBuilder: (context, index) {
                    NotificationlistItemModel model =
                        notificationModelObj?.notificationlistItemList[index] ??
                            NotificationlistItemModel();
                    return NotificationlistItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Addreminder:
        return AppRoutes.hospitalsListPage;
      case BottomBarEnum.Findclinic:
        return "/";
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
      case AppRoutes.hospitalsListPage:
        return HospitalsListPage.builder(context);
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImgGear(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsScreen,
    );
  }
}
