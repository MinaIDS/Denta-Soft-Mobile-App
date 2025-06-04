import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String hint;
  final EdgeInsets margin;
  final TextEditingController? controller;
  final void Function(String)? onChanged; // onChanged can be nullable
  final FormFieldSetter<String>?
  onSave; // onSave is of type FormFieldSetter<String>
  final FormFieldValidator<String>?
  validator; // Fixed: Changed validator to FormFieldValidator<String>
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool noborder;
  final String label;
  final bool obSecure;

  const CustomPasswordTextField({
    super.key,
    this.controller,
    this.hint = '',
    this.suffixIcon,
    this.validator, // validator is now nullable and of correct type
    this.onChanged,
    this.margin = EdgeInsets.zero,
    this.prefixIcon,
    this.noborder = false,
    this.label = '',
    this.obSecure = false,
    this.onSave,
  });

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  late bool obsecure;

  @override
  void initState() {
    super.initState();
    obsecure = widget.obSecure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        onChanged: widget.onChanged, // onChanged can be nullable
        onSaved: widget.onSave, // onSaved is correctly typed
        validator: widget.validator, // validator is now correctly typed
        obscureText: obsecure,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: obsecure
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                obsecure = !obsecure; // Toggle the obscure text
              });
            },
          ),
          prefixIcon: widget.prefixIcon,
          hintText: widget.hint,
          labelText: widget.label,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 18,
          ),
          border: OutlineInputBorder(
            borderSide: widget.noborder
                ? BorderSide.none
                : const BorderSide(), // No border or default border
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
