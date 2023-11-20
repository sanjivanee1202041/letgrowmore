import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/core/utils/validation_functions.dart';
import 'package:holisticheal/widgets/custom_elevated_button.dart';
import 'package:holisticheal/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
        create: (context) =>
            SignupBloc(SignupState(signupModelObj: SignupModel()))
              ..add(SignupInitialEvent()),
        child: SignupScreen());
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.h, vertical: 16.v),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 52.v),
                          SizedBox(
                              height: 292.v,
                              width: 333.h,
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("lbl_sign_up_now".tr,
                                            style: CustomTextStyles
                                                .headlineLargeTeal900)),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.img4222Copy1263x333,
                                        height: 263.v,
                                        width: 333.h,
                                        alignment: Alignment.topCenter)
                                  ])),
                          SizedBox(height: 11.v),
                          Text("msg_please_fill_the".tr,
                              style: theme.textTheme.titleLarge),
                          SizedBox(height: 14.v),
                          _buildFullName(context),
                          SizedBox(height: 11.v),
                          _buildEmail(context),
                          SizedBox(height: 11.v),
                          _buildPassword(context),
                          SizedBox(height: 6.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 22.h),
                                  child: Text("msg_password_must_me".tr,
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyLarge))),
                          SizedBox(height: 11.v),
                          _buildLogin(context),
                          SizedBox(height: 13.v),
                          GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount3(context);
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_don_t_have_an_account2".tr,
                                        style: theme.textTheme.titleLarge),
                                    TextSpan(
                                        text: "lbl_login2".tr,
                                        style: CustomTextStyles
                                            .titleLargePrimaryContainer)
                                  ]),
                                  textAlign: TextAlign.left)),
                          SizedBox(height: 32.v),
                          Text("lbl_or_connect_with".tr,
                              style: theme.textTheme.titleLarge)
                        ]))),
            bottomNavigationBar: _buildGooglePlus(context)));
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.h, right: 5.h),
        child: BlocSelector<SignupBloc, SignupState, TextEditingController?>(
            selector: (state) => state.fullNameController,
            builder: (context, fullNameController) {
              return CustomTextFormField(
                  controller: fullNameController,
                  hintText: "lbl_full_name".tr,
                  validator: (value) {
                    if (!isText(value)) {
                      return "err_msg_please_enter_valid_text".tr;
                    }
                    return null;
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 15.v),
                  borderDecoration: TextFormFieldStyleHelper.fillBlueGrayA,
                  filled: true,
                  fillColor: appTheme.blueGray100A0);
            }));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 19.h, right: 2.h),
        child: BlocSelector<SignupBloc, SignupState, TextEditingController?>(
            selector: (state) => state.emailController,
            builder: (context, emailController) {
              return CustomTextFormField(
                  controller: emailController,
                  hintText: "lbl_email_id".tr,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        (!isValidEmail(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_email".tr;
                    }
                    return null;
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 13.h, vertical: 16.v),
                  borderDecoration: TextFormFieldStyleHelper.fillBlueGrayA,
                  filled: true,
                  fillColor: appTheme.blueGray100A0);
            }));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 19.h, right: 2.h),
        child: BlocSelector<SignupBloc, SignupState, TextEditingController?>(
            selector: (state) => state.passwordController,
            builder: (context, passwordController) {
              return CustomTextFormField(
                  controller: passwordController,
                  hintText: "lbl_password".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_password".tr;
                    }
                    return null;
                  },
                  obscureText: true,
                  borderDecoration: TextFormFieldStyleHelper.fillBlueGrayATL15,
                  filled: true,
                  fillColor: appTheme.blueGray100A0.withOpacity(0.72));
            }));
  }

  /// Section Widget
  Widget _buildLogin(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_login".tr, margin: EdgeInsets.symmetric(horizontal: 43.h));
  }

  /// Section Widget
  Widget _buildGooglePlus(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 112.h, right: 112.h, bottom: 28.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgGooglePlus,
              height: 86.v,
              width: 84.h),
          Container(
              height: 69.adaptSize,
              width: 69.adaptSize,
              margin: EdgeInsets.only(left: 52.h, top: 8.v, bottom: 8.v),
              padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 9.v),
              decoration: AppDecoration.fillPrimary
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder34),
              child: CustomImageView(
                  imagePath: ImageConstant.imgPhone,
                  height: 51.v,
                  width: 47.h,
                  alignment: Alignment.center))
        ]));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtDonthaveanaccount3(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
