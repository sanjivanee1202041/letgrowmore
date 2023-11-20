import 'bloc/map_bloc.dart';
import 'models/map_model.dart';
import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MapPage extends StatelessWidget {
  const MapPage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<MapBloc>(
      create: (context) => MapBloc(MapState(
        mapModelObj: MapModel(),
      ))
        ..add(MapInitialEvent()),
      child: MapPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              height: 583.v,
              width: 363.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle17637x363,
                    height: 637.v,
                    width: 363.h,
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 583.v,
                          width: 311.h,
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 75.v,
                                  width: 107.h,
                                  margin: EdgeInsets.only(right: 88.h),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgEllipse9,
                                        height: 75.v,
                                        width: 66.h,
                                        alignment: Alignment.centerLeft,
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.imgFindClinic,
                                        height: 64.v,
                                        width: 79.h,
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.only(top: 3.v),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  height: 447.v,
                                  width: 299.h,
                                  child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgEllipse646,
                                        height: 447.v,
                                        width: 299.h,
                                        alignment: Alignment.center,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          height: 358.v,
                                          width: 222.h,
                                          margin: EdgeInsets.only(top: 11.v),
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgEllipse645,
                                                height: 358.v,
                                                width: 222.h,
                                                alignment: Alignment.center,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: SizedBox(
                                                  height: 216.v,
                                                  width: 150.h,
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    children: [
                                                      CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgEllipse644,
                                                        height: 216.v,
                                                        width: 150.h,
                                                        alignment:
                                                            Alignment.center,
                                                      ),
                                                      CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgDestinationIndicator,
                                                        height: 37.adaptSize,
                                                        width: 37.adaptSize,
                                                        alignment:
                                                            Alignment.topLeft,
                                                        margin: EdgeInsets.only(
                                                          left: 21.h,
                                                          top: 79.v,
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
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 41.v,
                                  width: 258.h,
                                  margin: EdgeInsets.only(top: 70.v),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 46.h,
                                    vertical: 3.v,
                                  ),
                                  decoration: AppDecoration.fillGreen.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10,
                                  ),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgSearch,
                                    height: 34.v,
                                    width: 27.h,
                                    alignment: Alignment.centerRight,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 32.h,
                                    top: 84.v,
                                  ),
                                  child: Text(
                                    "lbl_search_hospital".tr,
                                    style:
                                        CustomTextStyles.bodySmallInterBlack900,
                                  ),
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
          ),
        );
      },
    );
  }
}
