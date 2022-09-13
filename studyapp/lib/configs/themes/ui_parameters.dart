import 'package:flutter/material.dart';

// classe que vai verificar se o app está no dark ou light
// se true retorna dark, se false, retorna ligth
class UIParameters {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
