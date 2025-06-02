import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/DiseaseModel.dart';
import 'package:flutter/material.dart';

import '../../../../models/SearchProductModel.dart';
import '../../../../utils/SizesStatic.dart';
import '../../../../widgets/custom_drop_down_Button_field.dart';
import '../../../../widgets/custom_text_form_field.dart';
import '../../../Widget/fieldHeader.dart';
import '../../../Widget/search_drug.dart';
import 'add_patient_viewModel.dart';

class PatientMedicalHistory extends StatelessWidget {
  final AddPatientViewModel model;
  const PatientMedicalHistory(this.model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: model.medicalHistoryKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: FieldHeader(
                S().PatientMedicalHistory,
                textColor: Colors.blueAccent,
              ),
            ),
            SpaceHeight_XS,
            ...List.generate(
              model.addedDisease.length,
              (index) => DieasesCard(
                commentController: model.addedDisease[index].comment,
                diseasesList: model.diseasesList,
                selectedDieases: model.addedDisease[index].diseaseId!,
                onSelectDieases: (v) {
                  model.addedDisease[index].diseaseId = v!;
                  model.setState();
                },
                onDelete: () {
                  model.addedDisease.removeAt(index);
                  model.setState();
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  onPressed: () {
                    model.addedDisease.add(PatientDisease());
                    model.setState();
                  },
                  icon: Icon(Icons.add),
                  label: Text(S().AddDieasesRecords),
                ),
              ),
            ),
            Divider(height: 10),
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
                children: model.drugsList.map((e) => _drugCard(e)).toList(),
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
                                  drugs: model.drugsList,
                                  onSearch: (v) {
                                    if (v.isNotEmpty) {
                                      model.drugsList = v;
                                      model.setState();
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
          ],
        ),
      ),
    );
  }

  Widget _drugCard(SearchProductModel drug) {
    return RawChip(
      label: Text(drug.productEn!, style: TextStyle(fontSize: 12)),
      deleteIcon: Icon(Icons.close, size: 12),
      deleteIconColor: Colors.red,
      onDeleted: () {
        model.drugsList.remove(drug);
        model.setState();
      },
    );
  }
}

class DieasesCard extends StatelessWidget {
  final List<DiseaseModel> diseasesList;
  final void Function(dynamic) onSelectDieases;
  final int selectedDieases;
  final Function onDelete;
  final TextEditingController commentController;

  const DieasesCard({
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
            onTap: onDelete as void Function()?,
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
