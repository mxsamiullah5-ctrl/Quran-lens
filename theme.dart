import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

/// Theme
final ThemeData theme = ThemeData(
  appBarTheme: _appBarTheme,
  bottomNavigationBarTheme: _bottomNavigationBarThemeData,
  tabBarTheme: _tabBarTheme,
  cardColor: const Color(0xFF414141),
  cardTheme: const CardTheme(color: Color(0xFF414141)),
  sliderTheme: _sliderThemeData,
  toggleButtonsTheme: _toggleButtonsThemeData,
  drawerTheme: _drawerThemeData,
  primaryColor: AppColors.black1,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppColors.black1,
  fontFamily: Fonts.nunito,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: AppColors.white,
    ),
  ),
);

/// [AppBarTheme] AppBar Theme
AppBarTheme get _appBarTheme {
  return const AppBarTheme(
    backgroundColor: AppColors.black,
    titleTextStyle: TextStyle(
      color: AppColors.grey,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: IconThemeData(
      color: AppColors.white,
    ),
    elevation: 0,
  );
}

/// [SliderThemeData] Slider Theme Data
SliderThemeData get _sliderThemeData {
  return const SliderThemeData(
    trackHeight: 2,
    thumbColor: AppColors.white,
    activeTrackColor: AppColors.white,
    inactiveTrackColor: AppColors.black6,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 0,
    ),
  );
}

/// [ToggleButtonsThemeData] Toggle Button Theme Data
ToggleButtonsThemeData get _toggleButtonsThemeData {
  return const ToggleButtonsThemeData(
      textStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      color: AppColors.black,
      selectedColor: AppColors.black3,
      disabledColor: AppColors.black);
}

/// [BottomNavigationBarThemeData] Bottom Navigation Bar Theme Data
BottomNavigationBarThemeData get _bottomNavigationBarThemeData {
  return const BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

/// [TabBarTheme] Tab Bar Theme Data
TabBarTheme get _tabBarTheme {
  return const TabBarTheme(
    labelStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white),
  );
}

/// [DrawerThemeData] Tab Bar Theme Data
DrawerThemeData get _drawerThemeData {
  return const DrawerThemeData(
      backgroundColor: AppColors.black4,
      scrimColor: Colors.transparent,
      elevation: 0);
}
import 'package:flutter/material.dart';
import 'dart:ui';

class GlassCard extends StatelessWidget {
  final Widget child;

  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
