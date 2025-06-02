import 'package:denta_soft/controllers/PatientController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/utils/GlobalData.dart';
import 'package:denta_soft/widgets/buttons/text_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/DiseaseController.dart';
import '../../../../controllers/InsuranceCompanyController.dart';
import '../../../../models/DiseaseModel.dart';
import '../../../../models/InsuranceModel.dart';
import '../../../../models/SearchProductModel.dart';
import '../../../Widget/shared/base_notifier.dart';

class AddPatientViewModel extends BaseNotifier {
  var pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List<InsuranceModel> insuranceCompanies = [];
  bool isLoading = false;

  // patient Details
  var patientDetailsKey = GlobalKey<FormState>();
  var gender = "Male";
  var fullName = TextEditingController();
  var phoneNumber = TextEditingController();
  var phoneCode = '20';
  InsuranceModel? selectedInsurance;
  var insuranceNo = TextEditingController();
  var dateOfBirth = TextEditingController();
  var nationalId = TextEditingController();
  String? maritalStatus;
  var email = TextEditingController();
  String? title;
  var occupation = TextEditingController();
  var patientCode = TextEditingController();
  var comment = TextEditingController();
  String? patientType;
  var phoneWork = TextEditingController();
  var phoneWorkCode = '20';
  var houseHeadName = TextEditingController();
  var houseHeadPhone = TextEditingController();
  var houseHeadPhoneCode = '20';
  var address = TextEditingController();

  // Patient Medical History
  List<DiseaseModel> diseasesList = [];
  List<SearchProductModel> drugsList = [];
  List<PatientDisease> addedDisease = [PatientDisease()];

  var medicalHistoryKey = GlobalKey<FormState>();

  void changePage(int page) {
    currentPage = page;
    setState();
  }

  Future<void> getMedicalInsurances() async {
    final companies =
        await InsuranceCompanyController().getInsuranceCompanies();
    insuranceCompanies = companies;
    selectedInsurance = insuranceCompanies.firstWhere(
      (i) => i.isDefault ?? false,
    );
    setState();
  }

  Future<void> getDieasesList() async {
    final disease = await DiseaseController().getDiseases();
    diseasesList = disease;
    setState();
  }

  void selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
      firstDate: DateTime(1900),
    );
    if (selectedDate != null) {
      dateOfBirth.text = DateFormat('MM/dd/yyyy').format(selectedDate);
    }
  }

  Future<void> addPatient(BuildContext context) async {
    if (!medicalHistoryKey.currentState!.validate()) {
      return;
    }
    isLoading = true;
    setState();

    final result = await PatientController().addPatient({
      "patientId": null,
      "clinicId": GlobalData.accountData!.objectData.clinicId,
      "updateUserId": GlobalData.accountData!.objectData.updateUserId,
      "branchId": GlobalData.accountData!.objectData.branchId,
      "patientName": fullName.text,
      "patientCode": null,
      "title": title,
      "maritalStatus": maritalStatus,
      "gender": gender,
      "occupation": occupation.text,
      "email": email.text,
      "houseHeadNumber":
          houseHeadPhone.text.isEmpty ?? true
              ? null
              : houseHeadPhoneCode + houseHeadPhone.text,
      "createUserId": GlobalData.accountData!.objectData.userId,
      "comments": comment.text,
      "employer": null,
      "patientType": patientType,
      "dateOfBirth": dateOfBirth.text,
      "photoJson": null,
      "nationalId": nationalId.text,
      "mobile":
          phoneNumber.text.isEmpty ?? true
              ? null
              : phoneCode + phoneNumber.text,
      "medicalInsuranceComments": "",
      "MedicalInsuranceNumber": insuranceNo.text,
      "medicalInsuranceId": selectedInsurance?.medicalInsuranceId,
      "houseHolderName": houseHeadName.text,
      "address": address.text,
      "phoneWork":
          phoneWork.text.isEmpty ?? true
              ? null
              : phoneWorkCode + phoneWork.text,
      "nationailityId": 16,
      "faxNumber": "",
      "payments": [],
      "productViewModels":
          drugsList
              .map(
                (d) => {
                  "productEn": null,
                  "productAr": null,
                  "productId": d.productId,
                  "patientId": null,
                  "pDieseasId": null,
                },
              )
              .toList(),
      "dieases":
          addedDisease
              .map(
                (d) => {
                  "diseaseTypeId": d.diseaseId,
                  "comments": d.comment.text,
                  "updateUserId":
                      GlobalData.accountData!.objectData.updateUserId,
                  "createUserId":
                      GlobalData.accountData!.objectData.currentUserId,
                },
              )
              .toList(),
    });
    isLoading = false;
    setState();
    if (result) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (ctx) => AlertDialog(
              title: Text(S().Patientaddedsuccessfully),
              titleTextStyle: TextStyle(color: Colors.green, fontSize: 16),
              actions: [
                CustomTextButton(
                  text: 'Ok',
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
      ).then((_) => Navigator.of(context).pop());
    } else {
      await showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: Text(S().Sometingwronghappend),
              titleTextStyle: TextStyle(color: Colors.red, fontSize: 16),
              actions: [
                CustomTextButton(
                  text: S().Ok,
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
      );
    }
  }

  @override
  void dispose() {
    fullName.dispose();
    phoneNumber.dispose();
    insuranceNo.dispose();
    nationalId.dispose();
    email.dispose();
    occupation.dispose();
    patientCode.dispose();
    comment.dispose();
    phoneWork.dispose();
    houseHeadName.dispose();
    houseHeadPhone.dispose();
    address.dispose();
    addedDisease.forEach((d) {
      d.comment.dispose();
    });
    super.dispose();
  }
}

class PatientDisease {
  int? diseaseId;
  var comment = TextEditingController();
}
