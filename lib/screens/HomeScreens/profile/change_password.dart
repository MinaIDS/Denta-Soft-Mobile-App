import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../controllers/AccountController.dart';
import '../../../utils/GlobalData.dart';
import '../../../utils/SizesStatic.dart';
import '../../../widgets/buttons/accent_button.dart';
import '../../../widgets/custom_password_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  String? oldPass;
  String? newPass;
  String? confirmedPass;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S().ChangePassword)),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          primary: false,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/images/reset-pass.png'),
                SpaceHeight_L,
                CustomPasswordTextField(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  label: S().Old_Password,
                  onSave: (v) {
                    oldPass = v;
                  },
                  validator: (v) {
                    if (v!.trim().isEmpty) {
                      return 'Old Password is Empty';
                    } else {
                      return '';
                    }
                  },
                ),
                CustomPasswordTextField(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  label: S().New_Password,
                  onSave: (v) {
                    newPass = v;
                  },
                  validator: (v) {
                    if (v!.trim().isEmpty) {
                      return 'New Password is Empty';
                    } else {
                      return '';
                    }
                  },
                ),
                CustomPasswordTextField(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  label: S().Cofirm_Password,
                  onSave: (v) {
                    confirmedPass = v;
                  },
                  validator: (v) {
                    if (v!.trim().isEmpty) {
                      return 'Confirmed Password is Empty';
                    } else {
                      return '';
                    }
                  },
                ),
                SpaceHeight_XXL,
                AccentButton(
                  text: S().Save,
                  busy: isLoading,
                  onPressed: _changePassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _changePassword() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (newPass != confirmedPass) {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(content: Text(S().Two_passwords_dont_match)),
        );
        return;
      }

      setState(() {
        isLoading = true;
      });

      final result = await AccountController().resetPassword(
        GlobalData.accountData!.objectData.userName!,
        oldPass!,
        newPass!,
      );

      setState(() {
        isLoading = false;
      });

      if (result) {
        Navigator.of(context).pop();
      }
    }
  }
}
