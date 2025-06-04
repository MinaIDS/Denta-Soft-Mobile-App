import 'package:denta_soft/components/rounded_button.dart';
import 'package:denta_soft/components/rounded_input_field.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../controllers/AccountController.dart';
import '../../utils/SizeandStyleUtills.dart';
import '../../utils/SizesStatic.dart';
import '../../utils/ToastM.dart';
import '../../utils/assets_routes.dart';
import '../ThemeColors.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: ThemeColors.appBarIcon,
        title: Text(S().ForgotPasswordPage, style: ThemeColors.appBarStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(SizeHeight_XXS),
                  child: Image.asset(
                    AssetsRoutes.logo,
                    height: SizeandStyleUtills().getProportionalHeight(
                      height: 220,
                    ),
                    width: double.infinity,
                  ),
                ),
                Text(S().Newpasswordwillbesenttoyouremail),
                SpaceHeight_M,
                RoundedInputField(
                  hintText: S().Email,
                  icon: Icons.email_outlined,
                  controller: emailController,
                  validator: (String? value) {
                    return value?.isEmpty ?? true ? "can not be empty" : null;
                  },
                ),
                SpaceHeight_M,
                RoundedButton(
                  text: S().send,
                  busy: isLoading,
                  press: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (_formKey.currentState?.validate() ?? false) {
                      if (await AccountController().forgetPassword(
                        emailController.text.trim(),
                      )) {
                        emailController.clear();
                        ToastM.show(S().newpasswordsenttoyouemailsuccessfully);
                      } else {
                        ToastM.show(S().Error_Data);
                      }
                    } else {
                      // ToastM.show("Error Validation");
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
