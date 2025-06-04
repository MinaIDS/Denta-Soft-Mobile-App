import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/screens/Widget/country_picker.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';

import '../../../../utils/SizesStatic.dart';
import '../../../../utils/const_info.dart';
import '../../../../utils/localization/Localizations.dart';
import '../../../../widgets/custom_drop_down_Button_field.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../Widget/fieldHeader.dart';
import 'add_patient_viewModel.dart';

class PatientDetails extends StatelessWidget {
  final AddPatientViewModel model;
  const PatientDetails(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Form(
          key: model.patientDetailsKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldHeader(S().FullName, isRequired: true),
              CustomTextFormField(
                controller: model.fullName,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().FullName,
                validator: (v) {
                  if (v!.trim().isEmpty) {
                    return 'Name is required';
                  } else if (v.length < 3) {
                    return 'Wrong Name';
                  } else {
                    return '';
                  }
                },
              ),

              SpaceHeight_M,

              // Phone
              FieldHeader(S().PhoneNumber, isRequired: true),
              CustomTextFormField(
                keyboardType: TextInputType.phone,
                controller: model.phoneNumber,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().PhoneNumber,
                prefixIcon: GestureDetector(
                  onTap: () {
                    _showCountaryDialog(context, (v) {
                      model.phoneCode = v.phoneCode;
                      model.setState();
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.keyboard_arrow_down),
                        Text(
                          model.phoneCode,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                validator: (v) {
                  if (v!.trim().isEmpty) {
                    return 'Phone is required';
                  } else {
                    return "";
                  }
                },
              ),

              SpaceHeight_M,

              // CheckboxListTile(
              //   controlAffinity: ListTileControlAffinity.leading,
              //   dense: true,
              //   title: Text('Has medical insurance'),
              //   contentPadding: EdgeInsets.zero,
              //   value: model.hasMedical,
              //   onChanged: (v) {
              //     model.hasMedical = v;
              //     model.setState();
              //   },
              // ),

              // if (model.hasMedical) ...[
              //   SizedBox(height: 10),
              // Insurance Company
              FieldHeader(S().MedicalInsuranceName),
              CustomDropdownButtonField(
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().MedicalInsuranceName,
                value: model.selectedInsurance,
                onChanged: (dynamic v) {
                  model.selectedInsurance = v;
                  // Call setState if necessary to trigger a UI update
                  // Example: setState(() {});
                },
                validator: (v) {
                  if (v == null) {
                    return 'Insurance Company is required';
                  }
                  return null; // Return null to indicate the field is valid
                },
                items: model.insuranceCompanies
                    .map(
                      (c) => DropdownMenuItem(
                        value: c,
                        child: Text(
                          c.medicalCompany ?? 'Unknown Insurance',
                        ), // Make sure `c` matches the type of `model.selectedInsurance`
                      ),
                    )
                    .toList(),
              ),

              SpaceHeight_M,

              FieldHeader(S().MedicalInsuranceNo),
              CustomTextFormField(
                controller: model.insuranceNo,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().MedicalInsuranceNo,
              ),
              // ],
              SpaceHeight_M,

              // Date Of Birth
              FieldHeader(S().DateOfBirth),
              CustomTextFormField(
                controller: model.dateOfBirth,
                keyboardType: TextInputType.number,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().DateOfBirth,
                suffixIcon: Icon(Icons.date_range),
                readOnly: true,
                onTap: () => model.selectDate(context),
              ),

              SpaceHeight_M,

              // National id
              FieldHeader(S().NationalID),
              CustomTextFormField(
                controller: model.nationalId,
                keyboardType: TextInputType.number,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().NationalID,
              ),

              SpaceHeight_M,

              FieldHeader(S().Gender),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: RadioListTile(
                        title: Text(S().Male),
                        value: "Male",
                        dense: true,
                        groupValue: model.gender,
                        onChanged: (String? v) {
                          model.gender = v ?? '';
                          model.setState();
                        },
                      ),
                    ),
                    Flexible(
                      child: RadioListTile(
                        title: Text(S().Female),
                        dense: true,
                        value: 'Female',
                        groupValue: model.gender,
                        onChanged: (String? v) {
                          model.gender = v ?? '';
                          model.setState();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SpaceHeight_M,

              // Marital Status
              FieldHeader(S().MaritalStatus),
              CustomDropdownButtonField(
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().MaritalStatus,
                onChanged: (v) {
                  model.maritalStatus = v as String;
                },
                items: materialStatus
                    .map(
                      (s) => DropdownMenuItem(
                        value: s,
                        child: Text(AppLocalizations.of(context)!.translate(s)),
                      ),
                    )
                    .toList(),
              ),

              SpaceHeight_M,

              // Email
              FieldHeader(S().Email_Address),
              CustomTextFormField(
                controller: model.email,
                keyboardType: TextInputType.emailAddress,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().Email_Address,
              ),

              SpaceHeight_M,

              // Title
              FieldHeader(S().Title),
              CustomDropdownButtonField(
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().Title,
                onChanged: (v) {
                  model.title = v as String;
                },
                items: title
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(AppLocalizations.of(context)!.translate(t)),
                      ),
                    )
                    .toList(),
              ),

              SpaceHeight_M,

              // Occupation
              FieldHeader(S().Occupation),
              CustomTextFormField(
                controller: model.occupation,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().Occupation,
              ),

              SpaceHeight_M,

              // Patient Code
              FieldHeader(S().PatientCode),
              CustomTextFormField(
                controller: model.patientCode,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().PatientCode,
              ),

              SpaceHeight_M,

              // Comment
              FieldHeader(S().Comment),
              CustomTextFormField(
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().Comment,
                lines: 3,
                controller: model.comment,
              ),

              SpaceHeight_M,

              // Patient Type
              FieldHeader(S().PatientType),
              CustomDropdownButtonField(
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().PatientType,
                onChanged: (v) {
                  model.patientType = v as String;
                },
                items: patientType
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(AppLocalizations.of(context)!.translate(t)),
                      ),
                    )
                    .toList(),
              ),

              SpaceHeight_M,

              // Phone Work
              FieldHeader(S().PhoneWork),
              CustomTextFormField(
                controller: model.phoneWork,
                margin: EdgeInsets.symmetric(vertical: 10),
                keyboardType: TextInputType.phone,
                prefixIcon: GestureDetector(
                  onTap: () {
                    _showCountaryDialog(context, (v) {
                      model.phoneWorkCode = v.phoneCode;
                      model.setState();
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.keyboard_arrow_down),
                        Text(
                          model.phoneWorkCode,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                hint: S().PhoneWork,
              ),

              SpaceHeight_M,
              // House Head Name
              FieldHeader(S().HouseHeadName),
              CustomTextFormField(
                controller: model.houseHeadName,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().HouseHeadName,
              ),

              SpaceHeight_M,

              // House Head Phone No.
              FieldHeader(S().HouseHeadNumber),
              CustomTextFormField(
                margin: EdgeInsets.symmetric(vertical: 10),
                keyboardType: TextInputType.phone,
                hint: S().HouseHeadNumber,
                controller: model.houseHeadPhone,
                prefixIcon: GestureDetector(
                  onTap: () {
                    _showCountaryDialog(context, (v) {
                      model.houseHeadPhoneCode = v.phoneCode;
                      model.setState();
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.keyboard_arrow_down),
                        Text(
                          model.houseHeadPhoneCode,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SpaceHeight_M,

              // House Head Phone No.
              FieldHeader(S().Address),
              CustomTextFormField(
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().Address,
                controller: model.address,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showCountaryDialog(BuildContext context, void Function(Country) onChanged) {
    showDialog(
      context: context,
      builder: (context) => CountryPicker(onValuePicked: onChanged),
    );
  }
}
