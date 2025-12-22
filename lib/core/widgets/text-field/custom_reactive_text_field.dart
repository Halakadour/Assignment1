import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextField extends StatelessWidget {
  const CustomReactiveTextField({
    super.key,
    this.maxLines = 1,
    this.expands = false,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.formControlName,
    this.validationMessages,
    this.onPressedSuffixIcon,
  });
  final int? maxLines;
  final bool expands;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final bool readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? formControlName;
  final Map<String, String Function(Object)>? validationMessages;
  final void Function()? onPressedSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: formControlName,
      autocorrect: true,
      obscureText: obscureText,
      readOnly: readOnly,
      maxLines: maxLines,
      expands: expands,
      textAlignVertical: TextAlignVertical.top,
      style: Theme.of(context).inputDecorationTheme.labelStyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        labelText: labelText,
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        hintText: hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                color: Theme.of(context).inputDecorationTheme.prefixIconColor,
                size: 18.0,
              ),
        suffixIcon: suffixIcon == null
            ? null
            : IconButton(
                onPressed: onPressedSuffixIcon,
                icon: Icon(
                  suffixIcon,
                  color: Theme.of(context).inputDecorationTheme.suffixIconColor,
                  size: 18.0,
                ),
              ),
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        focusedErrorBorder: Theme.of(
          context,
        ).inputDecorationTheme.focusedErrorBorder,
      ),
      validationMessages: validationMessages,
    );
  }
}
