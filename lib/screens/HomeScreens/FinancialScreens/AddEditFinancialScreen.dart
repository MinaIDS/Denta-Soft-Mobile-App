import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:denta_soft/screens/Widget/fieldHeader.dart';
import 'package:denta_soft/utils/General.dart';
import 'package:denta_soft/utils/ToastM.dart';
import 'package:denta_soft/widgets/custom_drop_down_Button_field.dart';
import 'package:denta_soft/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../controllers/FinancialController.dart';

class AddEditFinancialScreen extends StatelessWidget {
  bool? isEdit = false;

  AddEditFinancialScreen({this.isEdit});

  @override
  Widget build(BuildContext context) {
    FinancialController model = Provider.of<FinancialController>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.selectedIOCome == null
              ? S().AddIncomeExpenses
              : S().EditIncomeExpenses,
          style: ThemeColors.appBarStyle,
        ),
        iconTheme: ThemeColors.appBarIcon,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: ThemeColors.danger),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            icon: const Icon(Icons.done, color: ThemeColors.primary),
            onPressed: () async {
              if (model.selectedIOCome.type.toString().isEmpty) {
                ToastM.show(S().YouneedtoselectaType);
              } else if (model.selectedIOCome.category!.isEmpty) {
                ToastM.show(S().YouneedtoselectaCategory);
              } else if (model.selectedIOCome.amount! < 1) {
                ToastM.show(S().YouneedtoaddAmount);
              } else
                model.saveIOCome(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              // // Search a doctor
              FieldHeader(S().Type),
              CustomDropdownButtonField(
                margin: EdgeInsets.symmetric(vertical: 10),
                items:
                    model.typeData
                        .map(
                          (c) => DropdownMenuItem(
                            child: Text(c["Value"]),
                            value: c["Code"],
                          ),
                        )
                        .toList(),
                hint: S().Type,
                value: model.selectedIOCome.type,
                onChanged: (v) {
                  model.selectedIOCome.type = v as int?;
                },
              ),
              SizedBox(height: 12),
              FieldHeader(S().Category),
              CustomDropdownButtonField(
                margin: EdgeInsets.symmetric(vertical: 10),
                items:
                    model.categoryData
                        .map(
                          (c) => DropdownMenuItem(
                            child: Text(c["Value"]),
                            value: c["Code"],
                          ),
                        )
                        .toList(),
                value: model.selectedIOCome.category,
                hint: S().Category,
                onChanged: (v) {
                  print(v);
                  model.selectedIOCome.category = v as String;
                },
              ),
              SizedBox(height: 12),

              // Amount
              FieldHeader(S().Amount),
              CustomTextFormField(
                margin: EdgeInsets.symmetric(vertical: 10),
                initialValue:
                    model.isHaveData
                        ? replaceNumberNoZero(model.selectedIOCome.amount!)
                        : "",
                keyboardType: TextInputType.number,
                onChanged: (v) {
                  model.selectAmount(double.parse(v));
                },
                hint: S().Amount,
              ),

              // Reference ID
              FieldHeader(S().ReferenceID),
              CustomTextFormField(
                margin: EdgeInsets.symmetric(vertical: 10),
                keyboardType: TextInputType.text,
                initialValue:
                    model.isHaveData
                        ? model.selectedIOCome.referenceId.toString()
                        : "",
                onChanged: (v) {
                  model.selectReferenceID(v);
                },
                hint: S().ReferenceID,
              ),
              FieldHeader(S().DateOfBirth),
              CustomTextFormField(
                controller: TextEditingController(
                  text:
                      model.isHaveData
                          ? convertDateFormat(model.selectedIOCome.happenDate!)
                          : "",
                ),
                keyboardType: TextInputType.number,
                margin: EdgeInsets.symmetric(vertical: 10),
                hint: S().DateOfBirth,
                suffixIcon: Icon(Icons.date_range),
                onTap: () => model.selectDate(context),
              ),

              // Comment
              FieldHeader(S().Comment),
              CustomTextFormField(
                margin: EdgeInsets.symmetric(vertical: 10),
                initialValue:
                    model.isHaveData
                        ? model.selectedIOCome.comments.toString()
                        : "",
                keyboardType: TextInputType.text,
                onChanged: (v) {
                  model.selectComment(v);
                },
                hint: S().Comment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
