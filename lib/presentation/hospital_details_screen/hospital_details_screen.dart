import 'bloc/hospital_details_bloc.dart';
import 'models/hospital_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/presentation/hospitals_list_page/hospitals_list_page.dart';
import 'package:holisticheal/widgets/app_bar/appbar_leading_image.dart';
import 'package:holisticheal/widgets/app_bar/appbar_title.dart';
import 'package:holisticheal/widgets/app_bar/custom_app_bar.dart';
import 'package:holisticheal/widgets/custom_bottom_bar.dart';
import 'package:holisticheal/widgets/custom_elevated_button.dart';

class HospitalDetailsScreen extends StatelessWidget {
  HospitalDetailsScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<HospitalDetailsBloc>(
      create: (context) => HospitalDetailsBloc(HospitalDetailsState(
        hospitalDetailsModelObj: HospitalDetailsModel(),
      ))
        ..add(HospitalDetailsInitialEvent()),
      child: HospitalDetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<HospitalDetailsBloc, HospitalDetailsState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 17.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgImage2286x361,
                    height: 286.v,
                    width: 361.h,
                    radius: BorderRadius.circular(
                      72.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 28.v),
                  Container(
                    width: 328.h,
                    margin: EdgeInsets.only(
                      left: 9.h,
                      right: 58.h,
                    ),
                    child: Text(
                      "msg_name_ayurvaid".tr,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLarge21,
                    ),
                  ),
                  SizedBox(height: 23.v),
                  _buildHospitalDetails(context),
                ],
              ),
            ),
            bottomNavigationBar: _buildBottomBar(context),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 86.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgBackTo,
        margin: EdgeInsets.only(
          left: 34.h,
          bottom: 37.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_details".tr,
        margin: EdgeInsets.only(top: 55.v),
      ),
    );
  }

  /// Section Widget
  Widget _buildHospitalDetails(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 111.v,
              width: 98.h,
              margin: EdgeInsets.only(
                top: 26.v,
                bottom: 57.v,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 12.v,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: fs.Svg(
                    ImageConstant.imgEllipse9,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgSearchProperty,
                height: 64.v,
                width: 57.h,
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Column(
                children: [
                  CustomElevatedButton(
                    height: 70.v,
                    width: 216.h,
                    text: "lbl_direction".tr,
                    rightIcon: Container(
                      child: CustomImageView(
                        imagePath: ImageConstant.imgUndo,
                        height: 70.v,
                        width: 58.h,
                      ),
                    ),
                    buttonStyle: CustomButtonStyles.none,
                    buttonTextStyle:
                        CustomTextStyles.headlineLargeLightgreenA200,
                  ),
                  SizedBox(height: 52.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgFindClinic,
                        height: 66.v,
                        width: 80.h,
                        margin: EdgeInsets.symmetric(vertical: 3.v),
                      ),
                      Spacer(),
                      CustomImageView(
                        imagePath: ImageConstant.imgTestAccount,
                        height: 72.v,
                        width: 65.h,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgGear,
                        height: 72.v,
                        width: 65.h,
                        margin: EdgeInsets.only(left: 16.h),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
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
}
