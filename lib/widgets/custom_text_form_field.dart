import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final int lines;
  final bool readOnly;
  final String hint;
  final String initialValue;
  final Color hintColor;
  final Color textColor;
  final EdgeInsets margin;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool filled;
  final void Function(String)? onChanged;
  final FormFieldSetter<String>? onSave; // Updated type
  final Color filledColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator; // Updated type
  final bool noborder;
  final String label;
  final double fontSize;
  final void Function()? onTap;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.hint = '',
    this.initialValue = '',
    this.lines = 1,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.margin = EdgeInsets.zero,
    this.readOnly = false,
    this.prefixIcon,
    this.noborder = false,
    this.label = '',
    this.filled = false,
    this.filledColor = Colors.white,
    this.hintColor = const Color(0x8e78849e),
    this.textColor = Colors.black,
    this.fontSize = 14,
    this.onSave,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSave, // It will now accept FormFieldSetter<String>?
        validator: validator, // Works with String? Function(String?)?
        maxLines: lines,
        keyboardType: keyboardType,
        controller: controller,
        style: TextStyle(color: textColor, fontSize: fontSize),
        readOnly: readOnly,
        onTap: onTap,
        initialValue: initialValue,
        decoration: InputDecoration(
          fillColor: filledColor,
          filled: filled,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hint,
          labelText: label,
          hintStyle: TextStyle(color: hintColor),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          border: OutlineInputBorder(
            borderSide: noborder ? BorderSide.none : const BorderSide(),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
