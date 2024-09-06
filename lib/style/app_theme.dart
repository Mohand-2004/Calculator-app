import 'package:flutter/material.dart';

class AppTheme {
  final Color _backgroundColor;
  final Color _textColor;
  final Color _screenBackgroundColor;
  final Color _boardersColor;
  final Color _buttonsBackgroundColor;
  final Color _equalButtonColor;
  final Color _buttonsFourgroundColor;
  final Color _buttonsFourgroundBordersColor;
  final Color _equalButtonFourgroundColor;
  final Color _equalButtonFourgroundBordersColor;
  final Color _equalButtonBordersColor;
  final Color _specialTextColor;
  AppTheme(
    this._backgroundColor,
    this._boardersColor,
    this._buttonsBackgroundColor,
    this._buttonsFourgroundBordersColor,
    this._buttonsFourgroundColor,
    this._equalButtonColor,
    this._equalButtonFourgroundBordersColor,
    this._equalButtonFourgroundColor,
    this._screenBackgroundColor,
    this._textColor,
    this._equalButtonBordersColor,
    this._specialTextColor,
  );
  Color get backgroundColor => _backgroundColor;
  Color get textColor => _textColor;
  Color get screenBackgroundColor => _screenBackgroundColor;
  Color get boardersColor => _boardersColor;
  Color get buttonsBackgroundColor => _buttonsBackgroundColor;
  Color get equalButtonColor => _equalButtonColor;
  Color get buttonsFourgroundColor => _buttonsFourgroundColor;
  Color get buttonsFourgroundBordersColor => _buttonsFourgroundBordersColor;
  Color get equalButtonFourgroundColor => _equalButtonFourgroundColor;
  Color get equalButtonFourgroundBordersColor => _equalButtonFourgroundBordersColor;
  Color get equalButtonBordersColor => _equalButtonBordersColor;
  Color get specialTextColor => _specialTextColor;
}