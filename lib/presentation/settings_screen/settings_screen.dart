import 'bloc/settings_bloc.dart';
import 'models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/presentation/hospitals_list_page/hospitals_list_page.dart';
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
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 31.h),
                child: Column(children: [
                  SizedBox(height: 33.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgBackTo,
                      height: 57.v,
                      width: 52.h,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 2.h)),
                  SizedBox(height: 39.v),
                  _buildItunuoluwaAbidoye(context),
                  SizedBox(height: 25.v),
                  _buildMyAccount(context),
                  SizedBox(height: 28.v),
                  _buildSavedBeneficiary(context),
                  SizedBox(height: 28.v),
                  _buildDarkMode(context),
                  SizedBox(height: 28.v),
                  _buildSecurityShield(context),
                  SizedBox(height: 28.v),
                  _buildLanguage(context),
                  SizedBox(height: 28.v),
                  _buildShare(context),
                  SizedBox(height: 28.v),
                  _buildLogOut2(context),
                  SizedBox(height: 26.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: 111.v,
                          width: 98.h,
                          margin: EdgeInsets.only(right: 53.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.h, vertical: 9.v),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: fs.Svg(ImageConstant.imgEllipse9),
                                  fit: BoxFit.cover)),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgGear,
                              height: 72.v,
                              width: 65.h,
                              alignment: Alignment.topCenter)))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildItunuoluwaAbidoye(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 3.h),
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 16.v),
        decoration: AppDecoration.outlineBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Row(children: [
          SizedBox(
              height: 57.v,
              width: 60.h,
              child: Stack(alignment: Alignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgEllipse643,
                    height: 57.v,
                    width: 60.h,
                    radius: BorderRadius.circular(30.h),
                    alignment: Alignment.center),
                CustomImageView(
                    imagePath: ImageConstant.imgUserImage,
                    height: 53.v,
                    width: 57.h,
                    radius: BorderRadius.circular(28.h),
                    alignment: Alignment.center)
              ])),
          Padding(
              padding: EdgeInsets.only(left: 11.h, top: 10.v, bottom: 10.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("msg_itunuoluwa_abidoye".tr,
                        style: CustomTextStyles.titleSmallOnPrimaryContainer),
                    SizedBox(height: 2.v),
                    Text("lbl_itunuoluwa".tr,
                        style: theme.textTheme.labelMedium)
                  ])),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgEdit,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(top: 17.v, right: 12.h, bottom: 16.v))
        ]));
  }

  /// Section Widget
  Widget _buildMyAccount(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 45.adaptSize,
              width: 45.adaptSize,
              padding: EdgeInsets.all(6.h),
              child: CustomImageView(imagePath: ImageConstant.imgGroup12334)),
          Padding(
              padding: EdgeInsets.only(left: 18.h, top: 2.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_my_account".tr,
                        style: theme.textTheme.titleSmall),
                    SizedBox(height: 5.v),
                    Text("msg_make_changes_to".tr,
                        style: theme.textTheme.bodySmall)
                  ])),
          Spacer(flex: 56),
          CustomImageView(
              imagePath: ImageConstant.imgWarning,
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 14.v)),
          Spacer(flex: 43),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 13.v,
              width: 7.h,
              margin: EdgeInsets.symmetric(vertical: 16.v))
        ]));
  }

  /// Section Widget
  Widget _buildSavedBeneficiary(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 45.adaptSize,
              width: 45.adaptSize,
              padding: EdgeInsets.all(6.h),
              child: CustomImageView(imagePath: ImageConstant.imgGroup12334)),
          Padding(
              padding: EdgeInsets.only(left: 18.h, top: 2.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("msg_saved_beneficiary".tr,
                        style: theme.textTheme.titleSmall),
                    SizedBox(height: 5.v),
                    Text("msg_manage_your_saved".tr,
                        style: theme.textTheme.bodySmall)
                  ])),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 13.v,
              width: 7.h,
              margin: EdgeInsets.symmetric(vertical: 16.v))
        ]));
  }

  /// Section Widget
  Widget _buildDarkMode(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 45.adaptSize,
              width: 45.adaptSize,
              padding: EdgeInsets.all(5.h),
              child:
                  CustomImageView(imagePath: ImageConstant.imgGroup1233445x45)),
          Padding(
              padding: EdgeInsets.only(left: 18.h, bottom: 2.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_dark_mode".tr, style: theme.textTheme.titleSmall),
                    SizedBox(height: 5.v),
                    Text("msg_default_device_theme".tr,
                        style: theme.textTheme.bodySmall)
                  ])),
          Spacer(),
          BlocSelector<SettingsBloc, SettingsState, bool?>(
              selector: (state) => state.isSelectedSwitch,
              builder: (context, isSelectedSwitch) {
                return CustomSwitch(
                    margin: EdgeInsets.symmetric(vertical: 5.v),
                    value: isSelectedSwitch,
                    onChange: (value) {
                      context
                          .read<SettingsBloc>()
                          .add(ChangeSwitchEvent(value: value));
                    });
              })
        ]));
  }

  /// Section Widget
  Widget _buildSecurityShield(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 45.adaptSize,
              width: 45.adaptSize,
              padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 3.v),
              decoration: AppDecoration.fillOnErrorContainer
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
              child: CustomImageView(
                  imagePath: ImageConstant.imgSecurityShield,
                  height: 31.adaptSize,
                  width: 31.adaptSize,
                  alignment: Alignment.bottomCenter)),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: _buildLogOut(context,
                  logOutText: "msg_two_factor_authentication".tr,
                  furtherSecureText: "msg_further_secure_your".tr)),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 13.v,
              width: 7.h,
              margin: EdgeInsets.symmetric(vertical: 16.v))
        ]));
  }

  /// Section Widget
  Widget _buildLanguage(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomIconButton(
                  height: 45.adaptSize,
                  width: 45.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  child:
                      CustomImageView(imagePath: ImageConstant.imgGroup123341)),
              Padding(
                  padding: EdgeInsets.only(left: 18.h, top: 3.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_language".tr,
                            style: theme.textTheme.titleSmall),
                        SizedBox(height: 5.v),
                        Align(
                            alignment: Alignment.center,
                            child: Text("lbl_multi_lingual".tr,
                                style: theme.textTheme.bodySmall))
                      ])),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowRight,
                  height: 13.v,
                  width: 7.h,
                  margin: EdgeInsets.only(top: 11.v, bottom: 21.v))
            ]));
  }

  /// Section Widget
  Widget _buildShare(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 45.adaptSize,
              width: 45.adaptSize,
              padding: EdgeInsets.all(6.h),
              child: CustomImageView(imagePath: ImageConstant.imgGroup123342)),
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_share".tr, style: theme.textTheme.titleSmall),
                    SizedBox(height: 6.v),
                    Text("lbl_share_app".tr, style: theme.textTheme.bodySmall)
                  ])),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 13.v,
              width: 7.h,
              margin: EdgeInsets.only(top: 7.v, bottom: 24.v))
        ]));
  }

  /// Section Widget
  Widget _buildLogOut2(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapLogOut(context);
        },
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 2.v),
                      child: CustomIconButton(
                          height: 45.adaptSize,
                          width: 45.adaptSize,
                          padding: EdgeInsets.all(6.h),
                          decoration: IconButtonStyleHelper.fillErrorContainer,
                          child: CustomImageView(
                              imagePath: ImageConstant.imgGroup123343))),
                  Padding(
                      padding: EdgeInsets.only(left: 18.h, top: 6.v),
                      child: _buildLogOut(context,
                          logOutText: "lbl_log_out".tr,
                          furtherSecureText: "msg_further_secure_your".tr)),
                  Spacer(),
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowRight,
                      height: 13.v,
                      width: 7.h,
                      margin: EdgeInsets.only(top: 19.v, bottom: 16.v))
                ])));
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
          style: CustomTextStyles.titleSmallErrorContainer
              .copyWith(color: theme.colorScheme.errorContainer)),
      SizedBox(height: 5.v),
      Text(furtherSecureText,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray500))
    ]);
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

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogOut(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
