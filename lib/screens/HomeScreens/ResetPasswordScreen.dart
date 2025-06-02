import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../controllers/AccountController.dart';
import '../../utils/GlobalData.dart';
import '../../utils/SizesStatic.dart';
import '../../utils/ToastM.dart';
import '../ThemeColors.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool isLoading = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userNameController.text = GlobalData.accountData!.objectData.userName!;
  }

  Widget buildBody() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                SpaceHeight_XXXXXL,
                TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: S().UserName, //"User Name",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: ThemeColors.primary,
                    ),
                  ),
                  controller: userNameController,
                  validator: (value) {
                    return value!.isEmpty
                        ? S()
                            .FieldsRequired //"Username is required"
                        : null;
                  },
                ),
                SpaceHeight_M,
                TextFormField(
                  autofocus: false,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: S().Old_Password,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(Icons.vpn_key, color: ThemeColors.primary),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        semanticLabel:
                            _obscureText ? 'show password' : 'hide password',
                      ),
                    ),
                  ),
                  controller: oldPasswordController,
                  validator: (value) {
                    return value!.isEmpty ? "Old password is required" : null;
                  },
                ),
                SpaceHeight_M,
                TextFormField(
                  autofocus: false,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: S().New_Password,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(Icons.vpn_key, color: ThemeColors.primary),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        semanticLabel:
                            _obscureText ? 'show password' : 'hide password',
                      ),
                    ),
                  ),
                  controller: newPasswordController,
                  validator: (value) {
                    return value!.isEmpty ? "New Password is required" : null;
                  },
                ),
                SpaceHeight_M,
                TextFormField(
                  autofocus: false,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: S().Cofirm_Password,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(Icons.vpn_key, color: ThemeColors.primary),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        semanticLabel:
                            _obscureText ? 'show password' : 'hide password',
                      ),
                    ),
                  ),
                  controller: confirmPasswordController,
                  validator: (value) {
                    return value!.isEmpty
                        ? " Confirm Password is required"
                        : value != newPasswordController.text
                        ? "Confirm Password not the same New Password"
                        : null;
                  },
                ),
                SpaceHeight_XL,
                isLoading
                    ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ThemeColors.primary,
                      ),
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          ThemeColors.primary,
                        ),
                      ),
                    )
                    : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            // if (states.contains(MaterialState.pressed))
                            return ThemeColors.primary;
                            // return null; // Use the component's default.
                          },
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        if (_formKey.currentState!.validate()) {
                          bool status = await AccountController().resetPassword(
                            userNameController.text.trim(),
                            oldPasswordController.text.trim(),
                            newPasswordController.text.trim(),
                          );
                          if (status) {
                            ToastM.show(S().Password_Change_Successfully);
                            Navigator.pop(context);
                          } else {
                            ToastM.show(S().Error_Data);
                          }

                          print("Validate");
                        } else {
                          ToastM.show(S().Error_Validation);
                        }
                        isLoading = false;
                        setState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeWidth_L,
                            vertical: SizeHeight_XS,
                          ),
                          child: Text(
                            S().ResetPassword,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 2,
                              fontSize: 16,
                              color: ThemeColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S().ResetPassword)),
      body: buildBody(),
    );
  }
}
