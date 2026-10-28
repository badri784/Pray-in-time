import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/helper/font_weight_helper.dart';

class AllowButtonWidget extends StatelessWidget {
  const AllowButtonWidget({super.key, this.text, this.onpressed});
  final String? text;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xffc58505).withValues(alpha: 0.15),
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: const Color(0xffc58505),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          text ?? '',
          style: GoogleFonts.libertinusSans(
            fontSize: 16,
            fontWeight: FontWeightHelper.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
