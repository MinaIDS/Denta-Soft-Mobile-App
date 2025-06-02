import 'package:denta_soft/components/text_field_container.dart';
import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String>? onChanged; // Make onChanged nullable
  final String? Function(String?)?
  validator; // Make validator nullable with nullable return type
  final TextEditingController? controller; // Make controller nullable

  const RoundedPasswordField({
    Key? key, // Mark key as nullable
    this.onChanged,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        textInputAction: TextInputAction.done,
        controller: widget.controller,
        cursorColor: ThemeColors.dark,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(Icons.lock_outline, color: ThemeColors.primary),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
                print(_obscureText);
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              semanticLabel: _obscureText ? 'show password' : 'hide password',
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
