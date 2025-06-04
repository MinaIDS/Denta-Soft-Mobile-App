import 'package:denta_soft/components/text_field_container.dart';
import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText; // Make hintText nullable if you want it optional
  final IconData? icon; // icon should be nullable
  final TextEditingController? controller; // controller should be nullable
  final String? Function(String?)?
  validator; // Make validator nullable with a nullable return type
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged; // onChanged should be nullable

  const RoundedInputField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: ThemeColors.primary,
        textInputAction: TextInputAction.next, // Moves focus to next.
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          icon: icon != null
              ? Icon(icon, color: ThemeColors.primary)
              : null, // Add null check for icon
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
