import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/core/routing/route_manager.dart';
import '/shared/design/app_font_config.dart';
import 'corporate_responsive.dart';

class CorporatePageSection extends StatelessWidget {
  const CorporatePageSection({
    super.key,
    required this.label,
    required this.title,
    required this.description,
    required this.child,
    this.actionLabel,
    this.actionRoute,
    this.dark = false,
  });

  final String label;
  final String title;
  final String description;
  final Widget child;
  final String? actionLabel;
  final String? actionRoute;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Padding(
      padding: responsive.sectionPadding,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: responsive.maxContentWidth),
          child: Container(
            padding: EdgeInsets.all(responsive.sectionContainerPadding),
            decoration: BoxDecoration(
              color: dark
                  ? const Color(0xFF0F2A2B)
                  : Colors.white.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(responsive.sectionRadius),
              border: Border.all(
                color: dark
                    ? Colors.white.withValues(alpha: 0.08)
                    : const Color(0xFF0F2A2B).withValues(alpha: 0.08),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: responsive.isMobile ? 12 : 14,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFC86E42),
                  ).copyWith(fontFamilyFallback: appFontFallback),
                ),
                SizedBox(height: responsive.isMobile ? 10 : 12),
                Text(
                  title,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: responsive.sectionTitleSize,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                    color: dark
                        ? const Color(0xFFF7F2EA)
                        : const Color(0xFF0F2A2B),
                  ).copyWith(fontFamilyFallback: appFontFallback),
                ),
                SizedBox(height: responsive.isMobile ? 10 : 12),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: responsive.isBrowser ? 760 : double.infinity,
                  ),
                  child: Text(
                    description,
                    style: GoogleFonts.dmSans(
                      fontSize: responsive.bodyFontSize,
                      height: 1.7,
                      color: dark
                          ? const Color(0xFFD7E2DC)
                          : const Color(0xFF4C6767),
                    ).copyWith(fontFamilyFallback: appFontFallback),
                  ),
                ),
                SizedBox(height: responsive.isMobile ? 20 : 24),
                child,
                if (actionLabel != null && actionRoute != null) ...[
                  SizedBox(height: responsive.isMobile ? 18 : 20),
                  SizedBox(
                    width: responsive.isMobile ? double.infinity : null,
                    child: FilledButton(
                      onPressed: () => RouteManager.to(actionRoute!),
                      style: FilledButton.styleFrom(
                        backgroundColor: dark
                            ? const Color(0xFFC86E42)
                            : const Color(0xFF0F2A2B),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                      child: Text(actionLabel!),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CorporateResponsiveWrap extends StatelessWidget {
  const CorporateResponsiveWrap({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final gap = responsive.gap;
        final itemWidth = _calculateItemWidth(
          maxWidth: constraints.maxWidth,
          childCount: children.length,
          gap: gap,
          responsive: responsive,
        );

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: children
              .map((child) => SizedBox(width: itemWidth, child: child))
              .toList(),
        );
      },
    );
  }

  double _calculateItemWidth({
    required double maxWidth,
    required int childCount,
    required double gap,
    required CorporateResponsive responsive,
  }) {
    if (responsive.isMobile || childCount <= 1) {
      return maxWidth;
    }

    if (responsive.isTablet || childCount == 2) {
      return (maxWidth - gap) / 2;
    }

    return (maxWidth - (gap * 2)) / 3;
  }
}

class CorporateInfoCard extends StatelessWidget {
  const CorporateInfoCard({
    super.key,
    required this.title,
    required this.body,
    this.accentLabel,
    this.dark = false,
  });

  final String title;
  final String body;
  final String? accentLabel;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Container(
      padding: EdgeInsets.all(responsive.cardPadding),
      decoration: BoxDecoration(
        color: dark ? Colors.white.withValues(alpha: 0.10) : Colors.white,
        borderRadius: BorderRadius.circular(responsive.isMobile ? 18 : 24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (accentLabel != null) ...[
            Text(
              accentLabel!,
              style: GoogleFonts.dmSans(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFC86E42),
              ).copyWith(fontFamilyFallback: appFontFallback),
            ),
            const SizedBox(height: 10),
          ],
          Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: responsive.cardTitleSize,
              fontWeight: FontWeight.w700,
              color: dark ? const Color(0xFFF7F2EA) : const Color(0xFF0F2A2B),
            ).copyWith(fontFamilyFallback: appFontFallback),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style: GoogleFonts.dmSans(
              fontSize: responsive.isMobile ? 14 : 15,
              height: 1.7,
              color: dark ? const Color(0xFFD7E2DC) : const Color(0xFF536D6D),
            ).copyWith(fontFamilyFallback: appFontFallback),
          ),
        ],
      ),
    );
  }
}

class CorporateMetricCard extends StatelessWidget {
  const CorporateMetricCard({
    super.key,
    required this.value,
    required this.label,
    this.dark = false,
  });

  final String value;
  final String label;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.isMobile ? 12 : 14,
        vertical: responsive.isMobile ? 14 : 16,
      ),
      decoration: BoxDecoration(
        color: dark
            ? Colors.white.withValues(alpha: 0.10)
            : const Color(0xFFF1E6D7),
        borderRadius: BorderRadius.circular(responsive.isMobile ? 16 : 18),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.spaceGrotesk(
              fontSize: responsive.isMobile ? 24 : 28,
              fontWeight: FontWeight.w700,
              color: dark ? Colors.white : const Color(0xFF0F2A2B),
            ).copyWith(fontFamilyFallback: appFontFallback),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
              fontSize: 12,
              color: dark ? const Color(0xFFD7E2DC) : const Color(0xFF536D6D),
            ).copyWith(fontFamilyFallback: appFontFallback),
          ),
        ],
      ),
    );
  }
}

class CorporateActionBanner extends StatelessWidget {
  const CorporateActionBanner({
    super.key,
    required this.title,
    required this.description,
    required this.primaryLabel,
    required this.primaryRoute,
    this.secondaryLabel,
    this.secondaryRoute,
  });

  final String title;
  final String description;
  final String primaryLabel;
  final String primaryRoute;
  final String? secondaryLabel;
  final String? secondaryRoute;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Padding(
      padding: responsive.sectionPadding,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: responsive.maxContentWidth),
          child: Container(
            padding: EdgeInsets.all(responsive.sectionContainerPadding),
            decoration: BoxDecoration(
              color: const Color(0xFFC86E42),
              borderRadius: BorderRadius.circular(responsive.sectionRadius),
            ),
            child: responsive.isBrowser
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _ActionBannerCopy(
                          responsive: responsive,
                          title: title,
                          description: description,
                        ),
                      ),
                      SizedBox(width: responsive.gap + 6),
                      _ActionBannerButtons(
                        responsive: responsive,
                        primaryLabel: primaryLabel,
                        primaryRoute: primaryRoute,
                        secondaryLabel: secondaryLabel,
                        secondaryRoute: secondaryRoute,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ActionBannerCopy(
                        responsive: responsive,
                        title: title,
                        description: description,
                      ),
                      SizedBox(height: responsive.gap),
                      _ActionBannerButtons(
                        responsive: responsive,
                        primaryLabel: primaryLabel,
                        primaryRoute: primaryRoute,
                        secondaryLabel: secondaryLabel,
                        secondaryRoute: secondaryRoute,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _ActionBannerCopy extends StatelessWidget {
  const _ActionBannerCopy({
    required this.responsive,
    required this.title,
    required this.description,
  });

  final CorporateResponsive responsive;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.spaceGrotesk(
            fontSize: responsive.bannerTitleSize,
            height: 1.1,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ).copyWith(fontFamilyFallback: appFontFallback),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: GoogleFonts.dmSans(
            fontSize: responsive.bodyFontSize,
            height: 1.7,
            color: const Color(0xFFFFE8D8),
          ).copyWith(fontFamilyFallback: appFontFallback),
        ),
      ],
    );
  }
}

class _ActionBannerButtons extends StatelessWidget {
  const _ActionBannerButtons({
    required this.responsive,
    required this.primaryLabel,
    required this.primaryRoute,
    required this.secondaryLabel,
    required this.secondaryRoute,
  });

  final CorporateResponsive responsive;
  final String primaryLabel;
  final String primaryRoute;
  final String? secondaryLabel;
  final String? secondaryRoute;

  @override
  Widget build(BuildContext context) {
    if (responsive.isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton(
            onPressed: () => RouteManager.to(primaryRoute),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF0F2A2B),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            ),
            child: Text(primaryLabel),
          ),
          if (secondaryLabel != null && secondaryRoute != null) ...[
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => RouteManager.to(secondaryRoute!),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFFFFE8D8)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
              ),
              child: Text(secondaryLabel!),
            ),
          ],
        ],
      );
    }

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        FilledButton(
          onPressed: () => RouteManager.to(primaryRoute),
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF0F2A2B),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
          child: Text(primaryLabel),
        ),
        if (secondaryLabel != null && secondaryRoute != null)
          OutlinedButton(
            onPressed: () => RouteManager.to(secondaryRoute!),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFFFFE8D8)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            ),
            child: Text(secondaryLabel!),
          ),
      ],
    );
  }
}
