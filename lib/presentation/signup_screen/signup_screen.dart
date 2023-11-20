import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/core/utils/validation_functions.dart';
import 'package:holisticheal/widgets/custom_elevated_button.dart';
import 'package:holisticheal/widgets/custom_icon_button.dart';
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
                    width: 362.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.h, vertical: 11.v),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 35.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  height: 200.v,
                                  width: 227.h,
                                  margin: EdgeInsets.only(left: 16.h),
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text("lbl_sign_up_now".tr,
                                                style: CustomTextStyles
                                                    .titleLargeTeal900)),
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .img4222Copy1263x333,
                                            height: 180.v,
                                            width: 227.h,
                                            alignment: Alignment.topCenter)
                                      ]))),
                          SizedBox(height: 7.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("msg_please_fill_the".tr,
                                  style: theme.textTheme.bodyMedium)),
                          SizedBox(height: 10.v),
                          _buildFullName(context),
                          SizedBox(height: 7.v),
                          _buildEmail(context),
                          SizedBox(height: 7.v),
                          _buildPassword(context),
                          SizedBox(height: 3.v),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: EdgeInsets.only(right: 39.h),
                                  child: Text("msg_password_must_me".tr,
                                      style: CustomTextStyles
                                          .bodySmallInterBlack900))),
                          SizedBox(height: 8.v),
                          _buildLogin(context),
                          SizedBox(height: 9.v),
                          GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount3(context);
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_don_t_have_an_account2".tr,
                                        style: theme.textTheme.bodyMedium),
                                    TextSpan(
                                        text: "lbl_login2".tr,
                                        style: CustomTextStyles
                                            .bodyMediumPrimaryContainer)
                                  ]),
                                  textAlign: TextAlign.left)),
                          SizedBox(height: 22.v),
                          Text("lbl_or_connect_with".tr,
                              style: theme.textTheme.bodyMedium)
                        ]))),
            bottomNavigationBar: _buildGooglePlus(context)));
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 25.h),
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
                      EdgeInsets.symmetric(horizontal: 4.h, vertical: 10.v),
                  borderDecoration: TextFormFieldStyleHelper.fillBlueGrayATL10,
                  filled: true,
                  fillColor: appTheme.blueGray100A0);
            }));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 25.h),
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
                      EdgeInsets.symmetric(horizontal: 5.h, vertical: 11.v),
                  borderDecoration: TextFormFieldStyleHelper.fillBlueGrayATL10,
                  filled: true,
                  fillColor: appTheme.blueGray100A0);
            }));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 25.h),
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.h, vertical: 12.v),
                  borderDecoration: TextFormFieldStyleHelper.fillBlueGrayATL101,
                  filled: true,
                  fillColor: appTheme.blueGray100A0.withOpacity(0.72));
            }));
  }

  /// Section Widget
  Widget _buildLogin(BuildContext context) {
    return CustomElevatedButton(width: 203.h, text: "lbl_login".tr);
  }

  /// Section Widget
  Widget _buildGooglePlus(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 111.h, right: 111.h, bottom: 19.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgGooglePlus,
              height: 58.v,
              width: 57.h),
          Padding(
              padding: EdgeInsets.only(left: 35.h, top: 6.v, bottom: 5.v),
              child: CustomIconButton(
                  height: 47.adaptSize,
                  width: 47.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  decoration: IconButtonStyleHelper.fillPrimary,
                  child: CustomImageView(imagePath: ImageConstant.imgPhone)))
        ]));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtDonthaveanaccount3(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
