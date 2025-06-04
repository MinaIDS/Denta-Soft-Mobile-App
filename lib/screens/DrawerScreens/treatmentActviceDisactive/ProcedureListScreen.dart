import 'package:denta_soft/controllers/TreatmentController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/GetProceduresModel.dart';
import 'package:denta_soft/models/InsuranceModel.dart';
import 'package:denta_soft/models/TreatmentModel.dart';
import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:denta_soft/screens/app_theme.dart';
import 'package:denta_soft/utils/General.dart';
import 'package:denta_soft/utils/GlobalData.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:denta_soft/utils/SizesStatic.dart';
import 'package:denta_soft/utils/assets_routes.dart';
import 'package:denta_soft/widgets/EmptyScreenWidget.dart';
import 'package:denta_soft/widgets/OnceFutureBuilder.dart';
import 'package:denta_soft/widgets/TextFieldWidget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class ProcedureListScreen extends StatefulWidget {
  final TreatmentModel? model;

  const ProcedureListScreen({super.key, this.model});

  @override
  _ProcedureListScreenState createState() => _ProcedureListScreenState();
}

class _ProcedureListScreenState extends State<ProcedureListScreen> {
  @override
  Widget build(BuildContext context) {
    print("DDD::${GlobalData.accountData!.objectData.branchId!}");
    return ChangeNotifierProvider.value(
      value: TreatmentController(),
      child: Scaffold(
        backgroundColor: AppTheme.nearlyWhite,
        appBar: AppBar(
          title: Text(
            S().ProcedureList,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Consumer<TreatmentController>(
          builder: (context, model, child) => RefreshIndicator(
            onRefresh: () async {
              await model.getProceduresList(
                treatmentbranchId: widget.model!.treatmentBranchId!,
              );
            },
            child: OnceFutureBuilder(
              future: () async {
                await model.getProceduresList(
                  treatmentbranchId: widget.model!.treatmentBranchId!,
                );
              },
              builder: (ctx, snapShot) {
                if (snapShot.connectionState != ConnectionState.done) {
                  return Center(child: CircularProgressIndicator());
                }
                return SafeArea(
                  child: ListView(
                    children: [
                      SizedBox(height: 12),
                      model.getProceduresModel.isEmpty
                          ? SizedBox(
                              height: SizeandStyleUtills().screenHeight - 150,
                              child: EmptyScreenWidget(
                                assetPath: AssetsRoutes.noBoxDataAvailable,
                              ),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, index) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ProcedureItemWidget(
                                      proceduresModel:
                                          model.getProceduresModel[index],
                                      deleteProcedure: () async {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.question,
                                          animType: AnimType.bottomSlide,
                                          title: "",
                                          desc: S().Areyousureyouwanttodelete,
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () async {
                                            model.deleteProcedure(
                                              model: model
                                                  .getProceduresModel[index],
                                            );
                                          },
                                        ).show();
                                      },
                                      editProcedure: () {
                                        showMaterialModalBottomSheet(
                                          context: context,
                                          builder: (context) => SingleChildScrollView(
                                            controller:
                                                ModalScrollController.of(
                                                  context,
                                                ),
                                            child: EdiProcedureBottomSheet(
                                              model: model,
                                              modelProcedures: model
                                                  .getProceduresModel[index],
                                              modelInsuranceCompaniesModel: model
                                                  .getInsuranceCompaniesModel,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                              shrinkWrap: true,
                              itemCount: model.getProceduresModel.length,
                            ),
                      SizedBox(height: SizeHeight_XXXXXL + SizeHeight_XXXXXL),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ProcedureItemWidget extends StatelessWidget {
  final GetProceduresModel? proceduresModel;
  final Function deleteProcedure;
  final Function editProcedure;

  const ProcedureItemWidget({
    super.key,
    this.proceduresModel,
    required this.deleteProcedure,
    required this.editProcedure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeWidth_L,
        vertical: SizeWidth_S,
      ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeWidth_M,
                      vertical: SizeWidth_XS,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          proceduresModel?.procedureName ?? '',
                          style: TextStyle(
                            fontSize: SizeHeight_L,
                            fontWeight: FontWeight.w600,
                            color: ThemeColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  convertDateTimeFormat(
                    proceduresModel?.createdOn ?? DateTime.now(),
                  ),
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: () => editProcedure(),
                  child: Text(
                    S().Edit,
                    style: TextStyle(color: ThemeColors.nearlyBlack),
                  ),
                ),
                SpaceWidth_S,
                OutlinedButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: () => deleteProcedure(),
                  child: Text(
                    S().delete,
                    style: TextStyle(color: ThemeColors.nearlyBlack),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EdiProcedureBottomSheet extends StatelessWidget {
  final TreatmentController model;

  final GetProceduresModel modelProcedures;
  final List<InsuranceModel> modelInsuranceCompaniesModel;

  const EdiProcedureBottomSheet({
    super.key,
    required this.model,
    required this.modelProcedures,
    required this.modelInsuranceCompaniesModel,
  });

  @override
  Widget build(BuildContext context) {
    final modelSingleProcedure = Provider.of<TreatmentController>(
      context,
      listen: true,
    );
    return OnceFutureBuilder(
      future: () => modelSingleProcedure.getSingleProcedure(
        singleProcedureId: modelProcedures.procedureId!,
      ),
      builder: (ctx, snapShot) {
        if (snapShot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
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
                Expanded(
                  child: ListView(
                    children: [
                      Divider(),
                      SizedBox(height: WidgetSize_S),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "Edit Procedure ${modelSingleProcedure.getSingleProcedureModel.procedureName.toString()}"
                              .toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: WidgetSize_S),
                      TextFieldWidget(
                        labelText: S().ProcedureName,
                        controller: model.procedureNameController,
                        onChangeText: (newValue) {
                          // widget.insurance.medicalCompany = newValue;
                        },
                      ),
                      if (!modelSingleProcedure.isFirstOpen)
                        Column(children: modelSingleProcedure.listWidget),
                      SizedBox(height: WidgetSize_XS),
                      SizedBox(height: WidgetSize_XS),
                      // Save & Cancel Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Container(
                              color: Colors.blue,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              width: SizeandStyleUtills().screenWidth * 0.3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              color: Colors.red,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              width: SizeandStyleUtills().screenWidth * 0.3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
