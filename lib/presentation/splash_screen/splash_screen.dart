import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: 362.h,
                  padding: EdgeInsets.symmetric(horizontal: 19.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.img4222Copy1263x333,
                      height: 307.v,
                      width: 322.h,
                      alignment: Alignment.center))));
    });
  }
}
