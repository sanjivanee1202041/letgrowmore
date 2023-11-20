import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/core/utils/validation_functions.dart';
import 'package:holisticheal/presentation/hospitals_list_container_page/hospitals_list_container_page.dart';
import 'package:holisticheal/presentation/map_page/map_page.dart';
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
                child: SizedBox(
                    width: 362.h,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 19.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 8.v),
                                    SizedBox(
                                        height: 239.v,
                                        width: 270.h,
                                        child: Stack(
                                            alignment: Alignment.topLeft,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 75.h,
                                                          bottom: 64.v),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                                "msg_itunuoluwa_abidoye"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .labelMediumBold),
                                                            SizedBox(
                                                                height: 1.v),
                                                            Text(
                                                                "msg_itunuoluwa_petra_africa"
                                                                    .tr,
                                                                style: theme
                                                                    .textTheme
                                                                    .bodySmall)
                                                          ]))),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgGroup12475,
                                                  height: 206.v,
                                                  width: 255.h,
                                                  alignment: Alignment.topLeft),
                                              _buildFirstNameEditText(context)
                                            ])),
                                    SizedBox(height: 12.v),
                                    _buildLastNameEditText(context),
                                    SizedBox(height: 12.v),
                                    _buildPhoneNumberEditText(context),
                                    SizedBox(height: 12.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 36.h, right: 53.h),
                                        child: BlocSelector<ProfileBloc,
                                                ProfileState, ProfileModel?>(
                                            selector: (state) =>
                                                state.profileModelObj,
                                            builder:
                                                (context, profileModelObj) {
                                              return CustomDropDown(
                                                  icon: Container(
                                                      margin: EdgeInsets.only(),
                                                      child: CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgRectangle1,
                                                          height: 36.v,
                                                          width: 234.h)),
                                                  hintText:
                                                      "msg_select_your_gender"
                                                          .tr,
                                                  items: profileModelObj
                                                          ?.dropdownItemList ??
                                                      [],
                                                  onChanged: (value) {
                                                    context
                                                        .read<ProfileBloc>()
                                                        .add(
                                                            ChangeDropDownEvent(
                                                                value: value));
                                                  });
                                            })),
                                    SizedBox(height: 12.v),
                                    _buildDateOfBirthEditText(context),
                                    SizedBox(height: 22.v),
                                    _buildUpdateProfileButton(context),
                                    SizedBox(height: 8.v),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                            height: 114.v,
                                            width: 104.h,
                                            margin:
                                                EdgeInsets.only(right: 73.h),
                                            child: Stack(
                                                alignment: Alignment.bottomLeft,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Container(
                                                          height: 75.v,
                                                          width: 66.h,
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      11.h,
                                                                  vertical:
                                                                      5.v),
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: fs.Svg(
                                                                      ImageConstant
                                                                          .imgEllipse9),
                                                                  fit: BoxFit
                                                                      .cover)),
                                                          child: CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgTestAccount,
                                                              height: 49.v,
                                                              width: 44.h,
                                                              alignment: Alignment
                                                                  .topCenter))),
                                                  CustomImageView(
                                                      imagePath:
                                                          ImageConstant.imgGear,
                                                      height: 49.v,
                                                      width: 44.h,
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      onTap: () {
                                                        onTapImgGear(context);
                                                      })
                                                ])))
                                  ])),
                          SizedBox(height: 1.v)
                        ]))),
            bottomNavigationBar: _buildSearchPropertyBottomAppBar(context)));
  }

  /// Section Widget
  Widget _buildFirstNameEditText(BuildContext context) {
    return BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
        selector: (state) => state.firstNameEditTextController,
        builder: (context, firstNameEditTextController) {
          return CustomTextFormField(
              width: 234.h,
              controller: firstNameEditTextController,
              hintText: "msg_what_s_your_first".tr,
              alignment: Alignment.bottomRight,
              suffix: Container(
                  margin: EdgeInsets.only(),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgRectangle1,
                      height: 36.v,
                      width: 234.h)),
              suffixConstraints: BoxConstraints(maxHeight: 37.v),
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildLastNameEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 36.h, right: 53.h),
        child: BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
            selector: (state) => state.lastNameEditTextController,
            builder: (context, lastNameEditTextController) {
              return CustomTextFormField(
                  controller: lastNameEditTextController,
                  hintText: "msg_and_your_last_name".tr,
                  suffix: Container(
                      margin: EdgeInsets.only(),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgRectangle1,
                          height: 36.v,
                          width: 234.h)),
                  suffixConstraints: BoxConstraints(maxHeight: 37.v),
                  validator: (value) {
                    if (!isText(value)) {
                      return "err_msg_please_enter_valid_text".tr;
                    }
                    return null;
                  });
            }));
  }

  /// Section Widget
  Widget _buildPhoneNumberEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 36.h, right: 53.h),
        child: BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
            selector: (state) => state.phoneNumberEditTextController,
            builder: (context, phoneNumberEditTextController) {
              return CustomTextFormField(
                  controller: phoneNumberEditTextController,
                  hintText: "lbl_phone_number".tr,
                  textInputType: TextInputType.phone,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(10.h, 10.v, 21.h, 10.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgFlag,
                          height: 16.adaptSize,
                          width: 16.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 37.v),
                  suffix: Container(
                      margin: EdgeInsets.only(),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgRectangle1,
                          height: 36.v,
                          width: 234.h)),
                  suffixConstraints: BoxConstraints(maxHeight: 37.v),
                  validator: (value) {
                    if (!isValidPhone(value)) {
                      return "err_msg_please_enter_valid_phone_number".tr;
                    }
                    return null;
                  },
                  contentPadding: EdgeInsets.symmetric(vertical: 12.v));
            }));
  }

  /// Section Widget
  Widget _buildDateOfBirthEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 36.h, right: 53.h),
        child: BlocSelector<ProfileBloc, ProfileState, TextEditingController?>(
            selector: (state) => state.dateOfBirthEditTextController,
            builder: (context, dateOfBirthEditTextController) {
              return CustomTextFormField(
                  controller: dateOfBirthEditTextController,
                  hintText: "msg_what_is_your_date".tr,
                  textInputAction: TextInputAction.done,
                  suffix: Container(
                      margin: EdgeInsets.fromLTRB(-9.h, 13.v, 30.h, 13.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgIconlyTwotoneCalendar,
                          height: 10.v,
                          width: 13.h)),
                  suffixConstraints: BoxConstraints(maxHeight: 37.v));
            }));
  }

  /// Section Widget
  Widget _buildUpdateProfileButton(BuildContext context) {
    return CustomElevatedButton(
        height: 37.v,
        width: 177.h,
        text: "lbl_update_profile".tr,
        buttonStyle: CustomButtonStyles.fillLightGreenTL10,
        buttonTextStyle: CustomTextStyles.labelSmallDMSansOnPrimaryContainer,
        alignment: Alignment.center);
  }

  /// Section Widget
  Widget _buildSearchPropertyBottomAppBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
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

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImgGear(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsScreen,
    );
  }
}
