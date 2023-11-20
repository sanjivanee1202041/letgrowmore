import 'bloc/map_bloc.dart';
import 'models/map_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';
import 'package:holisticheal/presentation/hospitals_list_page/hospitals_list_page.dart';
import 'package:holisticheal/widgets/custom_bottom_bar.dart';
import 'package:holisticheal/widgets/custom_search_view.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<MapBloc>(
      create: (context) => MapBloc(MapState(
        mapModelObj: MapModel(),
      ))
        ..add(MapInitialEvent()),
      child: MapScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: mediaQueryData.size.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle17,
                height: 932.v,
                width: 430.h,
                alignment: Alignment.center,
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: 928.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 163.v,
                          width: 174.h,
                          margin: EdgeInsets.only(left: 101.h),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgEllipse9,
                                height: 111.v,
                                width: 98.h,
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(right: 8.h),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgFindClinic,
                                height: 95.v,
                                width: 116.h,
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 5.v),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgAddReminder,
                                height: 66.v,
                                width: 59.h,
                                alignment: Alignment.bottomLeft,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 655.v,
                          width: double.maxFinite,
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgEllipse646,
                                height: 655.v,
                                width: 430.h,
                                alignment: Alignment.center,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 525.v,
                                  width: 405.h,
                                  margin: EdgeInsets.only(top: 16.v),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                          height: 525.v,
                                          width: 325.h,
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgEllipse645,
                                                height: 525.v,
                                                width: 325.h,
                                                alignment: Alignment.center,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: SizedBox(
                                                  height: 316.v,
                                                  width: 220.h,
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    children: [
                                                      CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgEllipse644,
                                                        height: 316.v,
                                                        width: 220.h,
                                                        alignment:
                                                            Alignment.center,
                                                      ),
                                                      CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgDestinationIndicator,
                                                        height: 55.adaptSize,
                                                        width: 55.adaptSize,
                                                        alignment:
                                                            Alignment.topLeft,
                                                        margin: EdgeInsets.only(
                                                          left: 32.h,
                                                          top: 115.v,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 86.v),
                                          child: BlocSelector<MapBloc, MapState,
                                              TextEditingController?>(
                                            selector: (state) =>
                                                state.searchController,
                                            builder:
                                                (context, searchController) {
                                              return CustomSearchView(
                                                width: 379.h,
                                                controller: searchController,
                                                hintText:
                                                    "lbl_search_hospital".tr,
                                                alignment: Alignment.topRight,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
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
