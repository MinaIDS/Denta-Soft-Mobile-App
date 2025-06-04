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

// ignore: must_be_immutable
class EditUserProfileInfo extends StatefulWidget {
  ObjectData userData; // Removed final here

  EditUserProfileInfo({
    super.key,
    required this.userData,
  }); // Required parameter for constructor

  @override
  _EditUserProfileInfoState createState() => _EditUserProfileInfoState();
}

class _EditUserProfileInfoState extends State<EditUserProfileInfo> {
  final _formKey = GlobalKey<FormState>();
  late ObjectData userData;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _workPhoneController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String _accountType = '';
  String _calendarView = '';

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    userData = widget.userData;

    _fullNameController.text = userData.fullName ?? '';
    _emailController.text = userData.emailAddress ?? '';
    _phoneController.text = userData.mobile ?? '';
    _workPhoneController.text = userData.phoneWork ?? '';
    _idController.text = userData.nationalId ?? '';
    _addressController.text = userData.address ?? '';
    _codeController.text = userData.code ?? '';
    _calendarView = userData.calendarView ?? '';
    _accountType = userData.userRole ?? '';
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
                  onChanged: (String? v) {
                    _accountType = v!;
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
                  onChanged: (String? v) {
                    _calendarView = v!;
                  },
                  items: calendarType
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                ),
                SpaceHeight_M,
                _buildTitle(S().EmailAddress),
                CustomTextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().EmailAddress,
                ),
                SpaceHeight_M,
                _buildTitle(S().PhoneNumber),
                CustomTextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().PhoneNumber,
                ),
                SpaceHeight_M,
                _buildTitle(S().WorkPhone),
                CustomTextFormField(
                  controller: _workPhoneController,
                  keyboardType: TextInputType.phone,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().WorkPhone,
                ),
                SpaceHeight_M,
                _buildTitle(S().Address),
                CustomTextFormField(
                  controller: _addressController,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().Address,
                ),
                SpaceHeight_M,
                _buildTitle(S().NationalID),
                CustomTextFormField(
                  controller: _idController,
                  keyboardType: TextInputType.number,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  hint: S().NationalID,
                ),
                SpaceHeight_M,
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

    // Update the mutable userData
    widget.userData.fullName = _fullNameController.text;
    widget.userData.emailAddress = _emailController.text;
    widget.userData.mobile = _phoneController.text;
    widget.userData.phoneWork = _workPhoneController.text;
    widget.userData.nationalId = _idController.text;
    widget.userData.address = _addressController.text;
    widget.userData.code = _codeController.text;
    widget.userData.calendarView = _calendarView;
    widget.userData.userRole = _accountType;

    final response = await UsersScreenController().updateUserData(
      userID: widget.userData.userId!,
      userData: widget.userData,
    );
    setState(() {
      _isLoading = false;
    });

    if (response) {
      ToastM.showCenter(S().Dataupdatedsuccessfully);
      final model = Provider.of<UsersScreenController>(context, listen: false);
      model.searchForUsers(username: "");
      final newImageData = model.usersList.firstWhere(
        (element) => element.userId == widget.userData.userId,
      );
      setState(() {
        widget.userData = newImageData; // Update widget with new user data
      });
      Navigator.of(context).pop();
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
