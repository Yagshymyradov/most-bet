import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FieldText extends StatelessWidget {
  const FieldText({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.password = false,
    this.onTogglePasscodeVisibilityTap,
    this.validator,
    this.onChanged,
    this.hintText,
    this.inputFormatter,
    this.keyboardType,
    this.maxLines = 1,
  });

  final bool password;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final String? hintText;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback? onTogglePasscodeVisibilityTap;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      inputFormatters: inputFormatter,
      style: textTheme.titleMedium,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
      ),
    );
  }
}
