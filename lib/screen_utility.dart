import 'package:flutter/material.dart';

enum ScreenType {
  small,
  medium,
  large,
}

class ScreenUtility {
  static bool get isSmallScreen => currentScreenType == ScreenType.small;
  static bool get isNotSmallScreen => !isSmallScreen;
  static bool get isMediumScreen => currentScreenType == ScreenType.medium;
  static bool get isLargeScreen => currentScreenType == ScreenType.large;
  static bool get isNotLargeScreen =>  !isLargeScreen;


  static ScreenType currentScreenType = ScreenType.small;
  static bool isNavigationExpanded = false;

  static late BoxConstraints? constraints;

  static void setConstraints(BoxConstraints boxConstraints) {
    constraints = boxConstraints;
  }

  static void setCurrentScreenType(ScreenType screenType) {
    currentScreenType = screenType;
  }

  static void expandNavigationRail() {
    isNavigationExpanded = true;
  }

  static void collapseNavigationRail() {
    isNavigationExpanded = false;
  }
}
