import 'package:flutter/material.dart';

class DynamicSize {
  static MediaQueryData _mediaQuery;

  //Design sizes
  static double _designHeight = 731;
  static double _designWidth = 411;

  //Device sizes
  static double deviceHeight;
  static double deviceWidth;
  static double _availableHeight;
  static double _avilableWidth;

  //Size Ratios
  static double widthFactor;
  static double heightFactor;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    deviceHeight = _mediaQuery.size.height;
    _availableHeight =
        deviceHeight - _mediaQuery.padding.top - _mediaQuery.padding.bottom;
    deviceWidth = _mediaQuery.size.width;
    _avilableWidth =
        deviceWidth - _mediaQuery.padding.left - _mediaQuery.padding.right;

    heightFactor = _availableHeight / _designHeight;
    widthFactor = _avilableWidth / _designWidth;
  }
}
