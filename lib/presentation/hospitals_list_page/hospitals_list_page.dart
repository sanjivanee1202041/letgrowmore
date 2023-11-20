import '../hospitals_list_page/widgets/hospitalslist_item_widget.dart';
import 'bloc/hospitals_list_bloc.dart';
import 'models/hospitals_list_model.dart';
import 'models/hospitalslist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:holisticheal/core/app_export.dart';

class HospitalsListPage extends StatelessWidget {
  const HospitalsListPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<HospitalsListBloc>(
        create: (context) => HospitalsListBloc(
            HospitalsListState(hospitalsListModelObj: HospitalsListModel()))
          ..add(HospitalsListInitialEvent()),
        child: HospitalsListPage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillLightGreenA,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 17.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 17.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgBackTo,
                              height: 57.v,
                              width: 52.h,
                              margin: EdgeInsets.only(left: 17.h)),
                          SizedBox(height: 7.v),
                          _buildHospitalsList(context),
                          SizedBox(height: 9.v),
                          _buildSeventyNine(context)
                        ])))));
  }

  /// Section Widget
  Widget _buildHospitalsList(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.h),
            child: BlocSelector<HospitalsListBloc, HospitalsListState,
                    HospitalsListModel?>(
                selector: (state) => state.hospitalsListModelObj,
                builder: (context, hospitalsListModelObj) {
                  return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 22.v);
                      },
                      itemCount:
                          hospitalsListModelObj?.hospitalslistItemList.length ??
                              0,
                      itemBuilder: (context, index) {
                        HospitalslistItemModel model = hospitalsListModelObj
                                ?.hospitalslistItemList[index] ??
                            HospitalslistItemModel();
                        return HospitalslistItemWidget(model,
                            onTapImgHandLeft: () {
                          onTapImgHandLeft(context);
                        });
                      });
                })));
  }

  /// Section Widget
  Widget _buildSeventyNine(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      height: 111.v,
                      width: 98.h,
                      margin: EdgeInsets.only(bottom: 57.v),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 12.v),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: fs.Svg(ImageConstant.imgEllipse9),
                              fit: BoxFit.cover)),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgSearchProperty,
                          height: 64.v,
                          width: 57.h,
                          alignment: Alignment.topCenter)),
                  CustomImageView(
                      imagePath: ImageConstant.imgFindClinic,
                      height: 66.v,
                      width: 80.h,
                      margin:
                          EdgeInsets.only(left: 16.h, top: 99.v, bottom: 3.v)),
                  Spacer(),
                  CustomImageView(
                      imagePath: ImageConstant.imgTestAccount,
                      height: 72.v,
                      width: 65.h,
                      margin: EdgeInsets.only(top: 96.v)),
                  CustomImageView(
                      imagePath: ImageConstant.imgGear,
                      height: 72.v,
                      width: 65.h,
                      margin: EdgeInsets.only(left: 16.h, top: 96.v))
                ])));
  }

  /// Navigates to the hospitalDetailsScreen when the action is triggered.
  onTapImgHandLeft(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.hospitalDetailsScreen,
    );
  }
}
