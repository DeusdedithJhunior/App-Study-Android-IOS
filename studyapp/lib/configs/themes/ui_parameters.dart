import 'package:flutter/material.dart';

const double _mobileScreenPadding = 25.00;
const double _cardBorderRadius = 10.00;

double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;

class UIParameters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderRadius);

  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(_mobileScreenPadding);

// vai verificar se o app está no dark ou light
// se true retorna dark, se false, retorna ligth
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
