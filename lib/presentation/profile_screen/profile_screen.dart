import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/core/utils/validation_functions.dart';
import 'package:holisticheal/presentation/hospitals_list_page/hospitals_list_page.dart';
import 'package:holisticheal/widgets/custom_bottom_bar.dart';
import 'package:holisticheal/widgets/custom_drop_down.dart';
import 'package:holisticheal/widgets/custom_elevated_button.dart';
import 'package:holisticheal/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (context) =>
            ProfileBloc(ProfileState(profileModelObj: ProfileModel()))
              ..add(ProfileInitialEvent()),
        child: ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 35.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Spacer(),
                          SizedBox(
                              height: 78.adaptSize,
                              width: 78.adaptSize,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        height: 78.adaptSize,
                                        width: 78.adaptSize,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 22.h, vertical: 18.v),
                                        decoration: AppDecoration.fillDeepPurple
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder39),
                                        child: CustomImageView(
                                            imagePath: ImageConstant.imgUser,
                                            height: 40.v,
                                            width: 32.h,
                                            alignment: Alignment.center))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgUserImage72x72,
                                    height: 72.adaptSize,
                                    width: 72.adaptSize,
                                    radius: BorderRadius.circular(36.h),
                                    alignment: Alignment.center)
                              ])),
                          SizedBox(height: 20.v),
                          Text("msg_itunuoluwa_abidoye".tr,
                              style: theme.textTheme.titleMedium),
                          SizedBox(height: 2.v),
                          Text("msg_itunuoluwa_petra_africa".tr,
                              style: CustomTextStyles.bodyMediumGray500),
                          SizedBox(height: 40.v),
                          _buildFirstName(context),
                          SizedBox(height: 19.v),
                          _buildLastName(context),
                          SizedBox(height: 19.v),
                          _buildPhoneNumber(context),
                          SizedBox(height: 19.v),
                          Padding(
                              padding: EdgeInsets.only(left: 8.h, right: 7.h),
                              child: BlocSelector<ProfileBloc, ProfileState,
                                      ProfileModel?>(
                                  selector: (state) => state.profileModelObj,
                                  builder: (context, profileModelObj) {
                                    return CustomDropDown(
                                        icon: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 24.v, 16.h, 24.v),
                                            child: CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgArrowdown,
                                                height: 5.v,
                                                width: 8.h)),
                                        hintText: "msg_select_your_gender".tr,
                                        items:
                                            profileModelObj?.dropdownItemList ??
                                                [],
                                        onChanged: (value) {
                                          context.read<ProfileBloc>().add(
                                              ChangeDropDownEvent(
                                                  value: value));
                                        });
                                  })),
                          SizedBox(height: 19.v),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 13.h, vertical: 17.v),
                              decoration: AppDecoration.fillOnPrimaryContainer
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.customBorderTL5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 3.h, top: 1.v),
                                        child: Text("msg_what_is_your_date".tr,
                                            style: theme.textTheme.bodyMedium)),
                                    CustomImageView(
                                        imagePath: ImageConstant
                                            .imgIconlyTwoToneCalendar,
                                        height: 16.adaptSize,
                                        width: 16.adaptSize,
                                        margin: EdgeInsets.only(top: 1.v))
                                  ])),
                          Divider(indent: 8.h, endIndent: 7.h),
                          SizedBox(height: 33.v),
                          _buildUpdateProfile(context),
                          SizedBox(height: 12.v),
                          Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                  height: 168.v,
                                  width: 153.h,
                                  child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                                height: 111.v,
                                                width: 98.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.h,
                                                    vertical: 8.v),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: fs.Svg(
                                                            ImageConstant
                                                                .imgEllipse9),
                                                        fit: BoxFit.cover)),
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgTestAccount,
                                                    height: 72.v,
                                                    width: 65.h,
                                                    alignment:
                                                        Alignment.topCenter))),
                                        CustomImageView(
                                            imagePath: ImageConstant.imgGear,
                                            height: 72.v,
                                            width: 65.h,
                                            alignment: Alignment.bottomLeft,
                                            onTap: () {
                                              onTapImgGear(context);
                                            })
                                      ])))
                        ]))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 7.h),
        child: BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
            selector: (state) => state.firstNameController,
            builder: (context, firstNameController) {
              return CustomTextFormField(
                  controller: firstNameController,
                  hintText: "msg_what_s_your_first".tr,
                  validator: (value) {
                    if (!isText(value)) {
                      return "err_msg_please_enter_valid_text".tr;
                    }
                    return null;
                  });
            }));
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 7.h),
        child: BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
            selector: (state) => state.lastNameController,
            builder: (context, lastNameController) {
              return CustomTextFormField(
                  controller: lastNameController,
                  hintText: "msg_and_your_last_name".tr,
                  validator: (value) {
                    if (!isText(value)) {
                      return "err_msg_please_enter_valid_text".tr;
                    }
                    return null;
                  });
            }));
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 7.h),
        child: BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
            selector: (state) => state.phoneNumberController,
            builder: (context, phoneNumberController) {
              return CustomTextFormField(
                  controller: phoneNumberController,
                  hintText: "lbl_phone_number".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.phone,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(16.h, 15.v, 30.h, 16.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgFlag,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 55.v),
                  validator: (value) {
                    if (!isValidPhone(value)) {
                      return "err_msg_please_enter_valid_phone_number".tr;
                    }
                    return null;
                  },
                  contentPadding:
                      EdgeInsets.only(top: 17.v, right: 30.h, bottom: 17.v));
            }));
  }

  /// Section Widget
  Widget _buildUpdateProfile(BuildContext context) {
    return CustomElevatedButton(
        height: 55.v,
        text: "lbl_update_profile".tr,
        margin: EdgeInsets.only(left: 48.h, right: 50.h),
        buttonStyle: CustomButtonStyles.fillLightGreen,
        buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer_1);
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
