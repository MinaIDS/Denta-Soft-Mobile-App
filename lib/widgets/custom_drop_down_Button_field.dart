import 'package:flutter/material.dart';

class CustomDropdownButtonField<T> extends StatelessWidget {
  final String? hint;
  final String? helperText;
  final EdgeInsets margin;
  final T? value;
  final String? Function(T?)? validator;
  final bool noborder;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;

  const CustomDropdownButtonField({
    Key? key,
    this.hint,
    this.validator,
    this.margin = EdgeInsets.zero,
    this.noborder = false,
    this.items,
    this.onChanged,
    this.value,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: DropdownButtonFormField<T>(
        hint: hint != null
            ? Text(hint!, style: const TextStyle(color: Color(0x8e78849e)))
            : null,
        value: value,
        decoration: InputDecoration(
          helperText: helperText,
          helperStyle: const TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(
            borderSide: noborder ? BorderSide.none : const BorderSide(),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        items: items,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
