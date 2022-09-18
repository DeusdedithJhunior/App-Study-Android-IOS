import 'package:flutter/material.dart';
import 'package:studyapp/configs/themes/app_dark_theme.dart';
import 'package:studyapp/configs/themes/app_light_theme.dart';
import 'package:studyapp/configs/themes/ui_parameters.dart';

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryLightColorLight,
      primaryColorLight,
    ]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryDarkColorDark,
      primaryColorDark,
    ]);

const onSurfaceTextColor = Colors.white;

// vai redenrizar a UI usando como base a classe UIParameters,
// verificando se o config do smartphone é dark ou light,
// se o smartphone for dark, o theme do app será dark, se não, o app será ligth
LinearGradient mainGraidient() =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;
