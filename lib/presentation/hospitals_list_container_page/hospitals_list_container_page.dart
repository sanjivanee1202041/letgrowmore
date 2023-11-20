import '../hospitals_list_container_page/widgets/hospitalslistcontainer_item_widget.dart';
import 'bloc/hospitals_list_container_bloc.dart';
import 'models/hospitals_list_container_model.dart';
import 'models/hospitalslistcontainer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:holisticheal/core/app_export.dart';

class HospitalsListContainerPage extends StatelessWidget {
  const HospitalsListContainerPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<HospitalsListContainerBloc>(
        create: (context) => HospitalsListContainerBloc(
            HospitalsListContainerState(
                hospitalsListContainerModelObj: HospitalsListContainerModel()))
          ..add(HospitalsListContainerInitialEvent()),
        child: HospitalsListContainerPage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: 363.h,
                decoration: AppDecoration.fillLightGreenA,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 23.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 11.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgBackTo,
                              height: 38.v,
                              width: 35.h),
                          SizedBox(height: 4.v),
                          _buildHospitalsListContainer(context),
                          SizedBox(height: 6.v),
                          Padding(
                              padding: EdgeInsets.only(left: 2.h, right: 57.h),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        height: 75.v,
                                        width: 66.h,
                                        margin: EdgeInsets.only(bottom: 38.v),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.h, vertical: 8.v),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: fs.Svg(
                                                    ImageConstant.imgEllipse9),
                                                fit: BoxFit.cover)),
                                        child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgSearchProperty,
                                            height: 43.v,
                                            width: 38.h,
                                            alignment: Alignment.topCenter)),
                                    Spacer(),
                                    Container(
                                        height: 49.v,
                                        width: 88.h,
                                        margin: EdgeInsets.only(top: 65.v),
                                        child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgTestAccount,
                                                  height: 49.v,
                                                  width: 44.h,
                                                  alignment:
                                                      Alignment.centerRight),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgFindClinic,
                                                  height: 45.v,
                                                  width: 54.h,
                                                  alignment:
                                                      Alignment.centerLeft)
                                            ])),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgGear,
                                        height: 49.v,
                                        width: 44.h,
                                        margin: EdgeInsets.only(
                                            left: 10.h, top: 65.v))
                                  ]))
                        ])))));
  }

  /// Section Widget
  Widget _buildHospitalsListContainer(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 53.h),
        child: BlocSelector<HospitalsListContainerBloc,
                HospitalsListContainerState, HospitalsListContainerModel?>(
            selector: (state) => state.hospitalsListContainerModelObj,
            builder: (context, hospitalsListContainerModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 15.v);
                  },
                  itemCount: hospitalsListContainerModelObj
                          ?.hospitalslistcontainerItemList.length ??
                      0,
                  itemBuilder: (context, index) {
                    HospitalslistcontainerItemModel model =
                        hospitalsListContainerModelObj
                                ?.hospitalslistcontainerItemList[index] ??
                            HospitalslistcontainerItemModel();
                    return HospitalslistcontainerItemWidget(model,
                        onTapImgHandLeft: () {
                      onTapImgHandLeft(context);
                    });
                  });
            }));
  }

  /// Navigates to the hospitalDetailsScreen when the action is triggered.
  onTapImgHandLeft(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.hospitalDetailsScreen);
  }
}
