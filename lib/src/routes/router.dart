import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/feed/feed_screen.dart';
import 'package:ummense_app/src/resources/forms/forms_screen.dart';
import 'package:ummense_app/src/resources/home/home_screen.dart';
import 'package:ummense_app/src/resources/index/index_screen.dart';
import 'package:ummense_app/src/resources/loading_app/loading_app.dart';
import 'package:ummense_app/src/resources/login/login_screen.dart';
import 'package:ummense_app/src/resources/login_code_validation/login_code_validation.dart';
import 'package:ummense_app/src/resources/new_post/new_post_screen.dart';
import 'package:ummense_app/src/resources/notifications/notifications_screen.dart';
import 'package:ummense_app/src/resources/organization/organization_screen.dart';
import 'package:ummense_app/src/resources/profile/profile_screen.dart';
import 'package:ummense_app/src/resources/register/register_screen.dart';
import 'package:ummense_app/src/resources/search/search_screen.dart';
import 'package:ummense_app/src/resources/settings/settings_screen.dart';
import 'package:ummense_app/src/resources/ummense_bot/ummense_bot_screen.dart';
import 'package:ummense_app/src/resources/update_notification_settings/update_notification_settings_screen.dart';
import 'package:ummense_app/src/resources/update_profile/update_profile_screen.dart';
import 'package:ummense_app/src/routes/route_list.dart';

abstract class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.feedRoute:
        return MaterialPageRoute<FeedScreen>(builder: (BuildContext context) => const FeedScreen());
      case RouteList.formsRoute:
        return MaterialPageRoute<FormsScreen>(builder: (BuildContext context) => const FormsScreen());
      case RouteList.homeRoute:
        return MaterialPageRoute<HomeScreen>(builder: (BuildContext context) => const HomeScreen());
      case RouteList.indexRoute:
        return MaterialPageRoute<IndexScreen>(builder: (BuildContext context) => const IndexScreen());
      case RouteList.loginRoute:
        return MaterialPageRoute<LoginScreen>(builder: (BuildContext context) => const LoginScreen());
      case RouteList.loginCodeValidation:
        return MaterialPageRoute<LoginCodeValidation>(builder: (BuildContext context) => const LoginCodeValidation());
      case RouteList.loadingApp:
        return MaterialPageRoute<LoadingApp>(builder: (BuildContext context) => const LoadingApp());
      case RouteList.newPostRoute:
        return MaterialPageRoute<NewPostScreen>(builder: (BuildContext context) => const NewPostScreen());
      case RouteList.notificationsRoute:
        return MaterialPageRoute<NotificationsScreen>(builder: (BuildContext context) => const NotificationsScreen());
      case RouteList.organizationRoute:
        return MaterialPageRoute<OrganizationScreen>(builder: (BuildContext context) => const OrganizationScreen());
      case RouteList.profileRoute:
        return MaterialPageRoute<ProfileScreen>(builder: (BuildContext context) => const ProfileScreen());
      case RouteList.registerRoute:
        return MaterialPageRoute<RegisterScreen>(builder: (BuildContext context) => const RegisterScreen());
      case RouteList.searchRoute:
        return MaterialPageRoute<SearchScreen>(builder: (BuildContext context) => const SearchScreen());
      case RouteList.settingsRoute:
        return MaterialPageRoute<SettingsScreen>(builder: (BuildContext context) => const SettingsScreen());
      case RouteList.ummenseBotRoute:
        return MaterialPageRoute<UmmenseBotScreen>(builder: (BuildContext context) => const UmmenseBotScreen());
      case RouteList.updateProfileRoute:
        return MaterialPageRoute<UpdateProfileScreen>(builder: (BuildContext context) => UpdateProfileScreen());
      case RouteList.updateNotificationSettingsRoute:
        return MaterialPageRoute<UpdateNotificationSettingsScreen>(builder: (BuildContext context) => const UpdateNotificationSettingsScreen());
      default:
        return MaterialPageRoute<IndexScreen>(builder: (BuildContext context) => const IndexScreen());
    }
  }
}