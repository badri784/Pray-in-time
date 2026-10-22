import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theming/app_color.dart';

class QuickMessageForm extends StatefulWidget {
  const QuickMessageForm({
    super.key,
    required this.onSendMessage,
    this.targetEmail = 'aelbadri23@gmail.com',
  });

  final void Function(String subject, String body) onSendMessage;
  final String targetEmail;

  @override
  State<QuickMessageForm> createState() => _QuickMessageFormState();
}

class _QuickMessageFormState extends State<QuickMessageForm> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final subject = _subjectController.text.trim();
    final body = _messageController.text.trim();
    widget.onSendMessage(subject, body);
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).colorScheme.secondary;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xff121829),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _subjectController,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 14.sp),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.darkBackground,
              hintText: 'Subject (e.g. Suggestion, Issue, Feedback)',
              hintStyle: GoogleFonts.inter(
                color: Colors.white.withOpacity(0.35),
                fontSize: 13.sp,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.08)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.08)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: accentColor, width: 1.5),
              ),
            ),
          ),
          const Gap(12),
          TextField(
            controller: _messageController,
            maxLines: 4,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 14.sp),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.darkBackground,
              hintText: 'Type your message here...',
              hintStyle: GoogleFonts.inter(
                color: Colors.white.withOpacity(0.35),
                fontSize: 13.sp,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.08)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.08)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: accentColor, width: 1.5),
              ),
            ),
          ),
          const Gap(16),
          ElevatedButton.icon(
            onPressed: _handleSubmit,
            icon: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
            label: Text(
              'Send to ${widget.targetEmail}',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryEmerald,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
