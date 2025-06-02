import 'package:denta_soft/controllers/TreatmentController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/items/ConfirmShowModalBottomSheet.dart';
import 'package:denta_soft/items/TreatmentItemWidget.dart';
import 'package:denta_soft/models/TreatmentModel.dart';
import 'package:denta_soft/screens/DrawerScreens/treatmentActviceDisactive/ProcedureListScreen.dart';
import 'package:denta_soft/screens/app_theme.dart';
import 'package:denta_soft/utils/GlobalData.dart';
import 'package:denta_soft/utils/GoTo.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:denta_soft/utils/SizesStatic.dart';
import 'package:denta_soft/widgets/OnceFutureBuilder.dart';
import 'package:denta_soft/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class TreatmentActiveScreen extends StatefulWidget {
  @override
  _TreatmentActiveScreenState createState() => _TreatmentActiveScreenState();
}

class _TreatmentActiveScreenState extends State<TreatmentActiveScreen> {
  bool isInEdit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("DDD::" + GlobalData.accountData!.objectData.branchId!);
    return ChangeNotifierProvider.value(
      value: TreatmentController(),
      child: Consumer<TreatmentController>(
        builder:
            (context, model, child) => RefreshIndicator(
              onRefresh: () async {
                await model.getTreatmentActiveList();
              },
              child: OnceFutureBuilder(
                future: () => model.getTreatmentActiveList(),
                builder: (ctx, snapShot) {
                  if (snapShot.connectionState != ConnectionState.done) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Scaffold(
                    backgroundColor: AppTheme.nearlyWhite,
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 12),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, index) {
                                final treatment = model.treatments[index];
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TreatmentItemWidget(
                                      treatmentModel: treatment,
                                      onAddProcedure: () async {
                                        showMaterialModalBottomSheet(
                                          context: context,
                                          builder:
                                              (
                                                context,
                                              ) => SingleChildScrollView(
                                                controller:
                                                    ModalScrollController.of(
                                                      context,
                                                    ),
                                                child: EditInsuranceBottomSheet(
                                                  model: model,
                                                  modelData: treatment,
                                                ),
                                              ),
                                        );
                                      },
                                      onUpdate: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return ShowModalSheetConfirmation(
                                              title: "",
                                              mainTitle:
                                                  "Are you sure you want to DisActive This Treatment",
                                              onTapFunction: () async {
                                                print('confirm');
                                                Navigator.pop(context);
                                                model
                                                    .changeStatusTreatmentBranch(
                                                      model: treatment,
                                                      statusTreat: false,
                                                    );
                                              },
                                            );
                                          },
                                        );
                                      },
                                      onProcedureList: () {
                                        GoTo.screen(
                                          context,
                                          ProcedureListScreen(model: treatment),
                                        );
                                      },
                                      isActive: true,
                                    ),
                                  ],
                                );
                              },
                              shrinkWrap: true,
                              itemCount: model.treatments.length,
                            ),
                            SizedBox(
                              height: SizeHeight_XXXXXL + SizeHeight_XXXXXL,
                            ),
                          ],
                        ),
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

class EditInsuranceBottomSheet extends StatefulWidget {
  final TreatmentController model;
  final TreatmentModel modelData;

  const EditInsuranceBottomSheet({
    Key? key,
    required this.model,
    required this.modelData,
  }) : super(key: key);

  @override
  _EditInsuranceBottomSheetState createState() =>
      _EditInsuranceBottomSheetState();
}

class _EditInsuranceBottomSheetState extends State<EditInsuranceBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * .75,
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
                S().AddProcedure.toUpperCase(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: WidgetSize_S),
            TextFieldWidget(
              hintText: S().WriteProcedurename,
              labelText: S().ProcedureName,
              controller: widget.model.procedureNameController,
              onChangeText: (newValue) {
                // widget.insurance.medicalCompany = newValue;
              },
            ),
            SizedBox(height: WidgetSize_XS),
            SizedBox(height: WidgetSize_XS),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    widget.model.saveProcedure(model: widget.modelData);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    width: SizeandStyleUtills().screenWidth * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 8,
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
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    width: SizeandStyleUtills().screenWidth * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 8,
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
