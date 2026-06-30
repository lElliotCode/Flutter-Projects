import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator, this.prefixIcon, this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(20));
    final errorBorder = border.copyWith(
      borderSide: BorderSide(color: Colors.red.shade500),
    );

    return TextFormField(
      onChanged: onChanged,

      validator: validator,

      obscureText: obscureText,

      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        focusedErrorBorder: errorBorder,
        errorBorder: errorBorder,
        focusColor: colors.inversePrimary,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
