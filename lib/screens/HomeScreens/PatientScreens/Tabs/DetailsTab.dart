import 'package:denta_soft/generated/l10n.dart' as S;
import 'package:denta_soft/screens/HomeScreens/PatientScreens/Tabs/editDetailesPatient/editDetailes.dart';
import 'package:denta_soft/utils/GoTo.dart';
import 'package:flutter/material.dart';

import '../../../../controllers/PatientController.dart';
import '../../../../models/PatientModel.dart';
import '../../../../utils/GlobalData.dart';
import '../../../../utils/SizeandStyleUtills.dart';
import '../../../../utils/SizesStatic.dart';
import '../../../../utils/api_routes.dart';
import '../../../../widgets/OnceFutureBuilder.dart';

class DetailsTab extends StatefulWidget {
  final PatientModel patientModel;

  const DetailsTab({Key? key, required this.patientModel}) : super(key: key);

  @override
  _DetailsTabState createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
  bool isReadOnly = false;

  TextEditingController fullNameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController age = TextEditingController();
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

  @override
  void initState() {
    super.initState();
    fullNameC.text = widget.patientModel.patientName ?? '';
    phoneC.text = widget.patientModel.mobile ?? '';
    age.text = widget.patientModel.age?.toString() ?? '';
    MaritalStatusKey.text = widget.patientModel.maritalStatus ?? '';
    MaritalStatus.text =
        widget.patientModel.maritalStatus == "MS1"
            ? "Single"
            : widget.patientModel.maritalStatus == "MS2"
            ? "Married"
            : widget.patientModel.maritalStatus == "MS3"
            ? "Divorced"
            : widget.patientModel.maritalStatus == "MS4"
            ? "Widow"
            : "";
    Occupation.text = widget.patientModel.occupation ?? '';
    Title.text = widget.patientModel.title ?? '';
    PatientTypeKey.text = widget.patientModel.patientType ?? '';
    PatientType.text =
        widget.patientModel.patientType == "PT1"
            ? "Standard"
            : widget.patientModel.patientType == "PT2"
            ? "VIP"
            : widget.patientModel.patientType == "PT3"
            ? "Blacklist"
            : "";
    Address.text = widget.patientModel.address ?? '';
    Email.text = widget.patientModel.email ?? '';
    nationailityId.text = widget.patientModel.nationailityId ?? '';
    GenderKey.text = widget.patientModel.gender ?? '';
    Gender.text =
        widget.patientModel.gender == "Male"
            ? "Male"
            : widget.patientModel.gender == "Female"
            ? "Female"
            : "";
    PatientCode.text = widget.patientModel.patientCode ?? '';
    phoneWork.text = widget.patientModel.phoneWork ?? '';
    houseHeadNumber.text = widget.patientModel.houseHeadNumber ?? '';
    comments.text = widget.patientModel.comments ?? '';
  }

  Widget patientDetailsBody() {
    return ListView(
      children: [
        RefreshIndicator(
          onRefresh: () async {
            await PatientController().getPatientDetails(
              patientId: widget.patientModel.patientId ?? '',
            );
          },
          child: OnceFutureBuilder<PatientModel>(
            future:
                () => PatientController().getPatientDetails(
                  patientId: widget.patientModel.patientId ?? '',
                ),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Container(
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
                      margin: EdgeInsets.symmetric(
                        vertical: SizeHeight_M,
                        horizontal: SizeWidth_M,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeHeight_M,
                        horizontal: SizeWidth_M,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 2.0),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: SizeandStyleUtills()
                                      .getProportionalHeight(height: 100),
                                  height: SizeandStyleUtills()
                                      .getProportionalHeight(height: 100),
                                  child: CircleAvatar(
                                    child:
                                        snapshot.data?.photoJson!.isNotEmpty ??
                                                false
                                            ? Image.network(
                                              ApiRoutes.patientImagePath +
                                                  GlobalData
                                                      .patientData!
                                                      .photoJson!,
                                            )
                                            : Text(
                                              GlobalData
                                                  .patientData!
                                                  .patientCode!,
                                              style: TextStyle(fontSize: 26),
                                            ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data?.patientName ?? "",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 3),
                                      Text(snapshot.data?.mobile ?? ""),
                                      SizedBox(height: 3),
                                      Text(
                                        "${snapshot.data?.age == null ? "" : snapshot.data?.age.toString()} Year",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: Color(0xffB7B7B7)),
                            SpaceHeight_XS,
                            Row(
                              children: [
                                Text(
                                  "${S.S().MaritalStatus} :",
                                  style: TextStyle(
                                    color: Color(0xffB7B7B7),
                                    fontSize: 14,
                                  ),
                                ),
                                SpaceWidth_S,
                                Text(
                                  widget.patientModel.maritalStatus == "MS1"
                                      ? S.S().MS1
                                      : widget.patientModel.maritalStatus ==
                                          "MS2"
                                      ? S.S().MS2
                                      : widget.patientModel.maritalStatus ==
                                          "MS3"
                                      ? S.S().MS3
                                      : widget.patientModel.maritalStatus ==
                                          "MS4"
                                      ? S.S().MS4
                                      : "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            // ... (other similar rows for details)
                            SpaceHeight_XS,
                            Row(
                              children: [
                                Text(
                                  "${S.S().PhoneWork} :",
                                  style: TextStyle(
                                    color: Color(0xffB7B7B7),
                                    fontSize: 14,
                                  ),
                                ),
                                SpaceWidth_S,
                                Text(
                                  snapshot.data?.phoneWork ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SpaceHeight_XS,
                            InkWell(
                              onTap: () {
                                GoTo.screen(
                                  context,
                                  EditDetailes(patient: widget.patientModel),
                                );
                              },
                              child: Container(
                                height: SizeandStyleUtills()
                                    .getProportionalHeight(height: 50),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    S.S().Edit,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: patientDetailsBody());
  }
}
