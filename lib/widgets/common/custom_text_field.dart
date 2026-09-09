import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String hint;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final int maxLines;
  final Widget? suffix;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    this.label,
    required this.hint,
    this.prefixIcon,
    this.controller,
    this.maxLines = 1,
    this.suffix,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          const SizedBox(height: 6),
        ],
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 20) : null,
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
