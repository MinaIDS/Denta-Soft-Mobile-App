import 'package:denta_soft/controllers/UsersScreenController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/AccountModel.dart';
import '../../../utils/SizesStatic.dart';
import '../../../utils/ToastM.dart';
import '../../../utils/const_info.dart';
import '../../../utils/localization/Localizations.dart';
import '../../../widgets/buttons/accent_button.dart';
import '../../../widgets/custom_drop_down_Button_field.dart';
import '../../../widgets/custom_text_form_field.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  var _formKey = GlobalKey<FormState>();
  ObjectData userData = ObjectData();

  TextEditingController? _fullNameController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;
  TextEditingController? _workPhoneController;
  TextEditingController? _idController;
  TextEditingController? _addressController;
  TextEditingController? _codeController;
  String? _accountType;
  String? _calendarView;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Initialize the controllers
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _workPhoneController = TextEditingController();
    _idController = TextEditingController();
    _addressController = TextEditingController();
    _codeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S().EditUserInfo)),
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
                  controller: _fullNameController!,
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
                  onChanged: (String? v) {
                    _accountType = v;
                  },
                  items:
                      accountType
                          .map(
                            (a) => DropdownMenuItem(
                              child: Text(
                                AppLocalizations.of(context)!.translate(a),
                              ),
                              value: a,
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
                  onChanged: (String? v) {
                    _calendarView = v;
                  },
                  items:
                      calendarType
                          .map(
                            (c) => DropdownMenuItem(child: Text(c), value: c),
                          )
                          .toList(),
                ),
                SpaceHeight_M,
                // Email
                _buildTitle(S().EmailAddress),
                CustomTextFormField(
                  controller: _emailController!,
                  keyboardType: TextInputType.emailAddress,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().EmailAddress,
                ),
                SpaceHeight_M,
                // Phone
                _buildTitle(S().PhoneNumber),
                CustomTextFormField(
                  controller: _phoneController!,
                  keyboardType: TextInputType.phone,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().PhoneNumber,
                ),
                SpaceHeight_M,
                // Work Phone
                _buildTitle(S().WorkPhone),
                CustomTextFormField(
                  controller: _workPhoneController!,
                  keyboardType: TextInputType.phone,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().WorkPhone,
                ),
                SpaceHeight_M,
                // Address
                _buildTitle(S().Address),
                CustomTextFormField(
                  controller: _addressController!,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().Address,
                ),
                SpaceHeight_M,
                // National ID
                _buildTitle(S().NationalID),
                CustomTextFormField(
                  controller: _idController!,
                  keyboardType: TextInputType.number,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().NationalID,
                ),
                SpaceHeight_M,
                // Code
                _buildTitle(S().Code),
                CustomTextFormField(
                  controller: _codeController!,
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
            TextSpan(text: '*', style: TextStyle(color: Colors.red)),
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

    userData.fullName = _fullNameController!.text;
    userData.emailAddress = _emailController!.text;
    userData.mobile = _phoneController!.text;
    userData.phoneWork = _workPhoneController!.text;
    userData.nationalId = _idController!.text;
    userData.address = _addressController!.text;
    userData.code = _codeController!.text;
    userData.calendarView = _calendarView;
    userData.userRole = _accountType;

    final response = await UsersScreenController().updateUserData(
      userID: "",
      userData: userData,
    );
    setState(() {
      _isLoading = false;
    });
    if (response) {
      ToastM.showCenter(S().UserAddedSuccessfully);
      final model = Provider.of<UsersScreenController>(context, listen: false);
      model.searchForUsers(username: "");
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController?.dispose();
    _emailController?.dispose();
    _phoneController?.dispose();
    _idController?.dispose();
    _addressController?.dispose();
    _codeController?.dispose();
    _workPhoneController?.dispose();
  }
}
