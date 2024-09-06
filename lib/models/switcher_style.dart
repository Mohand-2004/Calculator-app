import 'package:flutter/material.dart';

class SwitcherStyle {
  late final double _radius;
  late final double _boarderWidth;
  late final Color _backgroundColor;
  late final Color _boarderColor;
  late final Color _activeIconColor;
  late final Color _disabledIconColor;
  late final Color _dividerColor;
  SwitcherStyle({
    double radius = 20,
    double boarderWidth = 2,
    Color backgroundColor = Colors.white,
    Color boarderColor = Colors.black,
    Color activeIconColor = Colors.blue,
    Color disabledIconColor = Colors.grey,
    Color dividerColor = Colors.grey,
  }){
    _radius = radius;
    _boarderWidth = 2;
    _backgroundColor = backgroundColor;
    _boarderColor = boarderColor;
    _activeIconColor = activeIconColor;
    _disabledIconColor = disabledIconColor;
    _dividerColor = dividerColor;
  }
  double get radius => _radius;
  double get boarderWidth => _boarderWidth;
  Color get backgroundColor => _backgroundColor;
  Color get boarderColor => _boarderColor;
  Color get activeIconColor => _activeIconColor;
  Color get disabledIconColor => _disabledIconColor;
  Color get dividerColor => _dividerColor;
}