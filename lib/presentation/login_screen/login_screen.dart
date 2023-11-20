import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/core/utils/validation_functions.dart';
import 'package:holisticheal/widgets/custom_elevated_button.dart';
import 'package:holisticheal/widgets/custom_icon_button.dart';
import 'package:holisticheal/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
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
                    width: 363.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 35.h, vertical: 39.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 199.v,
                              width: 227.h,
                              margin: EdgeInsets.only(left: 10.h),
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("lbl_login_now".tr,
                                            style: CustomTextStyles
                                                .titleLargeTeal900)),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.img4222Copy1263x333,
                                        height: 180.v,
                                        width: 227.h,
                                        alignment: Alignment.topCenter)
                                  ])),
                          SizedBox(height: 4.v),
                          Text("msg_please_login_to".tr,
                              style: theme.textTheme.bodyMedium),
                          SizedBox(height: 21.v),
                          Padding(
                              padding: EdgeInsets.only(right: 45.h),
                              child: BlocSelector<LoginBloc, LoginState,
                                      TextEditingController?>(
                                  selector: (state) => state.userIdController,
                                  builder: (context, userIdController) {
                                    return CustomTextFormField(
                                        controller: userIdController,
                                        hintText: "lbl_user_id".tr,
                                        hintStyle: CustomTextStyles
                                            .bodySmallInterBlack900,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 4.h, vertical: 12.v),
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .fillBlueGrayATL10,
                                        filled: true,
                                        fillColor: appTheme.blueGray100A0);
                                  })),
                          SizedBox(height: 17.v),
                          Padding(
                              padding: EdgeInsets.only(right: 45.h),
                              child: BlocSelector<LoginBloc, LoginState,
                                      TextEditingController?>(
                                  selector: (state) => state.passwordController,
                                  builder: (context, passwordController) {
                                    return CustomTextFormField(
                                        controller: passwordController,
                                        hintText: "lbl_password".tr,
                                        hintStyle: CustomTextStyles
                                            .bodySmallInterBlack900,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidPassword(value,
                                                  isRequired: true))) {
                                            return "err_msg_please_enter_valid_password"
                                                .tr;
                                          }
                                          return null;
                                        },
                                        obscureText: true,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 7.h, vertical: 13.v),
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .fillBlueGrayATL101,
                                        filled: true,
                                        fillColor: appTheme.blueGray100A0
                                            .withOpacity(0.72));
                                  })),
                          SizedBox(height: 13.v),
                          Padding(
                              padding: EdgeInsets.only(left: 66.h),
                              child: Text("msg_forgot_password".tr,
                                  style: theme.textTheme.bodyMedium)),
                          SizedBox(height: 13.v),
                          CustomElevatedButton(
                              width: 203.h,
                              text: "lbl_login".tr,
                              margin: EdgeInsets.only(left: 22.h),
                              onPressed: () {
                                onTapLogin(context);
                              }),
                          SizedBox(height: 9.v),
                          GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount(context);
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(left: 24.h),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_don_t_have_an_account2".tr,
                                            style: theme.textTheme.bodyMedium),
                                        TextSpan(
                                            text: "lbl_signup".tr,
                                            style: CustomTextStyles
                                                .bodyMediumPrimaryContainer)
                                      ]),
                                      textAlign: TextAlign.left))),
                          SizedBox(height: 29.v),
                          Padding(
                              padding: EdgeInsets.only(left: 71.h),
                              child: Text("lbl_or_connect_with".tr,
                                  style: theme.textTheme.bodyMedium)),
                          SizedBox(height: 13.v),
                          Padding(
                              padding: EdgeInsets.only(left: 54.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgGooglePlus,
                                    height: 58.v,
                                    width: 57.h),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 35.h, top: 6.v, bottom: 5.v),
                                    child: CustomIconButton(
                                        height: 47.adaptSize,
                                        width: 47.adaptSize,
                                        padding: EdgeInsets.all(6.h),
                                        decoration:
                                            IconButtonStyleHelper.fillPrimary,
                                        child: CustomImageView(
                                            imagePath: ImageConstant.imgPhone)))
                              ]))
                        ])))));
  }

  /// Navigates to the mapContainerScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mapContainerScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
