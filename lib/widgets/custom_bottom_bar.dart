import 'package:flutter/material.dart';
import 'package:holisticheal/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgSearchProperty,
      activeIcon: ImageConstant.imgSearchProperty,
      type: BottomBarEnum.Searchproperty,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgAddReminder,
      activeIcon: ImageConstant.imgAddReminder,
      type: BottomBarEnum.Addreminder,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgTestAccount,
      activeIcon: ImageConstant.imgTestAccount,
      type: BottomBarEnum.Testaccount,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgGear,
      activeIcon: ImageConstant.imgGear,
      type: BottomBarEnum.Gear,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.v,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0.02),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.onPrimary,
          ],
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 45.v,
              width: 40.h,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 49.v,
              width: 44.h,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Searchproperty,
  Addreminder,
  Testaccount,
  Gear,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
