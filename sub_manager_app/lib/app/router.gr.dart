// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/user_authentication_view.dart';

class Routes {
  static const String userAuthenticationView = '/';
  static const all = <String>{
    userAuthenticationView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.userAuthenticationView, page: UserAuthenticationView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    UserAuthenticationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserAuthenticationView(),
        settings: data,
      );
    },
  };
}
