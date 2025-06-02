import 'dart:convert';
import 'package:denta_soft/controllers/AttachmentsController.dart';
import 'package:denta_soft/controllers/PatientController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/DiseaseModel.dart';
import 'package:denta_soft/models/PatientModel.dart';
import 'package:denta_soft/models/SearchProductModel.dart';
import 'package:denta_soft/screens/Widget/fieldHeader.dart';
import 'package:denta_soft/screens/Widget/search_drug.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:denta_soft/utils/SizesStatic.dart';
import 'package:denta_soft/widgets/custom_drop_down_Button_field.dart';
import 'package:denta_soft/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MedicalScreen extends StatelessWidget {
  final AttachmentsController? model;
  final PatientModel? patientModel;

  const MedicalScreen({this.model, this.patientModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: model!.medicalHistoryKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: FieldHeader(S().Patient_Drugs),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                spacing: 10,
                children:
                    model!.drugsList.map((e) => _drugCard(e, model!)).toList(),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.green),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          topRight: Radius.circular(13),
                        ),
                      ),
                      builder:
                          (ctx) => DraggableScrollableSheet(
                            maxChildSize: 0.95,
                            initialChildSize: 0.95,
                            builder:
                                (ctx, scrollController) => SearchDrug(
                                  drugs: model!.drugsList,
                                  onSearch: (v) {
                                    if (v.isNotEmpty) {
                                      model!.updatedrugsList(v);
                                    }
                                  },
                                ),
                          ),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text(S().Add_Drug),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var body = jsonEncode({
                  "patientId": patientModel!.patientId,
                  "pDieseasId": null,
                  "productId": null,
                  "comments": null,
                  "productIds":
                      model!.drugsList.map((d) => d.productId).toList(),
                });

                print("editProfile request body::" + body);
                PatientController().saveProductDiseaseProfile(context, body);
              },
              child: Container(
                height: SizeandStyleUtills().getProportionalHeight(height: 50),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Center(
                  child: Text(
                    S().Save_Drug,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drugCard(SearchProductModel drug, AttachmentsController model) {
    return RawChip(
      label: Text(drug.productEn!, style: TextStyle(fontSize: 12)),
      deleteIcon: Icon(Icons.close, size: 12),
      deleteIconColor: Colors.red,
      onDeleted: () {
        model.deletedrugsList(drug);
      },
    );
  }
}

class DieasesCard extends StatelessWidget {
  final List<DiseaseModel> diseasesList;
  final void Function(dynamic) onSelectDieases;
  final int selectedDieases;
  final VoidCallback onDelete; // <-- Correct type for the onDelete callback
  final TextEditingController commentController;

  const DieasesCard({
    required this.onSelectDieases,
    required this.commentController,
    required this.selectedDieases,
    required this.onDelete, // <-- onDelete should be VoidCallback (no arguments, no return)
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
                onChanged: onSelectDieases,
                validator: (v) {
                  if (v == null) {
                    return 'No dieases selected';
                  }
                  return "";
                },
                items:
                    diseasesList
                        .map(
                          (d) => DropdownMenuItem(
                            child: Text(d.value!),
                            value: d.id,
                          ),
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
            onTap: onDelete, // <-- Here onDelete will match the expected type
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
