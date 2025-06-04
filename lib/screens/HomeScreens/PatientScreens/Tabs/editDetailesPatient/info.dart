import 'dart:convert';

import 'package:denta_soft/components/rounded_button.dart';
import 'package:denta_soft/controllers/PatientController.dart';
import 'package:denta_soft/models/PatientModel.dart';
import 'package:denta_soft/screens/Widget/fieldHeader.dart';
import 'package:denta_soft/utils/GlobalData.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:denta_soft/utils/SizesStatic.dart';
import 'package:denta_soft/utils/const_info.dart';
import 'package:denta_soft/utils/localization/Localizations.dart';
import 'package:denta_soft/widgets/OnceFutureBuilder.dart';
import 'package:denta_soft/widgets/custom_drop_down_Button_field.dart';
import 'package:denta_soft/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:denta_soft/generated/l10n.dart' as S;

class Info extends StatefulWidget {
  final PatientModel? patientModel;

  const Info({super.key, this.patientModel});

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  bool isReadOnly = false;

  TextEditingController fullNameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController DOB = TextEditingController();
  TextEditingController MaritalStatus = TextEditingController();
  TextEditingController MaritalStatusKey = TextEditingController();
  TextEditingController Occupation = TextEditingController();
  TextEditingController Title = TextEditingController();
  TextEditingController PatientType = TextEditingController();
  TextEditingController PatientTypeKey = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController nationailityId = TextEditingController();
  TextEditingController Gender = TextEditingController();
  TextEditingController GenderKey = TextEditingController();
  TextEditingController PatientCode = TextEditingController();
  TextEditingController phoneWork = TextEditingController();
  TextEditingController houseHeadNumber = TextEditingController();
  TextEditingController comments = TextEditingController();

  bool isLoading = false;

  // Map<String, dynamic> MaritalStatusValue =PatientController()
  //     .filterMaritalStatusTabs[0] ;
  @override
  void initState() {
    super.initState();
    fullNameC.text = widget.patientModel!.patientName!;
    phoneC.text = widget.patientModel!.mobile!;
    DOB.text = widget.patientModel!.dateOfBirth == null
        ? DateTime.now().toString()
        : widget.patientModel!.dateOfBirth.toString();
    age.text = widget.patientModel!.age.toString();
    MaritalStatusKey.text = widget.patientModel!.maritalStatus!;
    MaritalStatus.text = widget.patientModel!.maritalStatus == "MS1"
        ? S.S().MS1
        : widget.patientModel!.maritalStatus == "MS2"
        ? S.S().MS2
        : widget.patientModel!.maritalStatus == "MS3"
        ? S.S().MS3
        : widget.patientModel!.maritalStatus == "MS4"
        ? S.S().MS4
        : "";
    Occupation.text = widget.patientModel!.occupation!;
    Title.text = widget.patientModel!.title!;
    PatientTypeKey.text = widget.patientModel!.patientType!;

    PatientType.text = widget.patientModel!.patientType == "PT1"
        ? S.S().PT1
        : widget.patientModel!.patientType == "PT2"
        ? S.S().PT2
        : widget.patientModel!.patientType == "PT3"
        ? S.S().PT3
        : "";
    Address.text = widget.patientModel!.address;
    Email.text = widget.patientModel!.email!;
    nationailityId.text = widget.patientModel!.nationailityId!;
    GenderKey.text = widget.patientModel!.gender!;
    Gender.text = widget.patientModel!.gender == "Male"
        ? S.S().Male
        : widget.patientModel!.gender == "Female"
        ? S.S().Female
        : "";
    PatientCode.text = widget.patientModel!.patientCode!;
    phoneWork.text = widget.patientModel!.phoneWork;
    houseHeadNumber.text = widget.patientModel!.houseHeadNumber;
    comments.text = widget.patientModel!.comments;
  }

  Widget patientDetailsBody() {
    // final model = Provider.of<PatientController>(context, listen: true);
    return ListView(
      children: [
        ChangeNotifierProvider.value(
          value: PatientController(),
          child: Consumer<PatientController>(
            builder: (context, model, child) => RefreshIndicator(
              onRefresh: () async {
                await model.getPatientDetails(
                  patientId: widget.patientModel!.patientId,
                );
              },
              child: OnceFutureBuilder<PatientModel>(
                future: () => model.getPatientDetails(
                  patientId: widget.patientModel!.patientId,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return SizedBox(
                      height: SizeandStyleUtills().screenHeight,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          width: SizeandStyleUtills().getProportionalWidth(
                            width: 500,
                          ),
                          // height: SizeandStyleUtills().getProportionalHeight(height: 450),
                          margin: EdgeInsets.symmetric(
                            vertical: SizeHeight_M,
                            horizontal: SizeWidth_M,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: SizeHeight_M,
                            horizontal: SizeWidth_M,
                          ),
                          // decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(20.0)),
                          //     boxShadow: [
                          //       BoxShadow(
                          //           color: Colors.black12, blurRadius: 2.0)
                          //     ]),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //   width: SizeandStyleUtills()
                                //       .getProportionalWidth(width: 150),
                                //   height: SizeandStyleUtills()
                                //       .getProportionalHeight(height: 100),
                                //   child: CircleAvatar(
                                //     // backgroundColor: Colors.transparent,
                                //     child: !snapshot.data.photoJson.isEmpty
                                //         ? Image.network(
                                //             ApiRoutes.patientImagePath +
                                //                 GlobalData
                                //                     .patientData.photoJson,
                                //           )
                                //         : Icon(Icons.account_box_rounded),
                                //   ),
                                // ),
                                // Divider(
                                //   color: Color(0xffB7B7B7),
                                // ),
                                FieldHeader(S.S().FullName),
                                CustomTextFormField(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  controller: fullNameC,
                                  hint: S.S().FullName,
                                  readOnly: isReadOnly,
                                ),
                                SpaceHeight_L,
                                FieldHeader(S.S().Mobile),
                                CustomTextFormField(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  keyboardType: TextInputType.number,
                                  controller: phoneC,
                                  hint: S.S().Mobile,
                                  readOnly: isReadOnly,
                                ),

                                SpaceHeight_L,

                                // TextFormField(
                                //   keyboardType: TextInputType.number,
                                //   controller: age,
                                //   decoration: InputDecoration(
                                //       border: OutlineInputBorder(),
                                //       fillColor: Colors.grey,
                                //       labelText: "Age",
                                //       focusColor: Colors.grey),
                                //   readOnly: isReadOnly,
                                // ),
                                //
                                // SpaceHeight_XXS,
                                // Divider(
                                //   color: Color(0xffB7B7B7),
                                // ),
                                //
                                FieldHeader(S.S().DateOfBirth),
                                CustomTextFormField(
                                  hint: S.S().DateOfBirth,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  onTap: () async {
                                    print('DOB ');
                                    DateTime? selectedDate =
                                        await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.parse(DOB.text),
                                          firstDate: DateTime(1940, 1),
                                          lastDate: DateTime(2101),
                                        );
                                    // setState(() {
                                    //   fromDate = selectedDate.toString();
                                    // });
                                    DOB.text = selectedDate.toString();
                                  },
                                  // keyboardType: TextInputType.number,
                                  controller: DOB,
                                  readOnly: true,
                                ),

                                SpaceHeight_XXS,
                                FieldHeader(S.S().MaritalStatus),
                                CustomDropdownButtonField(
                                  value: model.maritalStatusValue,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  hint: S.S().MaritalStatus,
                                  onChanged: (v) {
                                    model.maritalStatusValue =
                                        v as Map<String, dynamic>?;
                                  },
                                  items: materialStatus
                                      .map(
                                        (s) => DropdownMenuItem(
                                          value: s,
                                          child: Text(
                                            AppLocalizations.of(
                                              context,
                                            )!.translate(s),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),

                                Row(
                                  children: [
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Container(
                                        child: DropdownButton<Map<String, dynamic>>(
                                          items: model.filterMaritalStatusTabs.map((
                                            Map<String, dynamic> value,
                                          ) {
                                            return DropdownMenuItem<
                                              Map<String, dynamic>
                                            >(
                                              value: value,
                                              child: Text(value['title']),
                                              // child: Text(MaritalStatus.text,style: TextStyle(color: Colors.black),),
                                            );
                                          }).toList(),
                                          value: model.maritalStatusValue,
                                          style: TextStyle(color: Colors.black),
                                          underline: SizedBox(),
                                          isExpanded: true,
                                          hint: Text(
                                            S.S().MaritalStatus,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            // MaritalStatusValue = value;
                                            // print('ee ${MaritalStatusValue}');
                                            model.updateMaritalStatus(value!);
                                            MaritalStatusKey.text =
                                                value['maritalStatus'];
                                            MaritalStatus.text =
                                                MaritalStatusKey.text == "MS1"
                                                ? S.S().MS1
                                                : MaritalStatusKey.text == "MS2"
                                                ? S.S().MS2
                                                : MaritalStatusKey.text == "MS3"
                                                ? S.S().MS3
                                                : MaritalStatusKey.text == "MS4"
                                                ? S.S().MS4
                                                : "";
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SpaceHeight_L,
                                FieldHeader(S.S().Occupation),
                                CustomTextFormField(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  controller: Occupation,
                                  hint: S.S().Occupation,
                                  readOnly: isReadOnly,
                                ),
                                SpaceHeight_L,

                                FieldHeader(S.S().Title),
                                CustomTextFormField(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  controller: Title,
                                  hint: S.S().Title,
                                  readOnly: isReadOnly,
                                ),
                                SpaceHeight_L,

                                Row(
                                  children: [
                                    // Expanded(
                                    //   child: TextFormField(
                                    //     controller: PatientType,
                                    //     decoration: InputDecoration(
                                    //         border: OutlineInputBorder(),
                                    //         fillColor: Colors.grey,
                                    //         labelText: "Patient Type",
                                    //         focusColor: Colors.grey),
                                    //     readOnly: true,
                                    //   ),
                                    // ),
                                    Expanded(
                                      child: Container(
                                        child:
                                            DropdownButton<
                                              Map<String, dynamic>
                                            >(
                                              items: model.filterPatientTypeTabs
                                                  .map((
                                                    Map<String, dynamic> value,
                                                  ) {
                                                    return DropdownMenuItem<
                                                      Map<String, dynamic>
                                                    >(
                                                      value: value,
                                                      child: Text(
                                                        value['title'],
                                                      ),
                                                    );
                                                  })
                                                  .toList(),
                                              value: model.patientType,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                              underline: SizedBox(),
                                              isExpanded: true,
                                              hint: Text(
                                                S.S().PatientType,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              onChanged: (value) {
                                                model.updatePatientType(value!);
                                                PatientTypeKey.text =
                                                    value['patientType'];
                                                PatientType.text =
                                                    PatientTypeKey.text == "PT1"
                                                    ? S.S().PT1
                                                    : PatientTypeKey.text ==
                                                          "PT2"
                                                    ? S.S().PT2
                                                    : PatientTypeKey.text ==
                                                          "PT3"
                                                    ? S.S().PT3
                                                    : "";
                                              },
                                            ),
                                      ),
                                    ),
                                  ],
                                ),

                                SpaceHeight_L,
                                FieldHeader(S.S().Address),
                                CustomTextFormField(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  controller: Address,
                                  hint: S.S().Address,
                                  readOnly: isReadOnly,
                                ),
                                SpaceHeight_L,
                                FieldHeader(S.S().Email),
                                CustomTextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  controller: Email,
                                  hint: S.S().Email,
                                  readOnly: isReadOnly,
                                ),
                                SpaceHeight_L,
                                FieldHeader(S.S().NationalID),
                                CustomTextFormField(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  keyboardType: TextInputType.number,
                                  controller: nationailityId,
                                  hint: S.S().NationalID,
                                  readOnly: isReadOnly,
                                ),

                                SpaceHeight_L,
                                Row(
                                  children: [
                                    // Expanded(
                                    //   child: TextFormField(
                                    //     controller: Gender,
                                    //     decoration: InputDecoration(
                                    //         border: OutlineInputBorder(),
                                    //         fillColor: Colors.grey,
                                    //         labelText: "Gender",
                                    //         focusColor: Colors.grey),
                                    //     readOnly: true,
                                    //   ),
                                    // ),
                                    Expanded(
                                      child: Container(
                                        child:
                                            DropdownButton<
                                              Map<String, dynamic>
                                            >(
                                              items: model.filterGenderTypeTabs
                                                  .map((
                                                    Map<String, dynamic> value,
                                                  ) {
                                                    return DropdownMenuItem<
                                                      Map<String, dynamic>
                                                    >(
                                                      value: value,
                                                      child: Text(
                                                        value['title'],
                                                      ),
                                                    );
                                                  })
                                                  .toList(),
                                              value: model.gender,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                              underline: SizedBox(),
                                              isExpanded: true,
                                              hint: Text(
                                                'Gender',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              onChanged: (value) {
                                                model.updateGender(value!);
                                                GenderKey.text =
                                                    value['Gender'];
                                                Gender.text =
                                                    GenderKey.text == "Male"
                                                    ? S.S().Male
                                                    : GenderKey.text == "Female"
                                                    ? S.S().Female
                                                    : "";
                                              },
                                            ),
                                      ),
                                    ),
                                  ],
                                ),

                                SpaceHeight_L,
                                FieldHeader(S.S().PhoneWork),
                                CustomTextFormField(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  controller: phoneWork,
                                  hint: S.S().PhoneWork,
                                  readOnly: isReadOnly,
                                ),

                                SpaceHeight_L,
                                FieldHeader(S.S().HouseHeadNumber),
                                CustomTextFormField(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  controller: houseHeadNumber,
                                  hint: S.S().HouseHeadNumber,
                                  readOnly: isReadOnly,
                                ),

                                SpaceHeight_L,
                                FieldHeader(S.S().Comments),
                                CustomTextFormField(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  controller: comments,
                                  hint: S.S().Comments,
                                  readOnly: isReadOnly,
                                ),

                                SpaceHeight_L,
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    // "patientName": fullNameC.text,
                                    // "mobile": phoneC.text,
                                    // "age": int.parse(age.text),
                                    // "maritalStatus": MaritalStatusKey.text,
                                    // "occupation": Occupation.text,
                                    // "title": Title.text,
                                    // "patientType": PatientTypeKey.text,
                                    // "address": Address.text,
                                    // "email": Email.text,
                                    // "nationalId": nationailityId.text,
                                    // "gender": GenderKey.text,
                                    // "patientCode": PatientCode.text,
                                    // "phoneWork": phoneWork.text,
                                    // "houseHeadNumber": houseHeadNumber.text,
                                    // "comments": comments.text,

                                    var body = jsonEncode({
                                      "patientId":
                                          widget.patientModel!.patientId,
                                      "clinicId": GlobalData
                                          .accountData!
                                          .objectData
                                          .clinicId,
                                      "updateUserId": GlobalData
                                          .accountData!
                                          .objectData
                                          .updateUserId,
                                      "branchId": GlobalData
                                          .accountData!
                                          .objectData
                                          .branchId,
                                      "patientName": fullNameC.text,
                                      // "age": int.parse(age.text),
                                      // "patientCode": PatientCode.text,
                                      "title": Title.text,
                                      "maritalStatus": MaritalStatusKey.text,
                                      "gender": GenderKey.text,
                                      "occupation": Occupation.text,
                                      "email": Email.text,
                                      "nationalId": int.parse(
                                        nationailityId.text,
                                      ),
                                      "phoneWork": phoneWork.text,
                                      "houseHeadNumber": houseHeadNumber.text,
                                      "createUserId": GlobalData
                                          .accountData!
                                          .objectData
                                          .userId,
                                      "comments": comments.text,
                                      "employer": widget.patientModel!.employer,
                                      "patientType": PatientTypeKey.text,
                                      "dateOfBirth": DOB.text,
                                      "photoJson":
                                          widget.patientModel!.photoJson,
                                      "mobile": phoneC.text,
                                      "medicalInsuranceComments": "",
                                      "MedicalInsuranceNumber": widget
                                          .patientModel!
                                          .medicalInsuranceNo,
                                      "medicalInsuranceId": widget
                                          .patientModel!
                                          .medicalInsuranceId,
                                      "houseHolderName":
                                          widget.patientModel!.houseHolderName,
                                      "address": Address.text,
                                      "nationailityId": int.parse(
                                        nationailityId.text,
                                      ),
                                      "faxNumber": "",
                                      "payments": widget.patientModel!.payments,
                                      "productViewModels": widget
                                          .patientModel!
                                          .productViewModels,
                                      "dieases": widget.patientModel!.dieases,
                                    });

                                    print("editProfile request body::$body");

                                    print(fullNameC.text);
                                    await PatientController().editProfile(
                                      context,
                                      body,
                                    );
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: RoundedButton(
                                    text: S.S().Edit,
                                    busy: isLoading,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
        // InkWell(
        //   onTap: () {
        //     isReadOnly = !isReadOnly;
        //     setState(() {});
        //   },
        //   child: Container(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Container(
        //           width: SizeandStyleUtills().getProportionalWidth(width: 150),
        //           height:
        //               SizeandStyleUtills().getProportionalHeight(height: 50),
        //           decoration: BoxDecoration(
        //               color: Colors.blue,
        //               borderRadius: BorderRadius.all(Radius.circular(25))),
        //           child: Center(
        //             child: Text(
        //               isReadOnly ? "Edit" : "Sava",
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         SpaceWidth_L,
        //         // InkWell(
        //         //   onTap: () {
        //         //     print("delete");
        //         //   },
        //         //   child: Container(
        //         //     width:
        //         //         SizeandStyleUtills().getProportionalWidth(width: 150),
        //         //     height:
        //         //         SizeandStyleUtills().getProportionalHeight(height: 50),
        //         //     decoration: BoxDecoration(
        //         //         border: Border.all(color: Colors.red),
        //         //         borderRadius: BorderRadius.all(Radius.circular(25))),
        //         //     child: Center(
        //         //       child: Text(
        //         //         "Delete",
        //         //         style: TextStyle(color: Colors.red),
        //         //       ),
        //         //     ),
        //         //   ),
        //         // ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: patientDetailsBody());
  }
}
