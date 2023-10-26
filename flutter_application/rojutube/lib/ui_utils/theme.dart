import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const PrimaryColor = const Color(0xff05d08b);
const PrimaryColorLight = const Color(0xff3fea9e);
const PrimaryColorDark = const Color(0xff059d6b);

const SecondaryColor = const Color(0xff54b9ac);
const SecondaryColorLight = const Color(0xff70f1e2);
const SecondaryColorDark = const Color(0xff468f89);

class AppThemeData {
  FlexScheme usedScheme = FlexScheme.cyanM3;
  bool isUseMaterial3 = true;

  // FlexSchemeData _getSchemeData(){
  //   return FlexSchemeData(
  //     name: 'RoJu Theme',
  //     light: FlexSchemeColor.from(primary: PrimaryColor, swapOnMaterial3: isUseMaterial3),
  //     dark: FlexSchemeColor.from(primary: PrimaryColor, swapOnMaterial3: isUseMaterial3),
  //     description: '',
  //   );
  // }

  ThemeData getLightTheme() {
    return FlexThemeData.light(
      scheme: usedScheme,
      useMaterial3: isUseMaterial3,
      typography: Typography.material2021(platform: defaultTargetPlatform),

      usedColors: 4,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.95,
      tabBarStyle: FlexTabBarStyle.forBackground,
      swapColors: true,
      useMaterial3ErrorColors: true,
    );
  }

  ThemeData getDarkTheme() {
    return FlexThemeData.dark(
      scheme: usedScheme,
      useMaterial3: isUseMaterial3,
      typography: Typography.material2021(platform: defaultTargetPlatform),

      usedColors: 4,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.95,
      tabBarStyle: FlexTabBarStyle.forBackground,
      swapColors: true,
      useMaterial3ErrorColors: true,
    );
  }
}
