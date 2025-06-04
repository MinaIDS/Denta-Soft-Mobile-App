import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../controllers/AccountController.dart';
import '../../../models/AccountModel.dart';
import '../../../utils/GlobalData.dart';
import '../../../utils/SizesStatic.dart';
import '../../../utils/ToastM.dart';
import '../../../utils/const_info.dart';
import '../../../utils/localization/Localizations.dart';
import '../../../widgets/buttons/accent_button.dart';
import '../../../widgets/custom_drop_down_Button_field.dart';
import '../../../widgets/custom_text_form_field.dart';

class EditProfileInfo extends StatefulWidget {
  const EditProfileInfo({super.key});

  @override
  _EditProfileInfoState createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  final _formKey = GlobalKey<FormState>();
  ObjectData? userData;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _workPhoneController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String? _accountType;
  String? _calendarView;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    userData = GlobalData.accountData!.objectData;

    if (userData != null) {
      _fullNameController.text = userData!.fullName ?? '';
      _emailController.text = userData!.emailAddress ?? '';
      _phoneController.text = userData!.mobile ?? '';
      _workPhoneController.text = userData!.phoneWork ?? '';
      _idController.text = userData!.nationalId ?? '';
      _addressController.text = userData!.address ?? '';
      _codeController.text = userData!.code ?? '';
      _calendarView = userData!.calendarView;
      _accountType = userData!.userRole;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S().Edit_Personal_Info)),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(S().FullName, isRequired: true),
                CustomTextFormField(
                  controller: _fullNameController,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().FullName,
                  validator: (v) {
                    if (v!.trim().isEmpty) {
                      return 'Name is required';
                    } else if (v.length < 3) {
                      return 'Wrong Name';
                    } else {
                      return "";
                    }
                  },
                ),

                SpaceHeight_M,

                _buildTitle(S().AccountType, isRequired: true),
                CustomDropdownButtonField(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().AccountType,
                  value: _accountType,
                  validator: (v) {
                    if (v == null) {
                      return "This field is required";
                    } else {
                      return "";
                    }
                  },
                  onChanged: (v) {
                    _accountType = v as String;
                  },
                  items: accountType
                      .map(
                        (a) => DropdownMenuItem(
                          value: a,
                          child: Text(
                            AppLocalizations.of(context)!.translate(a),
                          ),
                        ),
                      )
                      .toList(),
                ),

                SpaceHeight_M,

                _buildTitle(S().CalendarView, isRequired: true),
                CustomDropdownButtonField(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().CalendarView,
                  value: _calendarView,
                  validator: (v) {
                    if (v == null) {
                      return "This field is required";
                    } else {
                      return "";
                    }
                  },
                  onChanged: (v) {
                    _calendarView = v as String;
                  },
                  items: calendarType
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                ),

                SpaceHeight_M,

                // Email
                _buildTitle(S().Email_Address),
                CustomTextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().Email_Address,
                ),

                SpaceHeight_M,

                // Phone
                _buildTitle(S().PhoneNumber),
                CustomTextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().PhoneNumber,
                ),

                SpaceHeight_M,

                // Work Phone
                _buildTitle(S().WorkPhone),
                CustomTextFormField(
                  controller: _workPhoneController,
                  keyboardType: TextInputType.phone,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().WorkPhone,
                ),

                SpaceHeight_M,

                // Address
                _buildTitle(S().Address),
                CustomTextFormField(
                  controller: _addressController,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().Address,
                ),

                SpaceHeight_M,

                // National id
                _buildTitle(S().NationalID),
                CustomTextFormField(
                  controller: _idController,
                  keyboardType: TextInputType.number,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().NationalID,
                ),

                SpaceHeight_M,

                // Code
                _buildTitle(S().Code),
                CustomTextFormField(
                  controller: _codeController,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().Code,
                ),

                SpaceHeight_L,
                Align(
                  alignment: Alignment.center,
                  child: AccentButton(
                    text: S().Save,
                    busy: _isLoading,
                    onPressed: _saveData,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RichText _buildTitle(String title, {bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black54, fontSize: 16),
        children: [
          TextSpan(text: title),
          if (isRequired) ...[
            TextSpan(text: '  '),
            TextSpan(
              text: '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _saveData() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final response = await AccountController().updateUser(
      address: _addressController.text,
      calendarType: _calendarView,
      code: _codeController.text,
      emailAddress: _emailController.text,
      fullName: _fullNameController.text,
      mobile: _phoneController.text,
      phoneWork: _workPhoneController.text,
      nationalId: _idController.text,
      roleId: _accountType,
    );

    setState(() {
      _isLoading = false;
    });

    if (response) {
      ToastM.showCenter('Data updated successfully');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _idController.dispose();
    _addressController.dispose();
    _codeController.dispose();
    _workPhoneController.dispose();
  }
}
