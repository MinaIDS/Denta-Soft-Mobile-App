import 'dart:convert';

import 'package:denta_soft/controllers/AttachmentsController.dart';
import 'package:denta_soft/controllers/PatientController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/DiseaseModel.dart';
import 'package:denta_soft/models/PatientModel.dart';
import 'package:denta_soft/utils/GlobalData.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:denta_soft/utils/SizesStatic.dart';
import 'package:denta_soft/widgets/OnceFutureBuilder.dart';
import 'package:denta_soft/widgets/custom_drop_down_Button_field.dart';
import 'package:denta_soft/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DieasesScreen extends StatelessWidget {
  final PatientModel patientModel;

  const DieasesScreen({super.key, required this.patientModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AttachmentsController(),
      child: Consumer<AttachmentsController>(
        builder: (context, model, child) => OnceFutureBuilder<void>(
          future: () => model.getDieasesList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return SizedBox(
                height: SizeandStyleUtills().screenHeight,
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Form(
                  key: model.medicalHistoryKey,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    children: [
                      SpaceHeight_XS,
                      ...List.generate(
                        model.addedDisease.length,
                        (index) => DieasesCard(
                          commentController: model.addedDisease[index].comment,
                          diseasesList: model.diseasesList,
                          selectedDieases: model.addedDisease[index].diseaseId,
                          onSelectDieases: (v) {
                            model.updateaddedDisease(index, v!);
                          },
                          onDelete: () {
                            model.deleteaddedDisease(index);
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                            onPressed: () {
                              model.addaddedDisease(PatientDisease());
                            },
                            icon: Icon(Icons.add),
                            label: Text(S().AddDieasesRecords),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          var body = jsonEncode(
                            model.addedDisease
                                .map(
                                  (d) => {
                                    "diseaseTypeId": d.diseaseId,
                                    "comments": d.comment.text,
                                    "updateUserId": GlobalData
                                        .accountData!
                                        .objectData
                                        .updateUserId,
                                    "createUserId": GlobalData
                                        .accountData!
                                        .objectData
                                        .currentUserId,
                                    "diseaseId": null,
                                    "patientId": patientModel.patientId,
                                    "dieasesName": null,
                                  },
                                )
                                .toList(),
                          );

                          print("editProfile request body::$body");
                          PatientController().saveDiseaseProfile(context, body);
                        },
                        child: Container(
                          height: SizeandStyleUtills().getProportionalHeight(
                            height: 50,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Center(
                            child: Text(
                              S().SaveDieases,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class DieasesCard extends StatelessWidget {
  final List<DiseaseModel> diseasesList;
  final void Function(int?) onSelectDieases;
  final int selectedDieases;
  final Function onDelete;
  final TextEditingController commentController;

  const DieasesCard({
    super.key,
    required this.onSelectDieases,
    required this.commentController,
    required this.selectedDieases,
    required this.onDelete,
    required this.diseasesList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(14, 14, 14, 10),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[100]!,
                offset: Offset(2, 2),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              CustomDropdownButtonField(
                hint: S().DieasesType,
                value: selectedDieases,
                onChanged: (v) => onSelectDieases(v as int),
                validator: (v) {
                  if (v == null) {
                    return 'No diseases selected';
                  }
                  return "";
                },
                items: diseasesList
                    .map(
                      (d) =>
                          DropdownMenuItem(value: d.id, child: Text(d.value!)),
                    )
                    .toList(),
              ),
              SpaceHeight_L,
              CustomTextFormField(
                controller: commentController,
                label: S().Comment,
                lines: 3,
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 0,
          end: 5,
          child: GestureDetector(
            onTap: () => onDelete(),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.close, color: Colors.red, size: 15),
            ),
          ),
        ),
      ],
    );
  }
}
