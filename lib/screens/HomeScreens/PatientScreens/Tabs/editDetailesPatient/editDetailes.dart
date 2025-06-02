import 'package:denta_soft/controllers/AttachmentsController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/PatientModel.dart';
import 'package:denta_soft/screens/HomeScreens/PatientScreens/Tabs/editDetailesPatient/Dieases.dart';
import 'package:denta_soft/screens/HomeScreens/PatientScreens/Tabs/editDetailesPatient/Medical.dart';
import 'package:denta_soft/screens/HomeScreens/PatientScreens/Tabs/editDetailesPatient/info.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:denta_soft/widgets/OnceFutureBuilder.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class EditDetailes extends StatefulWidget {
  final PatientModel? patient;

  const EditDetailes({Key? key, this.patient}) : super(key: key);

  @override
  _EditDetailesState createState() => _EditDetailesState();
}

class _EditDetailesState extends State<EditDetailes> {
  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<AttachmentsController>(context, listen: true);
    return DefaultTabController(
      length: 3,
      child: ChangeNotifierProvider.value(
        value: AttachmentsController(),
        child: Consumer<AttachmentsController>(
          builder:
              (context, model, child) => RefreshIndicator(
                onRefresh: () async {
                  if (widget.patient != null) {
                    await model.getAttachments(
                      patientId: widget.patient!.patientId,
                    );
                  }
                },
                child: OnceFutureBuilder(
                  future: () async {
                    if (widget.patient != null) {
                      await model.getAttachments(
                        patientId: widget.patient!.patientId,
                      );
                    }
                  },
                  builder: (ctx, snapShot) {
                    if (snapShot.connectionState != ConnectionState.done) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Scaffold(
                      backgroundColor: Colors.white,
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        iconTheme: IconThemeData(color: Colors.blue),
                        title: Text(
                          S().PatientDetails,
                          style: TextStyle(color: Colors.blue),
                        ),
                        bottom: TabBar(
                          labelColor: Colors.blue,
                          indicatorColor: Colors.blue,
                          tabs: [
                            Container(
                              width: SizeandStyleUtills().screenWidth * 0.29,
                              child: Tab(text: "Info"),
                            ),
                            Container(
                              width: SizeandStyleUtills().screenWidth * 0.29,
                              child: Tab(text: S().Medical),
                            ),
                            Container(
                              width: SizeandStyleUtills().screenWidth * 0.29,
                              child: Tab(text: S().DieasesType),
                            ),
                          ],
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          isScrollable: true,
                        ),
                      ),
                      body: Column(
                        children: <Widget>[
                          // create widgets for each tab bar here
                          Expanded(
                            child: TabBarView(
                              children: [
                                Info(patientModel: widget.patient!),
                                MedicalScreen(
                                  model: model,
                                  patientModel: widget.patient!,
                                ),
                                DieasesScreen(patientModel: widget.patient!),
                              ],
                            ),
                          ),
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
