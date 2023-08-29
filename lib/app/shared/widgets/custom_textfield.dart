import 'package:flutter/material.dart';
import 'package:valorant_cards_app/app/shared/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      this.labelText,
      this.hintText,
      this.onChanged,
      this.prefixIcon,
      this.obscureText = false,
      this.enabledColor,
      this.iconColor,
      this.fixedColor,
      this.borderColor,
      this.textColor = Colors.white,
      this.minLines,
      this.maxLines,
      this.size})
      : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final void Function(String)? onChanged;
  final IconData? prefixIcon;
  final bool obscureText;
  final Color? enabledColor;
  final Color? iconColor;
  final Color? fixedColor;
  final Color? borderColor;
  final Color textColor;
  final int? minLines;
  final int? maxLines;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      minLines: minLines,
      maxLines: maxLines,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: textColor, fontSize: size ?? 16),
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: iconColor,
        ),
        labelText: labelText,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.grey.shade400, fontSize: size ?? 16),
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.grey.shade400, fontSize: size ?? 16),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding),
          ),
          borderSide: BorderSide(
              color: fixedColor ?? Theme.of(context).colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding),
          ),
          borderSide: BorderSide(
              color: fixedColor ?? Theme.of(context).colorScheme.secondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding),
          ),
          borderSide: BorderSide(
              color: enabledColor ?? Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
