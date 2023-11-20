import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/core/utils/validation_functions.dart';
import 'package:holisticheal/widgets/custom_elevated_button.dart';
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
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.h, vertical: 57.v),
                    child: Column(children: [
                      SizedBox(
                          height: 291.v,
                          width: 333.h,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.only(right: 76.h),
                                    child: Text("lbl_login_now".tr,
                                        style: CustomTextStyles
                                            .headlineLargeTeal900))),
                            CustomImageView(
                                imagePath: ImageConstant.img4222Copy1263x333,
                                height: 263.v,
                                width: 333.h,
                                alignment: Alignment.topCenter)
                          ])),
                      SizedBox(height: 7.v),
                      Text("msg_please_login_to".tr,
                          style: theme.textTheme.titleLarge),
                      SizedBox(height: 30.v),
                      Padding(
                          padding: EdgeInsets.only(left: 11.h),
                          child: BlocSelector<LoginBloc, LoginState,
                                  TextEditingController?>(
                              selector: (state) => state.userIdController,
                              builder: (context, userIdController) {
                                return CustomTextFormField(
                                    controller: userIdController,
                                    hintText: "lbl_user_id".tr,
                                    hintStyle: theme.textTheme.bodyLarge!,
                                    borderDecoration:
                                        TextFormFieldStyleHelper.fillBlueGrayA,
                                    filled: true,
                                    fillColor: appTheme.blueGray100A0);
                              })),
                      SizedBox(height: 25.v),
                      Padding(
                          padding: EdgeInsets.only(left: 11.h),
                          child: BlocSelector<LoginBloc, LoginState,
                                  TextEditingController?>(
                              selector: (state) => state.passwordController,
                              builder: (context, passwordController) {
                                return CustomTextFormField(
                                    controller: passwordController,
                                    hintText: "lbl_password".tr,
                                    hintStyle: theme.textTheme.bodyLarge!,
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
                                        horizontal: 23.h, vertical: 19.v),
                                    borderDecoration: TextFormFieldStyleHelper
                                        .fillBlueGrayATL15,
                                    filled: true,
                                    fillColor: appTheme.blueGray100A0
                                        .withOpacity(0.72));
                              })),
                      SizedBox(height: 20.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(right: 7.h),
                              child: Text("msg_forgot_password".tr,
                                  style: theme.textTheme.titleLarge))),
                      SizedBox(height: 19.v),
                      CustomElevatedButton(
                          text: "lbl_login".tr,
                          margin: EdgeInsets.only(left: 41.h, right: 35.h),
                          onPressed: () {
                            onTapLogin(context);
                          }),
                      SizedBox(height: 13.v),
                      GestureDetector(
                          onTap: () {
                            onTapTxtDonthaveanaccount(context);
                          },
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_don_t_have_an_account2".tr,
                                    style: theme.textTheme.titleLarge),
                                TextSpan(
                                    text: "lbl_signup".tr,
                                    style: CustomTextStyles
                                        .titleLargePrimaryContainer)
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 42.v),
                      Text("lbl_or_connect_with".tr,
                          style: theme.textTheme.titleLarge),
                      SizedBox(height: 19.v),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgGooglePlus,
                                height: 86.v,
                                width: 84.h),
                            Container(
                                height: 69.adaptSize,
                                width: 69.adaptSize,
                                margin: EdgeInsets.only(
                                    left: 52.h, top: 8.v, bottom: 8.v),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 9.v),
                                decoration: AppDecoration.fillPrimary.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder34),
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgPhone,
                                    height: 51.v,
                                    width: 47.h,
                                    alignment: Alignment.center))
                          ])
                    ])))));
  }

  /// Navigates to the mapScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mapScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
