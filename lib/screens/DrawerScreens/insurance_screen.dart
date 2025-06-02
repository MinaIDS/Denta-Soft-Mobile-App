import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/items/ConfirmShowModalBottomSheet.dart';
import 'package:denta_soft/utils/assets_routes.dart';
import 'package:denta_soft/widgets/EmptyScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../controllers/InsuranceCompanyController.dart';
import '../../items/InsuranceItemWidget.dart';
import '../../models/InsuranceModel.dart';
import '../../utils/SizeandStyleUtills.dart';
import '../../utils/SizesStatic.dart';
import '../../widgets/TextFieldWidget.dart';
import '../ThemeColors.dart';
import '../app_theme.dart';

class InsuranceScreen extends StatefulWidget {
  @override
  _InsuranceScreenState createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  bool isInEdit = false;
  bool isFirstOpen = true;

  Future<List<InsuranceModel>>? getInsuranceCompanies;
  List<InsuranceModel> insurances = [];
  InsuranceModel insurance = InsuranceModel();

  @override
  void initState() {
    super.initState();
    getInsuranceCompanies =
        InsuranceCompanyController().getInsuranceCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ThemeColors.primary),
        elevation: 0,
        title: Text(
          S().Insurance,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: ThemeColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          InsuranceModel insuranceModel = InsuranceModel();
          showMaterialModalBottomSheet(
            context: context,
            builder:
                (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: EditInsuranceBottomSheet(
                    S().Add,
                    insuranceModel,
                    () async {
                      insurances =
                          await InsuranceCompanyController()
                              .getInsuranceCompanies();
                      setState(() {});
                    },
                  ),
                ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: AppTheme.nearlyWhite,
      body: SafeArea(
        child: FutureBuilder<List<InsuranceModel>>(
          future: getInsuranceCompanies,
          builder: (ctx, snap) {
            if (snap.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (isFirstOpen) {
                insurances = snap.data!;
                isFirstOpen = false;
              }
              return RefreshIndicator(
                onRefresh: () async {
                  insurances =
                      await InsuranceCompanyController()
                          .getInsuranceCompanies();
                  setState(() {});
                },
                child: ListView(
                  children: [
                    SizedBox(height: 12),
                    insurances.isEmpty
                        ? Center(
                          child: Stack(
                            children: [
                              EmptyScreenWidget(
                                assetPath: AssetsRoutes.noBoxDataAvailable,
                              ),
                            ],
                          ),
                        )
                        : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InsuranceItemWidget(
                                  insuranceModel: insurances[index],
                                  onDelete: () async {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return ShowModalSheetConfirmation(
                                          title: S().All,
                                          onTapFunction: () async {
                                            print('confirm');
                                            Navigator.pop(context);
                                            bool status =
                                                await InsuranceCompanyController()
                                                    .deleteInsuranceCompany(
                                                      branchId:
                                                          insurances[index]
                                                              .branchId!,
                                                      id:
                                                          insurances[index]
                                                              .medicalInsuranceId!,
                                                    );
                                            if (status) {
                                              setState(() {
                                                insurances.remove(
                                                  insurances[index],
                                                );
                                              });
                                            } else {}
                                          },
                                        );
                                      },
                                    );
                                  },
                                  onUpdate: () {
                                    InsuranceModel insuranceModel =
                                        InsuranceModel();
                                    insuranceModel.medicalInsuranceId =
                                        insurances[index].medicalInsuranceId;
                                    insuranceModel.toleranceRatio =
                                        insurances[index].toleranceRatio;
                                    insuranceModel.medicalCompany =
                                        insurances[index].medicalCompany;

                                    showMaterialModalBottomSheet(
                                      context: context,
                                      builder:
                                          (context) => SingleChildScrollView(
                                            controller:
                                                ModalScrollController.of(
                                                  context,
                                                ),
                                            child: EditInsuranceBottomSheet(
                                              S().Update,
                                              insuranceModel,
                                              () async {
                                                insurances =
                                                    await InsuranceCompanyController()
                                                        .getInsuranceCompanies();
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                          shrinkWrap: true,
                          itemCount: insurances.length,
                        ),
                    SizedBox(height: SizeHeight_XXXXXL + SizeHeight_XXXXXL),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class EditInsuranceBottomSheet extends StatefulWidget {
  String type;
  InsuranceModel insurance;
  Function onSave;

  EditInsuranceBottomSheet(this.type, this.insurance, this.onSave);

  @override
  _EditInsuranceBottomSheetState createState() =>
      _EditInsuranceBottomSheetState();
}

class _EditInsuranceBottomSheetState extends State<EditInsuranceBottomSheet> {
  TextEditingController medicalCompanyController = TextEditingController();
  TextEditingController toleranceRatioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    medicalCompanyController.text = widget.insurance.medicalCompany ?? "";
    toleranceRatioController.text = widget.insurance.toleranceRatio.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .95,
      color: Colors.white,
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
                    ? S().AddInsuranceCompany.toUpperCase()
                    : S().UpdateInsurance.toUpperCase(),
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
                widget.insurance.toleranceRatio = double.parse(newValue);
              },
            ),
            SizedBox(height: WidgetSize_XS),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((
                      Set<WidgetState> states,
                    ) {
                      return ThemeColors.primary;
                    }),
                  ),
                  onPressed: () async {
                    bool status = await InsuranceCompanyController()
                        .saveInsuranceCompany(insurances: widget.insurance);
                    widget.onSave();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: SizeandStyleUtills().getProportionalHeight(
                      height: 100,
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeWidth_L,
                        vertical: SizeHeight_XS,
                      ),
                      child: Text(
                        S().Save,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 2,
                          fontSize: 16,
                          color: ThemeColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SpaceWidth_S,
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((
                      Set<WidgetState> states,
                    ) {
                      return ThemeColors.danger;
                    }),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: SizeandStyleUtills().getProportionalHeight(
                      height: 100,
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeWidth_L,
                        vertical: SizeHeight_XS,
                      ),
                      child: Text(
                        S().Cancel,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 2,
                          fontSize: 16,
                          color: ThemeColors.white,
                        ),
                      ),
                    ),
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
