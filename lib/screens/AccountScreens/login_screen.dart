// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:denta_soft/components/or_divider.dart';
import 'package:denta_soft/components/rounded_button.dart';
import 'package:denta_soft/components/rounded_input_field.dart';
import 'package:denta_soft/components/rounded_password_field.dart';
import 'package:denta_soft/components/social_icon.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/screens/home_index.dart';

import '../../controllers/AccountController.dart';
import '../../utils/GoTo.dart';
import '../../utils/SizeandStyleUtills.dart';
import '../../utils/SizesStatic.dart';
import '../../utils/ToastM.dart';
import '../../utils/assets_routes.dart';
import '../ThemeColors.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController clinicNameController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final bool _obscureText = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    clinicNameController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsRoutes.logo,
                  height: SizeandStyleUtills().getProportionalHeight(
                    height: 200,
                  ),
                  width: double.infinity,
                ),
                RoundedInputField(
                  icon: Icons.shield_outlined,
                  hintText: S().ClinicName,
                  controller: clinicNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Clinic name is required";
                    }
                    return null;
                  },
                ),
                SpaceHeight_M,
                RoundedInputField(
                  hintText: S().UserName,
                  icon: Icons.account_circle_outlined,
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                ),
                SpaceHeight_M,
                RoundedPasswordField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                SpaceHeight_M,
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: InkWell(
                    onTap: () {
                      GoTo.screen(context, ForgetPasswordScreen());
                    },
                    child: Text(
                      S().ForgetPassword,
                      style: TextStyle(
                        color: ThemeColors.grey,
                        fontWeight: FontWeight.normal,
                        height: 2,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SpaceHeight_M,
                RoundedButton(
                  text: S().Login,
                  busy: isLoading,
                  press: () async {
                    setState(() {
                      isLoading = true;
                    });
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_formKey.currentState?.validate() ?? false) {
                      final result = await AccountController().login(
                        clinicNameController.text.trim(),
                        usernameController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (result) {
                        GoTo.screenAndRemoveUntil(context, HomeIndex());
                      } else {
                        ToastM.showCenter("Error Data");
                      }
                    } else {
                      ToastM.showCenter("Error Validation");
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                SpaceHeight_L,
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: AssetsRoutes.facebook,
                      press: () {
                        const url = 'https://www.facebook.com/pentacors';
                        launchUrl(url);
                      },
                    ),
                    SocalIcon(
                      iconSrc: AssetsRoutes.instagram,
                      press: () {
                        const url = 'https://www.instagram.com/pentacors';
                        launchUrl(url);
                      },
                    ),
                    SocalIcon(
                      iconSrc: AssetsRoutes.whatsApp,
                      press: () {
                        const url = 'https://wa.me/+201208950563';
                        launchUrl(url);
                      },
                    ),
                    SocalIcon(
                      iconSrc: AssetsRoutes.phone,
                      press: () {
                        const url = 'tel:+201208950563';
                        launchUrl(url);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ToastM.showCenter(S().Couldnotlaunch);
    }
  }

  @override
  void dispose() {
    super.dispose();
    clinicNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
