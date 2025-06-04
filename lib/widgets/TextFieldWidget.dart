import '../utils/SizesStatic.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller; // Nullable
  final ValueSetter<String>? onChangeText; // Nullable
  final FocusNode? focusNode; // Nullable
  final TextInputAction? textInputAction; // Nullable
  final Function? onSubmitted; // Nullable
  final TextInputType textInputType; // Non-nullable

  final String? hintText; // Nullable
  final String? labelText; // Nullable
  final String? errorText; // Nullable
  final Icon? icon; // Nullable
  final bool isInputPassword;

  const TextFieldWidget({
    super.key,
    this.onChangeText,
    this.hintText,
    this.icon,
    this.controller,
    this.errorText,
    this.isInputPassword = false,
    this.focusNode,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.onSubmitted,
    this.labelText,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors
                .grey[300]!, // You can leave it with "!" here, as it's safe now
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(10.0, 10.0),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        color: Colors.white,
        elevation: 0.5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeWidth_S, vertical: 0),
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onSubmitted as void Function(String)?,
            keyboardType: widget.textInputType,
            onChanged: (value) {
              widget.onChangeText?.call(value); // Safe call
            },
            obscureText: widget.isInputPassword,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              icon: widget.icon,
              hintText: widget.hintText,
              labelText: widget.labelText,
              errorText: widget.errorText,
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
