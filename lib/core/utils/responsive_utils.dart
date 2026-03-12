import 'package:flutter/material.dart';

class ResponsiveUtils {
  ResponsiveUtils._();

  static double mobileBreakpoint = 600;
  static double tabletBreakpoint = 1024;
  static double desktopBreakpoint = 1440;
  static double wideBreakpoint = 1440;

  static double screenHeight(BuildContext context, [double percentage = 1.0]) {
    return MediaQuery.of(context).size.height * percentage;
  }

  static double screenWidth(BuildContext context, [double percentage = 1.0]) {
    return MediaQuery.of(context).size.width * percentage;
  }

  static double pixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static double _getDeviceWidth(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return isPortrait(context) ? size.width : size.height;
  }

  static bool isMobile(BuildContext context) {
    return _getDeviceWidth(context) < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = _getDeviceWidth(context);
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    final width = _getDeviceWidth(context);
    return width >= tabletBreakpoint && width < wideBreakpoint;
  }

  static bool isWideDesktop(BuildContext context) {
    return _getDeviceWidth(context) >= wideBreakpoint;
  }

  static DeviceType deviceType(BuildContext context) {
    if (isMobile(context)) return DeviceType.mobile;
    if (isTablet(context)) return DeviceType.tablet;
    if (isWideDesktop(context)) return DeviceType.wide;
    return DeviceType.desktop;
  }

  static T valueByDevice<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
    T? wide,
  }) {
    if (isWideDesktop(context)) return wide ?? desktop ?? tablet ?? mobile;
    if (isDesktop(context)) return desktop ?? tablet ?? mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return mobile;
  }

  static double scaledFontSize(BuildContext context, double baseSize) {
    return valueByDevice<double>(
      context,
      mobile: baseSize,
      tablet: baseSize * 1.1,
      desktop: baseSize * 1.15,
      wide: baseSize * 1.2,
    );
  }

  static double padding(BuildContext context) {
    return valueByDevice<double>(
      context,
      mobile: 16,
      tablet: 24,
      desktop: 32,
      wide: 40,
    );
  }

  static int gridColumns(BuildContext context) {
    return valueByDevice<int>(
      context,
      mobile: 1,
      tablet: 2,
      desktop: 3,
      wide: 4,
    );
  }
}

enum DeviceType { mobile, tablet, desktop, wide }
