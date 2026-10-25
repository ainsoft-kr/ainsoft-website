import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/modules/contact/controllers/contact_view_model.dart';
import '/modules/contact/data/models/contact_inquiry.dart';
import '/modules/contact/data/services/contact_service.dart';
import '/modules/home/widgets/corporate_page_components.dart';
import '/modules/home/widgets/corporate_responsive.dart';
import '/shared/design/app_font_config.dart';

const _ink = Color(0xFF0F2A2B);
const _accent = Color(0xFFC86E42);
const _muted = Color(0xFF536D6D);

class ContactFormSection extends StatefulWidget {
  const ContactFormSection({super.key, this.viewModel});

  final ContactViewModel? viewModel;

  @override
  State<ContactFormSection> createState() => _ContactFormSectionState();
}

class _ContactFormSectionState extends State<ContactFormSection> {
  late final ContactViewModel _controller =
      widget.viewModel ?? ContactViewModel();

  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _company = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _message = TextEditingController();

  late String _type = _controller.inquiryTypes.first;
  bool _privacyConsent = false;
  bool _consentError = false;
  bool _submitting = false;
  bool _submitted = false;
  String? _errorMessage;

  static final _emailRegex = RegExp(r'^[^\s@<>"]+@[^\s@<>"]+\.[^\s@<>"]+$');

  @override
  void dispose() {
    for (final c in [_name, _company, _email, _phone, _message]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    final valid = _formKey.currentState!.validate();
    setState(() {
      _consentError = !_privacyConsent;
      _errorMessage = null;
    });
    if (!valid || !_privacyConsent) return;

    setState(() => _submitting = true);
    try {
      await _controller.submitInquiry(
        ContactInquiry(
          name: _name.text,
          company: _company.text,
          email: _email.text,
          phone: _phone.text,
          type: _type,
          message: _message.text,
          privacyConsent: _privacyConsent,
        ),
      );
      if (!mounted) return;
      setState(() => _submitted = true);
    } on ContactSubmitException catch (e) {
      if (!mounted) return;
      setState(() => _errorMessage = _messageFor(e.code));
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  String _messageFor(String code) {
    switch (code) {
      case 'network_error':
        return '네트워크 오류로 전송하지 못했습니다. 잠시 후 다시 시도해 주세요.';
      case 'email_invalid':
        return '이메일 주소를 다시 확인해 주세요.';
      default:
        return '문의를 전송하지 못했습니다. 잠시 후 다시 시도해 주세요.';
    }
  }

  void _reset() {
    _formKey.currentState?.reset();
    for (final c in [_name, _company, _email, _phone, _message]) {
      c.clear();
    }
    setState(() {
      _type = _controller.inquiryTypes.first;
      _privacyConsent = false;
      _consentError = false;
      _submitted = false;
      _errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CorporatePageSection(
      label: 'Inquiry',
      title: '문의 내용을 남겨주시면 빠르게 연락드리겠습니다.',
      description: '아래 양식을 작성해 보내주시면 담당자가 확인 후 입력하신 이메일로 답변드립니다.',
      child: _submitted ? _buildSuccess(context) : _buildForm(context),
    );
  }

  Widget _buildSuccess(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsive.cardPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(responsive.isMobile ? 18 : 24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline, color: _accent, size: 36),
          const SizedBox(height: 12),
          Text(
            '문의가 접수되었습니다.',
            style: GoogleFonts.spaceGrotesk(
              fontSize: responsive.cardTitleSize,
              fontWeight: FontWeight.w700,
              color: _ink,
            ).copyWith(fontFamilyFallback: appFontFallback),
          ),
          const SizedBox(height: 8),
          Text(
            '확인 후 ${_email.text.trim()} 으로 답변드리겠습니다.',
            style: _bodyStyle(responsive),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: _reset,
            style: OutlinedButton.styleFrom(
              foregroundColor: _ink,
              side: const BorderSide(color: _ink),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            child: const Text('새 문의 작성'),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final responsive = CorporateResponsive.of(context);
    final gap = responsive.isMobile ? 14.0 : 16.0;

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(responsive.cardPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(responsive.isMobile ? 18 : 24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FieldRow(
              stacked: responsive.isMobile,
              gap: gap,
              children: [
                _field(
                  controller: _name,
                  label: '이름 *',
                  maxLength: 100,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? '이름을 입력해 주세요.' : null,
                ),
                _field(controller: _company, label: '회사명', maxLength: 200),
              ],
            ),
            SizedBox(height: gap),
            _FieldRow(
              stacked: responsive.isMobile,
              gap: gap,
              children: [
                _field(
                  controller: _email,
                  label: '이메일 *',
                  maxLength: 254,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    final value = v?.trim() ?? '';
                    if (value.isEmpty) return '이메일을 입력해 주세요.';
                    if (!_emailRegex.hasMatch(value)) {
                      return '올바른 이메일 주소를 입력해 주세요.';
                    }
                    return null;
                  },
                ),
                _field(
                  controller: _phone,
                  label: '연락처',
                  maxLength: 40,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
            SizedBox(height: gap + 4),
            Text('문의 유형 *', style: _labelStyle()),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final type in _controller.inquiryTypes)
                  ChoiceChip(
                    label: Text(type),
                    selected: _type == type,
                    onSelected: (_) => setState(() => _type = type),
                    selectedColor: _ink,
                    labelStyle: TextStyle(
                      color: _type == type ? Colors.white : _ink,
                      fontWeight: FontWeight.w600,
                    ),
                    showCheckmark: false,
                  ),
              ],
            ),
            SizedBox(height: gap + 4),
            _field(
              controller: _message,
              label: '문의 내용 *',
              hint: '적용하려는 업무 흐름, 현재 운영 환경, 희망 일정을 함께 적어주시면 더 빠르게 안내드릴 수 있습니다.',
              maxLength: 5000,
              maxLines: 8,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? '문의 내용을 입력해 주세요.' : null,
            ),
            SizedBox(height: gap),
            _buildConsent(responsive),
            if (_errorMessage != null) ...[
              SizedBox(height: gap),
              Text(
                _errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            SizedBox(height: gap + 4),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: responsive.isMobile ? double.infinity : null,
                child: FilledButton(
                  onPressed: _submitting ? null : _submit,
                  style: FilledButton.styleFrom(
                    backgroundColor: _ink,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 18,
                    ),
                  ),
                  child: _submitting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('문의 보내기'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsent(CorporateResponsive responsive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => setState(() {
            _privacyConsent = !_privacyConsent;
            if (_privacyConsent) _consentError = false;
          }),
          child: Row(
            children: [
              Checkbox(
                value: _privacyConsent,
                activeColor: _ink,
                onChanged: (v) => setState(() {
                  _privacyConsent = v ?? false;
                  if (_privacyConsent) _consentError = false;
                }),
              ),
              Expanded(
                child: Text('개인정보 수집 및 이용에 동의합니다. *', style: _labelStyle()),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            _controller.privacyNotice,
            style: _bodyStyle(responsive).copyWith(fontSize: 12),
          ),
        ),
        if (_consentError)
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 6),
            child: Text(
              '개인정보 수집 및 이용에 동의해 주세요.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    String? hint,
    int maxLines = 1,
    int? maxLength,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: maxLines > 1 ? TextInputType.multiline : keyboardType,
      validator: validator,
      enabled: !_submitting,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintMaxLines: 3,
        alignLabelWithHint: maxLines > 1,
        counterText: '',
        filled: true,
        fillColor: const Color(0xFFF7F2EA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: _accent, width: 1.5),
        ),
      ),
    );
  }

  TextStyle _labelStyle() => GoogleFonts.dmSans(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: _ink,
  ).copyWith(fontFamilyFallback: appFontFallback);

  TextStyle _bodyStyle(CorporateResponsive responsive) => GoogleFonts.dmSans(
    fontSize: responsive.isMobile ? 14 : 15,
    height: 1.7,
    color: _muted,
  ).copyWith(fontFamilyFallback: appFontFallback);
}

/// 모바일에서는 세로로, 그 외에는 가로 2열로 배치
class _FieldRow extends StatelessWidget {
  const _FieldRow({
    required this.stacked,
    required this.gap,
    required this.children,
  });

  final bool stacked;
  final double gap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (stacked) {
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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) SizedBox(width: gap),
          Expanded(child: children[i]),
        ],
      ],
    );
  }
}
