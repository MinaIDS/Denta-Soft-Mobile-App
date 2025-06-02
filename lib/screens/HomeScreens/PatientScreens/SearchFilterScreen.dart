import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../controllers/InsuranceCompanyController.dart';
import '../../../models/InsuranceModel.dart';
import '../../../models/search_model.dart';
import '../../../utils/SizesStatic.dart';
import '../../../widgets/buttons/accent_button.dart';
import '../../../widgets/custom_drop_down_Button_field.dart';
import '../../../widgets/custom_text_form_field.dart';

class SearchFilterScreen extends StatefulWidget {
  final ValueSetter<SearchModel>? onSearch;
  const SearchFilterScreen({this.onSearch});

  @override
  _SearchFilterScreenState createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  List<InsuranceModel> insuranceList = [];
  Future<List<InsuranceModel>>? getInsurance;
  var _nameController;
  var _houseHeadNameController;
  var _mobileController;
  var _houseHeadMobileController;
  var _idController;
  var _codeController;

  var _searchModel;
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _houseHeadNameController = TextEditingController();
    _mobileController = TextEditingController();
    _houseHeadMobileController = TextEditingController();
    _idController = TextEditingController();
    _codeController = TextEditingController();
    _searchModel = SearchModel();

    getInsurance = InsuranceCompanyController().getInsuranceCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 3,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          iconSize: 18,
                          splashRadius: 24,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      CustomTextFormField(
                        controller: _nameController,
                        label: S().Name,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        onSave: (v) {
                          _searchModel.patientName = v;
                        },
                      ),
                      CustomTextFormField(
                        controller: _houseHeadNameController,
                        label: S().HouseHeadName,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        onSave: (v) {
                          _searchModel.houseHeadName = v;
                        },
                      ),
                      CustomTextFormField(
                        controller: _mobileController,
                        label: S().PhoneNumber,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        keyboardType: TextInputType.phone,
                        onSave: (v) {
                          _searchModel.mobile = v;
                        },
                      ),
                      CustomTextFormField(
                        controller: _houseHeadMobileController,
                        label: S().HouseHeadNumber,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        keyboardType: TextInputType.phone,
                        onSave: (v) {
                          _searchModel.houseHeadNumber = v;
                        },
                      ),
                      CustomTextFormField(
                        controller: _idController,
                        label: S().NationalID,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        keyboardType: TextInputType.number,
                        onSave: (v) {
                          _searchModel.nationalId = v;
                        },
                      ),
                      CustomTextFormField(
                        controller: _codeController,
                        label: S().PatientCode,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        onSave: (v) {
                          _searchModel.patientCode = v;
                        },
                      ),
                      FutureBuilder<List<InsuranceModel>>(
                        future: getInsurance,
                        builder:
                            (context, snapshot) =>
                                snapshot.connectionState ==
                                        ConnectionState.waiting
                                    ? Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 13,
                                        horizontal: 20,
                                      ),
                                      margin: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Text(
                                        S().Loading,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0x8e78849e),
                                        ),
                                      ),
                                    )
                                    : CustomDropdownButtonField(
                                      hint: S().MedicalInsuranceName,
                                      value: _searchModel.medicalInsuranceId,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      onChanged: (v) {
                                        setState(() {
                                          _searchModel.medicalInsuranceId = v;
                                        });
                                      },
                                      items:
                                          snapshot.data!
                                              .map(
                                                (i) => DropdownMenuItem(
                                                  child: Text(
                                                    i.medicalCompany!,
                                                  ),
                                                  value: i.medicalInsuranceId,
                                                ),
                                              )
                                              .toList(),
                                    ),
                      ),
                      SwitchListTile(
                        value: _searchModel.isActive,
                        activeColor: Colors.amber[600],
                        title: Text(S().Active),
                        onChanged: (bool value) {
                          //Navigator.pop(context);
                          setState(() {
                            _searchModel.isActive = value;
                          });
                        },
                      ),
                      SpaceHeight_L,
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: AccentButton(
                              text: S().Search,
                              circular: 5,
                              height: 36,
                              fontSize: 16,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                _formKey.currentState!.save();
                                widget.onSearch!(_searchModel);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            flex: 2,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                shadowColor: Colors.red,
                                side: BorderSide(color: Colors.red),
                                textStyle: TextStyle(fontSize: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(S().Clear),
                              onPressed: _onClear,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _onClear() {
    setState(() {
      _searchModel = SearchModel();
    });
    _nameController.clear();
    _houseHeadNameController.clear();
    _mobileController.clear();
    _houseHeadMobileController.clear();
    _idController.clear();
    _codeController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _houseHeadNameController.dispose();
    _mobileController.dispose();
    _houseHeadMobileController.dispose();
    _idController.dispose();
    _codeController.dispose();
  }
}
