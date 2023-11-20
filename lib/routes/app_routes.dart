import 'package:flutter/material.dart';
import 'package:holisticheal/presentation/splash_screen/splash_screen.dart';
import 'package:holisticheal/presentation/login_screen/login_screen.dart';
import 'package:holisticheal/presentation/signup_screen/signup_screen.dart';
import 'package:holisticheal/presentation/map_screen/map_screen.dart';
import 'package:holisticheal/presentation/hospitals_list_container_screen/hospitals_list_container_screen.dart';
import 'package:holisticheal/presentation/hospital_details_screen/hospital_details_screen.dart';
import 'package:holisticheal/presentation/notification_screen/notification_screen.dart';
import 'package:holisticheal/presentation/settings_screen/settings_screen.dart';
import 'package:holisticheal/presentation/profile_screen/profile_screen.dart';
import 'package:holisticheal/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String mapScreen = '/map_screen';

  static const String hospitalsListPage = '/hospitals_list_page';

  static const String hospitalsListContainerScreen =
      '/hospitals_list_container_screen';

  static const String hospitalDetailsScreen = '/hospital_details_screen';

  static const String notificationScreen = '/notification_screen';

  static const String settingsScreen = '/settings_screen';

  static const String profileScreen = '/profile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        loginScreen: LoginScreen.builder,
        signupScreen: SignupScreen.builder,
        mapScreen: MapScreen.builder,
        hospitalsListContainerScreen: HospitalsListContainerScreen.builder,
        hospitalDetailsScreen: HospitalDetailsScreen.builder,
        notificationScreen: NotificationScreen.builder,
        settingsScreen: SettingsScreen.builder,
        profileScreen: ProfileScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
