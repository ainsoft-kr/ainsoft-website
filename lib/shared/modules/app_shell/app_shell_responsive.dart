import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppShellResponsive {
  AppShellResponsive._({
    required this.isMobile,
    required this.isTablet,
    required this.isBrowser,
  });

  factory AppShellResponsive.of(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoints.smallerThan(TABLET);
    final isTablet = !isMobile && breakpoints.smallerThan(DESKTOP);
    final isBrowser = !breakpoints.smallerThan(DESKTOP);

    return AppShellResponsive._(
      isMobile: isMobile,
      isTablet: isTablet,
      isBrowser: isBrowser,
    );
  }

  final bool isMobile;
  final bool isTablet;
  final bool isBrowser;

  double get maxContentWidth => isBrowser
      ? 1240
      : isTablet
      ? 960
      : 680;

  EdgeInsets get pagePadding => EdgeInsets.fromLTRB(
    isMobile ? 16 : 20,
    isMobile ? 14 : 18,
    isMobile ? 16 : 20,
    0,
  );

  EdgeInsets get sectionPadding => EdgeInsets.fromLTRB(
    isMobile ? 16 : 20,
    isMobile ? 18 : 22,
    isMobile ? 16 : 20,
    0,
  );

  double get sectionContainerPadding => isMobile
      ? 20
      : isTablet
      ? 24
      : 28;

  double get sectionRadius => isMobile ? 24 : 32;

  double get heroTitleSize => isMobile
      ? 34
      : isTablet
      ? 46
      : 58;

  double get sectionTitleSize => isMobile
      ? 26
      : isTablet
      ? 30
      : 32;

  double get bannerTitleSize => isMobile
      ? 24
      : isTablet
      ? 28
      : 30;

  double get bodyFontSize => isMobile ? 15 : 16;

  double get cardTitleSize => isMobile ? 20 : 24;

  double get cardPadding => isMobile ? 18 : 22;

  double get gap => isMobile ? 12 : 16;
}
