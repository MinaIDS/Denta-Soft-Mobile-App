import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/screens/DrawerScreens/treatmentActviceDisactive/treatment_Active_screen.dart';
import 'package:denta_soft/screens/DrawerScreens/treatmentActviceDisactive/treatment_Disactive_screen.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:flutter/material.dart';
import '../../models/InsuranceModel.dart';
import '../../utils/GlobalData.dart';
import '../../utils/SizesStatic.dart';
import '../../widgets/TextFieldWidget.dart';
import '../app_theme.dart';

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({super.key});

  @override
  _TreatmentScreenState createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("DDD::${GlobalData.accountData!.objectData.branchId}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S().Treatment,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: AppTheme.nearlyWhite,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            TabBar(
              labelColor: Colors.blue,
              tabs: [
                SizedBox(
                  width: SizeandStyleUtills().screenWidth * 0.45,
                  child: Tab(text: S().ActiveTreatments),
                ),
                SizedBox(
                  width: SizeandStyleUtills().screenWidth * 0.45,
                  child: Tab(text: S().DeactivateTreatments),
                ),
              ],
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              isScrollable: true,
            ),
            Expanded(
              child: TabBarView(
                children: [TreatmentActiveScreen(), TreatmentDisactiveScreen()],
              ),
            ),
          ],
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
                widget.insurance.toleranceRatio = double.tryParse(newValue);
              },
            ),
            SizedBox(height: WidgetSize_XS),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Replacing FlatButton with TextButton
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
                // Replacing FlatButton with TextButton
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
