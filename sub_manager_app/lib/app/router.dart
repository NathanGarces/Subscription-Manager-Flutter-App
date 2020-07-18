import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';

//Used to automatically build the routes.
@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: Scaffold, initial: true),
  ],
)
class $Router {}

//Command to auto-generate routes => flutter pub run build_runner build --delete-conflicting-outputs
