import 'package:denta_soft/controllers/TreatmentController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/items/ConfirmShowModalBottomSheet.dart';
import 'package:denta_soft/items/TreatmentItemWidget.dart';
import 'package:denta_soft/models/InsuranceModel.dart';
import 'package:denta_soft/screens/app_theme.dart';
import 'package:denta_soft/utils/GlobalData.dart';
import 'package:denta_soft/utils/SizesStatic.dart';
import 'package:denta_soft/widgets/OnceFutureBuilder.dart';
import 'package:denta_soft/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TreatmentDisactiveScreen extends StatefulWidget {
  const TreatmentDisactiveScreen({super.key});

  @override
  _TreatmentDisactiveScreenState createState() =>
      _TreatmentDisactiveScreenState();
}

class _TreatmentDisactiveScreenState extends State<TreatmentDisactiveScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("DDD::${GlobalData.accountData!.objectData.branchId!}");
    return ChangeNotifierProvider.value(
      value: TreatmentController(),
      child: Consumer<TreatmentController>(
        builder: (context, model, child) => RefreshIndicator(
          onRefresh: () async {
            await model.getTreatmentInactiveList();
          },
          child: OnceFutureBuilder(
            future: () => model.getTreatmentInactiveList(),
            builder: (ctx, snapShot) {
              if (snapShot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              }
              return Scaffold(
                backgroundColor: AppTheme.nearlyWhite,
                body: SafeArea(
                  child: ListView(
                    children: [
                      SizedBox(height: 12),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return TreatmentItemWidget(
                            treatmentModel: model.treatments[index],
                            onAddProcedure: () async {},
                            onUpdate: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return ShowModalSheetConfirmation(
                                    title: "",
                                    mainTitle:
                                        "Are you sure Active This Treatment",
                                    onTapFunction: () async {
                                      print('confirm');
                                      Navigator.pop(context);
                                      model.changeStatusTreatmentBranch(
                                        model: model.treatments[index],
                                        statusTreat: true,
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            onProcedureList: () {},
                            isActive: false,
                          );
                        },
                        shrinkWrap: true,
                        itemCount: model.treatments.length,
                      ),
                      SizedBox(height: SizeHeight_XXXXXL + SizeHeight_XXXXXL),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class EditInsuranceBottomSheet extends StatefulWidget {
  String type;
  InsuranceModel insurance;
  Function onSave;

  EditInsuranceBottomSheet(this.type, this.insurance, this.onSave, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditInsuranceBottomSheetState createState() =>
      _EditInsuranceBottomSheetState();
}

class _EditInsuranceBottomSheetState extends State<EditInsuranceBottomSheet> {
  TextEditingController medicalCompanyController = TextEditingController();
  TextEditingController toleranceRatioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with values if they are not null
    medicalCompanyController.text = widget.insurance.medicalCompany ?? "";
    toleranceRatioController.text =
        widget.insurance.toleranceRatio?.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .95,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeWidth_L),
        child: Column(
          children: [
            SizedBox(height: WidgetSize_XS),
            Center(
              child: Text(
                "_________",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: WidgetSize_XS),
            Divider(),
            SizedBox(height: WidgetSize_S),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                widget.type == "add"
                    ? S().AddTreatment.toUpperCase()
                    : S().UpdateTreatment.toUpperCase(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: WidgetSize_S),
            TextFieldWidget(
              hintText: S().WriteMedicalCompany,
              labelText: S().MedicalCompany,
              controller: medicalCompanyController,
              onChangeText: (newValue) {
                widget.insurance.medicalCompany = newValue;
              },
            ),
            SizedBox(height: WidgetSize_XS),
            TextFieldWidget(
              hintText: S().WriteToleranceRatio,
              labelText: S().ToleranceRatio,
              textInputType: TextInputType.number,
              controller: toleranceRatioController,
              onChangeText: (newValue) {
                widget.insurance.toleranceRatio = newValue.isNotEmpty
                    ? double.parse(newValue)
                    : 0.0;
              },
            ),
            SizedBox(height: WidgetSize_XS),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () async {
                    widget.onSave();
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    minimumSize: Size(WidgetSize_XXXXL, 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S().Save.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.storage, color: Colors.white),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    minimumSize: Size(WidgetSize_XXXXL, 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S().Cancel.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.cancel, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
