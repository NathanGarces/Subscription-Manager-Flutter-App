// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String scaffold = '/';
  static const all = <String>{
    scaffold,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.scaffold, page: Scaffold),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Scaffold: (data) {
      var args = data.getArgs<ScaffoldArguments>(
        orElse: () => ScaffoldArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Scaffold(
          key: args.key,
          appBar: args.appBar,
          body: args.body,
          floatingActionButton: args.floatingActionButton,
          floatingActionButtonLocation: args.floatingActionButtonLocation,
          floatingActionButtonAnimator: args.floatingActionButtonAnimator,
          persistentFooterButtons: args.persistentFooterButtons,
          drawer: args.drawer,
          endDrawer: args.endDrawer,
          bottomNavigationBar: args.bottomNavigationBar,
          bottomSheet: args.bottomSheet,
          backgroundColor: args.backgroundColor,
          resizeToAvoidBottomPadding: args.resizeToAvoidBottomPadding,
          resizeToAvoidBottomInset: args.resizeToAvoidBottomInset,
          primary: args.primary,
          drawerDragStartBehavior: args.drawerDragStartBehavior,
          extendBody: args.extendBody,
          extendBodyBehindAppBar: args.extendBodyBehindAppBar,
          drawerScrimColor: args.drawerScrimColor,
          drawerEdgeDragWidth: args.drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: args.drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: args.endDrawerEnableOpenDragGesture,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// Scaffold arguments holder class
class ScaffoldArguments {
  final Key key;
  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final List<Widget> persistentFooterButtons;
  final Widget drawer;
  final Widget endDrawer;
  final Widget bottomNavigationBar;
  final Widget bottomSheet;
  final Color backgroundColor;
  final bool resizeToAvoidBottomPadding;
  final bool resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color drawerScrimColor;
  final double drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  ScaffoldArguments(
      {this.key,
      this.appBar,
      this.body,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.persistentFooterButtons,
      this.drawer,
      this.endDrawer,
      this.bottomNavigationBar,
      this.bottomSheet,
      this.backgroundColor,
      this.resizeToAvoidBottomPadding,
      this.resizeToAvoidBottomInset,
      this.primary = true,
      this.drawerDragStartBehavior = DragStartBehavior.start,
      this.extendBody = false,
      this.extendBodyBehindAppBar = false,
      this.drawerScrimColor,
      this.drawerEdgeDragWidth,
      this.drawerEnableOpenDragGesture = true,
      this.endDrawerEnableOpenDragGesture = true});
}
