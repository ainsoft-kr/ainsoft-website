import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '/core/routing/route_manager.dart';
import '/shared/design/app_font_config.dart';
import '../models/corporate_content_models.dart';
import 'corporate_responsive.dart';

/// Site page tokens. Mirrors the color tokens in
/// `_bmad-output/planning-artifacts/ux-designs/ux-homepage-2026-10-25/DESIGN.md`.
class SiteColors {
  SiteColors._();

  static const ink = Color(0xFF0F2A2B);
  static const ink2 = Color(0xFF224142);
  static const muted = Color(0xFF536D6D);
  static const sand = Color(0xFFEFE6D8);
  static const surface = Colors.white;
  static const accent = Color(0xFFC86E42);
  static const onInk = Color(0xFFF7F2EA);
  static const onInkMuted = Color(0xFFBFD0C8);
  static const line = Color(0x1A0F2A2B);
  static const lineOnInk = Color(0x26FFFFFF);
}

TextStyle siteText({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w400,
  Color color = SiteColors.ink,
  double? height,
  double? letterSpacing,
}) {
  return GoogleFonts.dmSans(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
  ).copyWith(fontFamilyFallback: appFontFallback);
}

TextStyle siteProductName({
  double fontSize = 18,
  Color color = SiteColors.onInk,
}) {
  return GoogleFonts.spaceGrotesk(
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    color: color,
  ).copyWith(fontFamilyFallback: appFontFallback);
}

Future<void> openExternalUrl(String url) async {
  await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
}

/// Full-bleed band with a centered, width-constrained body.
class SiteBand extends StatelessWidget {
  const SiteBand({
    super.key,
    required this.child,
    this.color,
    this.verticalPadding,
  });

  final Widget child;
  final Color? color;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);
    final vertical =
        verticalPadding ??
        (responsive.isMobile
            ? 64
            : responsive.isTablet
            ? 80
            : 104);

    return Container(
      width: double.infinity,
      color: color,
      padding: EdgeInsets.symmetric(
        horizontal: responsive.isMobile ? 16 : 32,
        vertical: vertical,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: SizedBox(width: double.infinity, child: child),
        ),
      ),
    );
  }
}

class SiteSectionHeading extends StatelessWidget {
  const SiteSectionHeading({
    super.key,
    required this.title,
    this.subtitle,
    this.centered = false,
    this.dark = false,
  });

  final String title;
  final String? subtitle;
  final bool centered;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);
    final align = centered ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            title,
            textAlign: align,
            style: siteText(
              fontSize: responsive.isMobile
                  ? 26
                  : responsive.isTablet
                  ? 32
                  : 38,
              fontWeight: FontWeight.w800,
              height: 1.25,
              letterSpacing: -0.4,
              color: dark ? SiteColors.onInk : SiteColors.ink,
            ),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(
              subtitle!,
              textAlign: align,
              style: siteText(
                fontSize: 17,
                height: 1.6,
                color: dark ? SiteColors.onInkMuted : SiteColors.muted,
              ),
            ),
          ),
        ],
        SizedBox(height: responsive.isMobile ? 28 : 40),
      ],
    );
  }
}

/// The one accent-colored action on a page: contact.
class SitePrimaryCta extends StatelessWidget {
  const SitePrimaryCta({super.key, this.fullWidth = false});

  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final button = FilledButton(
      onPressed: RouteManager.toContact,
      style: FilledButton.styleFrom(
        backgroundColor: SiteColors.accent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: siteText(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      child: const Text('도입 상담 신청'),
    );

    if (!fullWidth) return button;
    return SizedBox(width: double.infinity, child: button);
  }
}

class SiteArrowLink extends StatelessWidget {
  const SiteArrowLink({
    super.key,
    required this.label,
    required this.onTap,
    this.color = SiteColors.ink,
  });

  final String label;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: color, width: 2)),
        ),
        child: Text(
          '$label →',
          style: siteText(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ),
    );
  }
}

/// [columns] across on desktop, two on tablet when [columns] > 2, one on
/// mobile.
class SiteColumns extends StatelessWidget {
  const SiteColumns({
    super.key,
    required this.children,
    this.columns = 3,
    this.gap = 28,
    this.stretch = false,
  });

  final List<Widget> children;
  final int columns;
  final double gap;
  final bool stretch;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);
    final perRow = responsive.isMobile
        ? 1
        : responsive.isTablet
        ? (columns > 2 ? 1 : columns)
        : columns;

    if (perRow == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) SizedBox(height: gap),
            children[i],
          ],
        ],
      );
    }

    final rows = <Widget>[];
    for (var start = 0; start < children.length; start += perRow) {
      final cells = <Widget>[];
      for (var i = start; i < start + perRow; i++) {
        if (i > start) cells.add(SizedBox(width: gap));
        cells.add(
          Expanded(child: i < children.length ? children[i] : const SizedBox()),
        );
      }
      final row = Row(
        crossAxisAlignment: stretch
            ? CrossAxisAlignment.stretch
            : CrossAxisAlignment.start,
        children: cells,
      );
      if (rows.isNotEmpty) rows.add(SizedBox(height: gap));
      rows.add(stretch ? IntrinsicHeight(child: row) : row);
    }
    return Column(children: rows);
  }
}

/// Opening band of a detail page: what it is, for the decision maker.
class SitePageHero extends StatelessWidget {
  const SitePageHero({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.lead,
    this.secondaryLabel,
    this.onSecondary,
  });

  final String eyebrow;
  final String title;
  final String lead;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return SiteBand(
      verticalPadding: responsive.isMobile
          ? 48
          : responsive.isTablet
          ? 72
          : 96,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eyebrow,
            style: siteText(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SiteColors.muted,
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Semantics(
              header: true,
              child: Text(
                title,
                style: siteText(
                  fontSize: responsive.isMobile
                      ? 28
                      : responsive.isTablet
                      ? 38
                      : 48,
                  fontWeight: FontWeight.w800,
                  height: 1.22,
                  letterSpacing: -0.6,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              lead,
              style: siteText(
                fontSize: responsive.isMobile ? 17 : 19,
                height: 1.6,
                color: SiteColors.ink2,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 20,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SitePrimaryCta(fullWidth: responsive.isMobile),
              if (secondaryLabel != null && onSecondary != null)
                SiteArrowLink(label: secondaryLabel!, onTap: onSecondary!),
            ],
          ),
        ],
      ),
    );
  }
}

/// Equal-weight card: kind, title, one-line body, sub-items, note, link.
class SiteOfferCard extends StatelessWidget {
  const SiteOfferCard({super.key, required this.data, this.onLink});

  final SiteCardData data;
  final VoidCallback? onLink;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Container(
      padding: EdgeInsets.all(responsive.isMobile ? 22 : 28),
      decoration: BoxDecoration(
        color: SiteColors.ink,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data.kind != null) ...[
                Text(
                  data.kind!,
                  style: siteText(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: SiteColors.onInkMuted,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              Text(
                data.title,
                style: siteText(
                  fontSize: responsive.cardTitleSize,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  color: SiteColors.onInk,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data.body,
                style: siteText(height: 1.6, color: SiteColors.onInkMuted),
              ),
              const SizedBox(height: 20),
              for (final (name, detail) in data.items) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: siteProductName()),
                      const SizedBox(height: 2),
                      Text(
                        detail,
                        style: siteText(
                          fontSize: 14,
                          height: 1.5,
                          color: SiteColors.onInkMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
              if (data.note != null) ...[
                const SizedBox(height: 10),
                Text(
                  data.note!,
                  style: siteText(fontSize: 14, color: SiteColors.onInkMuted),
                ),
              ],
              const SizedBox(height: 20),
            ],
          ),
          if (data.linkLabel != null && onLink != null)
            SiteArrowLink(
              label: data.linkLabel!,
              color: SiteColors.onInk,
              onTap: onLink!,
            ),
        ],
      ),
    );
  }
}

/// Plain text column: title, body, optional tag and bullet lines.
class SiteTextItem extends StatelessWidget {
  const SiteTextItem({
    super.key,
    required this.title,
    required this.body,
    this.tag,
    this.bullets = const [],
    this.dark = false,
  });

  final String title;
  final String body;
  final String? tag;
  final List<String> bullets;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final fg = dark ? SiteColors.onInk : SiteColors.ink;
    final fgMuted = dark ? SiteColors.onInkMuted : SiteColors.muted;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tag != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: dark
                  ? Colors.white.withValues(alpha: 0.14)
                  : SiteColors.sand,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              tag!,
              style: siteText(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: dark ? SiteColors.onInk : SiteColors.ink2,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
        Text(
          title,
          style: siteText(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 1.4,
            color: fg,
          ),
        ),
        if (body.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            body,
            style: siteText(fontSize: 15, height: 1.6, color: fgMuted),
          ),
        ],
        for (final bullet in bullets) ...[
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 9, right: 10),
                child: Container(width: 4, height: 4, color: fgMuted),
              ),
              Expanded(
                child: Text(
                  bullet,
                  style: siteText(fontSize: 15, height: 1.6, color: fg),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class SiteScenarioItem extends StatelessWidget {
  const SiteScenarioItem({super.key, required this.data});

  final SiteScenarioData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: SiteColors.ink, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: data.who),
                if (data.kind != null)
                  TextSpan(
                    text: '  ${data.kind}',
                    style: siteText(fontSize: 13, color: SiteColors.muted),
                  ),
              ],
            ),
            style: siteText(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: SiteColors.muted,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.title,
            style: siteText(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          _BeforeAfterLine(tag: '전', text: data.before, emphasized: false),
          const SizedBox(height: 8),
          _BeforeAfterLine(tag: '후', text: data.after, emphasized: true),
        ],
      ),
    );
  }
}

class _BeforeAfterLine extends StatelessWidget {
  const _BeforeAfterLine({
    required this.tag,
    required this.text,
    required this.emphasized,
  });

  final String tag;
  final String text;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final color = emphasized ? SiteColors.ink : SiteColors.muted;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 28,
          child: Text(
            tag,
            style: siteText(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: color,
              height: 1.7,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: siteText(fontSize: 15, height: 1.6, color: color),
          ),
        ),
      ],
    );
  }
}

/// Term / description rows for developer-facing detail on a dark band.
class SiteSpecList extends StatelessWidget {
  const SiteSpecList({super.key, required this.title, required this.specs});

  final String title;
  final List<SiteSpecData> specs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: siteProductName(fontSize: 22)),
        const SizedBox(height: 12),
        for (final spec in specs)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: SiteColors.lineOnInk)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  spec.term,
                  style: siteText(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: SiteColors.onInkMuted,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  spec.value,
                  style: siteText(
                    fontSize: 15,
                    height: 1.6,
                    color: SiteColors.onInk,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Clickable repository row that opens in a new tab.
class SiteRepoLink extends StatelessWidget {
  const SiteRepoLink({super.key, required this.data});

  final SiteRepoData data;

  @override
  Widget build(BuildContext context) {
    final path = Uri.parse(data.url).path.replaceFirst('/', '');

    return Semantics(
      link: true,
      label: '${data.name} 저장소 열기',
      excludeSemantics: true,
      child: InkWell(
        onTap: () => openExternalUrl(data.url),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: SiteColors.lineOnInk),
          ),
          child: Row(
            children: [
              const Icon(Icons.code_rounded, color: SiteColors.onInk, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: siteText(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: SiteColors.onInk,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      data.note ?? 'github.com/$path',
                      style: siteText(
                        fontSize: 13,
                        color: SiteColors.onInkMuted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.open_in_new_rounded,
                color: SiteColors.onInkMuted,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Developer column: spec rows followed by repository links.
class SiteDeveloperColumn extends StatelessWidget {
  const SiteDeveloperColumn({
    super.key,
    required this.title,
    required this.specs,
    required this.repos,
    this.reposLabel = '공개 저장소',
  });

  final String title;
  final List<SiteSpecData> specs;
  final List<SiteRepoData> repos;
  final String reposLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SiteSpecList(title: title, specs: specs),
        const SizedBox(height: 20),
        Text(
          reposLabel,
          style: siteText(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: SiteColors.onInkMuted,
          ),
        ),
        const SizedBox(height: 10),
        for (final repo in repos) ...[
          SiteRepoLink(data: repo),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class SiteFinalCta extends StatelessWidget {
  const SiteFinalCta({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return SiteBand(
      color: SiteColors.surface,
      child: Column(
        children: [
          SiteSectionHeading(title: title, subtitle: subtitle, centered: true),
          SitePrimaryCta(fullWidth: responsive.isMobile),
        ],
      ),
    );
  }
}

/// Scrolls the shell so the widget behind [key] is in view.
void scrollToKey(GlobalKey key) {
  final target = key.currentContext;
  if (target == null) return;
  Scrollable.ensureVisible(
    target,
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeOut,
  );
}
