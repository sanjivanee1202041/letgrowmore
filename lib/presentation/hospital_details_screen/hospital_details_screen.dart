import 'bloc/hospital_details_bloc.dart';
import 'models/hospital_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/presentation/hospitals_list_container_page/hospitals_list_container_page.dart';
import 'package:holisticheal/presentation/map_page/map_page.dart';
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
              width: 362.h,
              padding: EdgeInsets.symmetric(horizontal: 17.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 8.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgImage2195x246,
                    height: 195.v,
                    width: 246.h,
                    radius: BorderRadius.circular(
                      49.h,
                    ),
                    margin: EdgeInsets.only(left: 10.h),
                  ),
                  SizedBox(height: 19.v),
                  SizedBox(
                    width: 224.h,
                    child: Text(
                      "msg_name_ayurvaid".tr,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMedium14,
                    ),
                  ),
                  SizedBox(height: 16.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 7.h,
                      right: 62.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 75.v,
                          width: 66.h,
                          margin: EdgeInsets.only(
                            top: 17.v,
                            bottom: 38.v,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 13.h,
                            vertical: 8.v,
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
                            height: 43.v,
                            width: 38.h,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomElevatedButton(
                                height: 47.v,
                                width: 147.h,
                                text: "lbl_direction".tr,
                                rightIcon: Container(
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgUndo,
                                    height: 47.v,
                                    width: 39.h,
                                  ),
                                ),
                                buttonStyle: CustomButtonStyles.none,
                                buttonTextStyle:
                                    CustomTextStyles.titleLargeLightgreenA200,
                              ),
                              SizedBox(height: 35.v),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 49.v,
                                      width: 89.h,
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgTestAccount,
                                            height: 49.v,
                                            width: 44.h,
                                            alignment: Alignment.centerRight,
                                          ),
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgFindClinic,
                                            height: 45.v,
                                            width: 54.h,
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgGear,
                                      height: 49.v,
                                      width: 44.h,
                                      margin: EdgeInsets.only(left: 10.h),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
      leadingWidth: 58.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgBackTo,
        margin: EdgeInsets.only(
          left: 23.h,
          bottom: 25.v,
        ),
      ),
      title: AppbarTitle(
        text: "lbl_details".tr,
        margin: EdgeInsets.only(
          left: 57.h,
          top: 37.v,
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
}
