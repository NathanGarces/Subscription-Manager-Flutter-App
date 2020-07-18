import 'package:flutter/material.dart';

class DynamicSize {
  static MediaQueryData _mediaQuery;

  //Design sizes
  static double _designHeight = 731;
  static double _designWidth = 411;

  //Device sizes
  static double _deviceHeight;
  static double _deviceWidth;

  //Size Ratios
  static double widthFactor;
  static double heightFactor;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    _deviceHeight = _mediaQuery.size.height -
        _mediaQuery.padding.top -
        _mediaQuery.padding.bottom;
    _deviceWidth = _mediaQuery.size.width -
        _mediaQuery.padding.left -
        _mediaQuery.padding.right;

    heightFactor = _deviceHeight / _designHeight;
    widthFactor = _deviceWidth / _designWidth;
  }
}
