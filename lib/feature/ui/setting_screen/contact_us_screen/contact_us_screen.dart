import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theming/app_color.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../setting_widgets/ambr_container.dart';
import 'contact_us_widget/contact_footer.dart';
import 'contact_us_widget/contact_methods_card.dart';
import 'contact_us_widget/developer_profile_card.dart';
import 'contact_us_widget/quick_message_form.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  static const String _phoneNumber = '01500730240';
  static const String _whatsappNumber = '201500730240';
  static const String _emailAddress = 'aelbadri23@gmail.com';
  static const String _linkedinUrl = 'https://www.linkedin.com/in/ahmed-salah-g63/';

  Future<void> _launchUri(Uri uri, BuildContext context) async {
    try {
      final canLaunch = await canLaunchUrl(uri);
      if (canLaunch) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (_) {
      if (context.mounted) {
        _showSnackBar(context, 'Could not launch action. Please try again.');
      }
    }
  }

  void _callPhone(BuildContext context) {
    final uri = Uri(scheme: 'tel', path: _phoneNumber);
    _launchUri(uri, context);
  }

  void _openWhatsApp(BuildContext context) {
    const text = "Assalamu Alaikum Ahmed,\nI'm contacting you regarding the Pray in Time app.";
    final uri = Uri.parse(
      'https://wa.me/$_whatsappNumber?text=${Uri.encodeComponent(text)}',
    );
    _launchUri(uri, context);
  }

  void _sendEmail(BuildContext context, {String? subject, String? body}) {
    final uri = Uri(
      scheme: 'mailto',
      path: _emailAddress,
      queryParameters: {
        'subject': subject ?? 'Pray in Time Support & Feedback',
        if (body != null && body.isNotEmpty) 'body': body,
      },
    );
    _launchUri(uri, context);
  }

  void _openLinkedIn(BuildContext context) {
    final uri = Uri.parse(_linkedinUrl);
    _launchUri(uri, context);
  }

  void _copyToClipboard(BuildContext context, String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    _showSnackBar(context, '$label copied to clipboard');
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 13.sp),
        ),
        backgroundColor: const Color(0xff121829),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Contact Us',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: AmberContainer(
              height: 40.h,
              width: 40.w,
              icon: Icons.support_agent_rounded,
              iconColor: secondaryColor,
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(14.r),
              iconSize: 22.clampSp(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DeveloperProfileCard(),
            const Gap(24),

            _buildSectionHeader('GET IN TOUCH'),
            const Gap(10),
            ContactMethodsCard(
              phoneNumber: _phoneNumber,
              emailAddress: _emailAddress,
              onCallPhone: () => _callPhone(context),
              onCopyPhone: () => _copyToClipboard(context, _phoneNumber, 'Phone number'),
              onOpenWhatsApp: () => _openWhatsApp(context),
              onSendEmail: () => _sendEmail(context),
              onCopyEmail: () => _copyToClipboard(context, _emailAddress, 'Email address'),
              onOpenLinkedIn: () => _openLinkedIn(context),
            ),
            const Gap(24),

            _buildSectionHeader('SEND A QUICK MESSAGE'),
            const Gap(10),
            QuickMessageForm(
              targetEmail: _emailAddress,
              onSendMessage: (subject, body) {
                if (subject.isEmpty && body.isEmpty) {
                  _sendEmail(context);
                } else {
                  _sendEmail(
                    context,
                    subject: subject.isNotEmpty ? subject : 'Pray in Time Feedback',
                    body: body,
                  );
                }
              },
            ),
            const Gap(32),
            const ContactFooter(),
            const Gap(24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        color: Colors.white.withOpacity(0.4),
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
      ),
    );
  }
}
