import 'bloc/settings_bloc.dart';
import 'models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/presentation/hospitals_list_container_page/hospitals_list_container_page.dart';
import 'package:holisticheal/presentation/map_page/map_page.dart';
import 'package:holisticheal/widgets/custom_bottom_bar.dart';
import 'package:holisticheal/widgets/custom_icon_button.dart';
import 'package:holisticheal/widgets/custom_switch.dart';

// ignore_for_file: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
        create: (context) =>
            SettingsBloc(SettingsState(settingsModelObj: SettingsModel()))
              ..add(SettingsInitialEvent()),
        child: SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: 363.h,
                padding: EdgeInsets.symmetric(horizontal: 22.h),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SizedBox(height: 22.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgBackTo,
                      height: 38.v,
                      width: 35.h,
                      alignment: Alignment.centerLeft),
                  SizedBox(height: 26.v),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 34.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.h, vertical: 10.v),
                      decoration: AppDecoration.outlineBlack.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder3),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(
                            height: 38.v,
                            width: 41.h,
                            child:
                                Stack(alignment: Alignment.center, children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgEllipse64338x41,
                                  height: 38.v,
                                  width: 41.h,
                                  radius: BorderRadius.circular(20.h),
                                  alignment: Alignment.center),
                              CustomImageView(
                                  imagePath: ImageConstant.imgUserImage36x38,
                                  height: 36.v,
                                  width: 38.h,
                                  radius: BorderRadius.circular(19.h),
                                  alignment: Alignment.center)
                            ])),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 7.h, top: 7.v, bottom: 7.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("msg_itunuoluwa_abidoye".tr,
                                      style: CustomTextStyles.labelSmallDMSans),
                                  SizedBox(height: 1.v),
                                  Text("lbl_itunuoluwa".tr,
                                      style: CustomTextStyles.dMSansBluegray100)
                                ])),
                        Spacer(),
                        CustomImageView(
                            imagePath: ImageConstant.imgEdit,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                            margin: EdgeInsets.only(
                                top: 11.v, right: 8.h, bottom: 10.v))
                      ])),
                  SizedBox(height: 17.v),
                  Padding(
                      padding: EdgeInsets.only(left: 36.h, right: 38.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                height: 31.adaptSize,
                                width: 31.adaptSize,
                                padding: EdgeInsets.all(4.h),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgGroup12334)),
                            Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_my_account".tr,
                                          style: theme.textTheme.labelMedium),
                                      SizedBox(height: 3.v),
                                      Text("msg_make_changes_to".tr,
                                          style: theme.textTheme.bodySmall)
                                    ])),
                            Spacer(),
                            CustomImageView(
                                imagePath: ImageConstant.imgWarning,
                                height: 10.v,
                                width: 11.h,
                                margin: EdgeInsets.symmetric(vertical: 10.v)),
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 9.v,
                                width: 5.h,
                                margin: EdgeInsets.only(
                                    left: 26.h, top: 11.v, bottom: 11.v))
                          ])),
                  SizedBox(height: 19.v),
                  Padding(
                      padding: EdgeInsets.only(left: 36.h, right: 38.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                height: 31.adaptSize,
                                width: 31.adaptSize,
                                padding: EdgeInsets.all(4.h),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgGroup12334)),
                            Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("msg_saved_beneficiary".tr,
                                          style: theme.textTheme.labelMedium),
                                      SizedBox(height: 3.v),
                                      Text("msg_manage_your_saved".tr,
                                          style: theme.textTheme.bodySmall)
                                    ])),
                            Spacer(),
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 9.v,
                                width: 5.h,
                                margin: EdgeInsets.symmetric(vertical: 11.v))
                          ])),
                  SizedBox(height: 19.v),
                  Padding(
                      padding: EdgeInsets.only(left: 36.h, right: 38.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 31.adaptSize,
                                width: 31.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.h, vertical: 3.v),
                                decoration: AppDecoration.fillOnErrorContainer
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder15),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgGroup1233445x45,
                                    height: 21.adaptSize,
                                    width: 21.adaptSize,
                                    alignment: Alignment.topCenter)),
                            Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_dark_mode".tr,
                                          style: theme.textTheme.labelMedium),
                                      SizedBox(height: 3.v),
                                      Text("msg_default_device_theme".tr,
                                          style: theme.textTheme.bodySmall)
                                    ])),
                            Spacer(),
                            BlocSelector<SettingsBloc, SettingsState, bool?>(
                                selector: (state) => state.isSelectedSwitch,
                                builder: (context, isSelectedSwitch) {
                                  return CustomSwitch(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 3.v),
                                      value: isSelectedSwitch,
                                      onChange: (value) {
                                        context.read<SettingsBloc>().add(
                                            ChangeSwitchEvent(value: value));
                                      });
                                })
                          ])),
                  SizedBox(height: 19.v),
                  Padding(
                      padding: EdgeInsets.only(left: 36.h, right: 38.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 31.adaptSize,
                                width: 31.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.h, vertical: 2.v),
                                decoration: AppDecoration.fillOnErrorContainer
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder15),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgSecurityShield,
                                    height: 21.adaptSize,
                                    width: 21.adaptSize,
                                    alignment: Alignment.bottomCenter)),
                            Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: _buildLogOut(context,
                                    logOutText:
                                        "msg_two_factor_authentication".tr,
                                    furtherSecureText:
                                        "msg_further_secure_your".tr)),
                            Spacer(),
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 9.v,
                                width: 5.h,
                                margin: EdgeInsets.symmetric(vertical: 11.v))
                          ])),
                  SizedBox(height: 19.v),
                  Padding(
                      padding: EdgeInsets.only(left: 36.h, right: 38.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomIconButton(
                                height: 31.adaptSize,
                                width: 31.adaptSize,
                                padding: EdgeInsets.all(4.h),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgGroup123341)),
                            Padding(
                                padding: EdgeInsets.only(left: 12.h, top: 2.v),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_language".tr,
                                          style: theme.textTheme.labelMedium),
                                      SizedBox(height: 3.v),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text("lbl_multi_lingual".tr,
                                              style: theme.textTheme.bodySmall))
                                    ])),
                            Spacer(),
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 9.v,
                                width: 5.h,
                                margin: EdgeInsets.only(top: 7.v, bottom: 14.v))
                          ])),
                  SizedBox(height: 19.v),
                  Padding(
                      padding: EdgeInsets.only(left: 36.h, right: 38.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                height: 31.adaptSize,
                                width: 31.adaptSize,
                                padding: EdgeInsets.all(4.h),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgGroup123342)),
                            Padding(
                                padding: EdgeInsets.only(left: 12.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_share".tr,
                                          style: theme.textTheme.labelMedium),
                                      SizedBox(height: 4.v),
                                      Text("lbl_share_app".tr,
                                          style: theme.textTheme.bodySmall)
                                    ])),
                            Spacer(),
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowRight,
                                height: 9.v,
                                width: 5.h,
                                margin: EdgeInsets.only(top: 5.v, bottom: 17.v))
                          ])),
                  SizedBox(height: 19.v),
                  GestureDetector(
                      onTap: () {
                        onTapLogOut(context);
                      },
                      child: Padding(
                          padding: EdgeInsets.only(left: 36.h, right: 38.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 2.v),
                                    child: CustomIconButton(
                                        height: 31.adaptSize,
                                        width: 31.adaptSize,
                                        padding: EdgeInsets.all(4.h),
                                        decoration: IconButtonStyleHelper
                                            .fillErrorContainerTL15,
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgGroup123343))),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 12.h, top: 4.v),
                                    child: _buildLogOut(context,
                                        logOutText: "lbl_log_out".tr,
                                        furtherSecureText:
                                            "msg_further_secure_your".tr)),
                                Spacer(),
                                CustomImageView(
                                    imagePath: ImageConstant.imgArrowRight,
                                    height: 9.v,
                                    width: 5.h,
                                    margin: EdgeInsets.only(
                                        top: 12.v, bottom: 11.v))
                              ]))),
                  SizedBox(height: 17.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: 75.v,
                          width: 66.h,
                          margin: EdgeInsets.only(right: 104.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.h, vertical: 6.v),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: fs.Svg(ImageConstant.imgEllipse9),
                                  fit: BoxFit.cover)),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgGear,
                              height: 49.v,
                              width: 44.h,
                              alignment: Alignment.topCenter)))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildLogOut(
    BuildContext context, {
    required String logOutText,
    required String furtherSecureText,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(logOutText,
          style: CustomTextStyles.labelMediumErrorContainer
              .copyWith(color: theme.colorScheme.errorContainer)),
      SizedBox(height: 3.v),
      Text(furtherSecureText,
          style: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.secondaryContainer))
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

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogOut(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
