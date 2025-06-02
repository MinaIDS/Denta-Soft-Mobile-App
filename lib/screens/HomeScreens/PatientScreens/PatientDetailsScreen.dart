import 'package:denta_soft/controllers/PatientController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/widgets/OnceFutureBuilder.dart';
import 'package:flutter/material.dart';

import '../../../models/PatientModel.dart';
import 'Tabs/DetailsTab.dart';
import 'Tabs/ImagesTab.dart';
import 'Tabs/MedicalRecordTab.dart';
import 'Tabs/NotesTab.dart';
import 'Tabs/OverViewTab.dart';
import 'Tabs/TimeLineTab.dart';

class PatientDetailsScreen extends StatefulWidget {
  final PatientModel? patientModel;

  const PatientDetailsScreen({Key? key, this.patientModel}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<PatientDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    //print('pId:${widget.patientId}');
    return DefaultTabController(
      length: 6,
      child: RefreshIndicator(
        onRefresh: () async {
          await PatientController().getPatientDetails(
            patientId: widget.patientModel!.patientId,
          );
        },
        child: OnceFutureBuilder(
          future:
              () => PatientController().getPatientDetails(
                patientId: widget.patientModel!.patientId,
              ),
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
                  tabs: [
                    Tab(text: S().Overview),
                    Tab(text: S().Details),
                    Tab(text: S().Timeline),
                    Tab(text: S().EMR),
                    // Tab(text: "Chart"),
                    Tab(text: S().Images),
                    Tab(text: S().Notes),
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
                        OverviewTab(
                          // patientModel: widget.patientModel,
                          patientModel: snapShot.data as PatientModel?,
                        ),
                        DetailsTab(patientModel: widget.patientModel!),
                        TimeLineTab(patientModel: widget.patientModel!),
                        MedicalRecordTab(patient: widget.patientModel),
                        // ChartTab(),
                        ImagesTab(patient: widget.patientModel),
                        NotesTab(patient: widget.patientModel),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
