import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/widgets/EmptyScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../controllers/ProcedureController.dart';
import '../../items/ProceduresItemWidget.dart';
import '../../models/InsuranceModel.dart';
import '../../models/ProcedureModel.dart';
import '../../utils/GlobalData.dart';
import '../../utils/SizesStatic.dart';
import '../../widgets/TextFieldWidget.dart';
import '../app_theme.dart';

class ProcedureScreen extends StatefulWidget {
  const ProcedureScreen({super.key});

  @override
  _ProcedureScreenState createState() => _ProcedureScreenState();
}

class _ProcedureScreenState extends State<ProcedureScreen> {
  bool isInEdit = false;
  bool isFirestOpen = true;

  Future<List<ProcedureModel>>? getProcedureList; // Fix for null safety
  List<ProcedureModel> procedures = []; // Initialize as empty list
  ProcedureModel procedure = ProcedureModel();

  @override
  void initState() {
    super.initState();
    getProcedureList = ProcedureController().getProcedureList();
  }

  @override
  Widget build(BuildContext context) {
    print("DDD::${GlobalData.accountData!.objectData.branchId}");
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          InsuranceModel insuranceModel = InsuranceModel();
          showMaterialModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: EditInsuranceBottomSheet(
                S().Add,
                insuranceModel,
                () async {
                  final dd = await ProcedureController().getProcedureList();
                  setState(() {
                    procedures = dd;
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: AppTheme.nearlyWhite,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            procedures = await ProcedureController().getProcedureList();
          },
          child: FutureBuilder<List<ProcedureModel>>(
            future: getProcedureList,
            builder: (ctx, snap) {
              if (snap.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (isFirestOpen) {
                  procedures = snap.data ?? [];
                  isFirestOpen = false;
                }

                return ListView(
                  children: [
                    SizedBox(height: 12),
                    procedures.isEmpty
                        ? EmptyScreenWidget()
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ProceduresItemWidget(
                                    procedureModel: procedures[index],
                                    onDelete: () async {},
                                    onUpdate: () {},
                                  ),
                                ],
                              );
                            },
                            shrinkWrap: true,
                            itemCount: procedures.length,
                          ),
                    SizedBox(height: SizeHeight_XXXXXL + SizeHeight_XXXXXL),
                  ],
                );
              }
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
  _EditInsuranceBottomSheetState createState() =>
      _EditInsuranceBottomSheetState();
}

class _EditInsuranceBottomSheetState extends State<EditInsuranceBottomSheet> {
  TextEditingController medicalCompanyController = TextEditingController();
  TextEditingController toleranceRatioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Handle nullable properties with null-aware operators
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
                    ? S().AddProcedure.toUpperCase()
                    : S().UpdateProcedure.toUpperCase(),
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
                widget.insurance.toleranceRatio = double.tryParse(newValue);
              },
            ),
            SizedBox(height: WidgetSize_XS),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    widget.onSave();
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    width: WidgetSize_XXXXL,
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
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    width: WidgetSize_XXXXL,
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
              ],
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
