// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/home_view.dart';
import '../ui/views/splashscreen_view.dart';
import '../ui/views/user_authentication_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String userAuthenticationView = '/user-authentication-view';
  static const String homeView = '/home-view';
  static const all = <String>{
    splashScreenView,
    userAuthenticationView,
    homeView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.userAuthenticationView, page: UserAuthenticationView),
    RouteDef(Routes.homeView, page: HomeView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreenView(),
        settings: data,
      );
    },
    UserAuthenticationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserAuthenticationView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
  };
}
