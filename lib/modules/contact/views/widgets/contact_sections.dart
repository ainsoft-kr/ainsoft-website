import 'package:flutter/material.dart';
import '/modules/contact/controllers/contact_view_model.dart';
import '/modules/home/widgets/corporate_responsive.dart';
import '/modules/home/widgets/site_components.dart';

class ContactHeroSection extends StatelessWidget {
  const ContactHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ContactViewModel();
    final responsive = CorporateResponsive.of(context);

    final mailButton = FilledButton.icon(
      onPressed: () => openExternalUrl(controller.mailtoUrl),
      icon: const Icon(Icons.mail_outline_rounded, size: 20),
      label: const Text('메일로 상담 신청'),
      style: FilledButton.styleFrom(
        backgroundColor: SiteColors.accent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: siteText(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );

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
            '도입 상담',
            style: siteText(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SiteColors.muted,
            ),
          ),
          const SizedBox(height: 16),
          Semantics(
            header: true,
            child: Text(
              '지금 가장 반복되는 업무\n하나만 알려주세요.',
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
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              '메일 한 통이면 상담이 시작됩니다. 아래 버튼을 누르면 적어 주실 항목이 채워진 메일이 열립니다.',
              style: siteText(
                fontSize: responsive.isMobile ? 17 : 19,
                height: 1.6,
                color: SiteColors.ink2,
              ),
            ),
          ),
          const SizedBox(height: 32),
          if (responsive.isMobile)
            SizedBox(width: double.infinity, child: mailButton)
          else
            mailButton,
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.schedule_rounded,
                size: 18,
                color: SiteColors.ink2,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  controller.replyPromise,
                  style: siteText(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: SiteColors.ink2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 28,
            runSpacing: 12,
            children: [
              _ContactLine(
                icon: Icons.alternate_email_rounded,
                label: controller.email,
                onTap: () => openExternalUrl('mailto:${controller.email}'),
              ),
              _ContactLine(
                icon: Icons.phone_outlined,
                label: controller.phone,
                onTap: () => openExternalUrl(controller.telUrl),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  const _ContactLine({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: SiteColors.muted),
            const SizedBox(width: 8),
            Text(label, style: siteText(fontSize: 15, color: SiteColors.ink2)),
          ],
        ),
      ),
    );
  }
}

class ContactChecklistSection extends StatelessWidget {
  const ContactChecklistSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ContactViewModel();

    return SiteBand(
      color: SiteColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '이 세 가지를 적어 주시면 더 빨라집니다',
            subtitle: '정확하지 않아도 괜찮습니다. 대략적인 내용만으로도 상담을 시작할 수 있습니다.',
          ),
          SiteColumns(
            children: [
              for (var i = 0; i < controller.checklist.length; i++)
                SiteTextItem(
                  tag: '${i + 1}',
                  title: controller.checklist[i].$1,
                  body: controller.checklist[i].$2,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactTopicsSection extends StatelessWidget {
  const ContactTopicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ContactViewModel();

    return SiteBand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(title: '이런 이야기를 나눕니다'),
          SiteColumns(
            columns: 2,
            children: [
              for (final (title, body) in controller.topics)
                SiteTextItem(title: title, body: body),
            ],
          ),
        ],
      ),
    );
  }
}
