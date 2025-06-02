import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:denta_soft/utils/SizesStatic.dart';
import 'package:denta_soft/utils/assets_routes.dart';
import 'package:denta_soft/utils/const_info.dart';
import 'package:denta_soft/utils/localization/Localizations.dart';
import 'package:denta_soft/widgets/EmptyScreenWidget.dart';
import 'package:flutter/material.dart';

import '../../../../controllers/PatientController.dart';
import '../../../../models/PatientModel.dart';

class OverviewTab extends StatefulWidget {
  final PatientModel? patientModel;

  const OverviewTab({Key? key, this.patientModel}) : super(key: key);

  @override
  _OverviewTabState createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  // Future<PatientModel> _patientModel;
  List<Map<dynamic, dynamic>> OverViewItem = [];

  @override
  void initState() {
    // _patientModel = PatientController()
    //     .getPatientDetails(patientId: widget.patientModel.patientId);
    // InsuranceCompanyController()
    //     .getInsuranceCompany(widget.patientModel.medicalInsuranceId);
    ApptStatusList.forEach((elementAppStatus) {
      int Obj = 0;
      widget.patientModel!.calendarViewModels!.forEach((element) {
        // Obj = ApptStatusList.firstWhere((x) => x['Code'] == element.status)['Count']+1;
        if (element.status == elementAppStatus['Code']) {
          Obj += 1;
        }
      });
      // print('obj $Obj');

      String color = ApptStatusList.firstWhere(
        (element) => element['Code'] == elementAppStatus['Code'],
      )['Color'].replaceAll("#", "");

      Obj == 0
          ? null
          : OverViewItem.add({
            'Color': color,
            'Code': elementAppStatus['Code'],
            'Count': Obj,
          });
    });
    super.initState();
  }

  // Widget patientOverViewBody() {
  //   return ListView(
  //     children: [
  //       // Container(
  //       //   width: SizeandStyleUtills().getProportionalWidth(width: 500),
  //       //   height: SizeandStyleUtills().getProportionalHeight(height: 450),
  //       //   margin: EdgeInsets.symmetric(
  //       //       vertical: SizeHeight_M, horizontal: SizeWidth_M),
  //       //   padding: EdgeInsets.symmetric(
  //       //       vertical: SizeHeight_M, horizontal: SizeWidth_M),
  //       //   decoration: BoxDecoration(
  //       //       color: Colors.white,
  //       //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //       //       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2.0)]),
  //       //   child: SingleChildScrollView(
  //       //     child: Column(
  //       //       mainAxisAlignment: MainAxisAlignment.start,
  //       //       crossAxisAlignment: CrossAxisAlignment.start,
  //       //       children: [
  //       //         Container(
  //
  //       //           width: SizeandStyleUtills().getProportionalWidth(width: 150),
  //       //           height:
  //       //               SizeandStyleUtills().getProportionalHeight(height: 100),
  //       //           child: CircleAvatar(
  //       //             // backgroundColor: Colors.transparent,
  //       //             child: widget.patientModel.photoJson != null
  //       //                 ? Image.network(
  //       //                     ApiRoutes.server_url +
  //       //                         widget.patientModel.photoJson,
  //       //                     // width: 150,
  //       //                     // height: 100,
  //       //                   )
  //       //                 : Icon(Icons.account_box_rounded),
  //       //           ),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         SpaceHeight_XS,
  //       //         Text(
  //       //           "Full Name",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         Text(
  //       //           widget.patientModel.patientName ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         SpaceHeight_XS,
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "Mobile",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.mobile ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "Age",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.age.toString() ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "Marital Status",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.maritalStatus == "MS1"
  //       //               ? "Single"
  //       //               : widget.patientModel.maritalStatus == "MS2"
  //       //                   ? "Married"
  //       //                   : widget.patientModel.maritalStatus == "MS3"
  //       //                       ? "Divorced"
  //       //                       : widget.patientModel.maritalStatus == "MS4"
  //       //                           ? "widow"
  //       //                           : "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "Occupation ",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.occupation ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "Title ",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.title ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "Patient Type",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.patientType == "PT1"
  //       //               ? "Standard"
  //       //               : widget.patientModel.patientType == "PT2"
  //       //                   ? "VIP"
  //       //                   : widget.patientModel.patientType == "PT3"
  //       //                       ? "Blacklist"
  //       //                       : "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "Address",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.address ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //           Text(
  //       //           "",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.medicalInsuranceId.toString() ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           " Email ",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.email ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           " National ID ",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.nationailityId ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           " Gender",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.gender ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "Patient Code ",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.patientCode ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "Phone Work ",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.phoneWork ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "House Head Phone No",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.houseHeadNumber ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //         Divider(
  //       //           color: Color(0xffB7B7B7),
  //       //         ),
  //       //         Text(
  //       //           "Comments",
  //       //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
  //       //         ),
  //       //         SpaceHeight_XXS,
  //       //         Text(
  //       //           widget.patientModel.comments ?? "",
  //       //           style: TextStyle(color: Colors.black, fontSize: 18),
  //       //         ),
  //       //       ],
  //       //     ),
  //       //   ),
  //       // ),
  //       // InkWell(
  //       //   onTap: () {
  //       //     print("edit");
  //       //     // print("patient id:${widget.patientModel.patientId}");
  //       //     //      _patientModel=PatientController().getPatientDetails(patientId: widget.patientModel.patientId);
  //       //     // print(GlobalData.patientData.age);
  //
  //       //   },
  //       //   child: Container(
  //       //     child: Row(
  //       //       mainAxisAlignment: MainAxisAlignment.center,
  //       //       children: [
  //       //         Container(
  //       //           width: SizeandStyleUtills().getProportionalWidth(width: 150),
  //       //           height:
  //       //               SizeandStyleUtills().getProportionalHeight(height: 50),
  //       //           decoration: BoxDecoration(
  //       //               color: Colors.blue,
  //       //               borderRadius: BorderRadius.all(Radius.circular(25))),
  //       //           child: Center(
  //       //             child: Text(
  //       //               "Edit",
  //       //               style: TextStyle(color: Colors.white),
  //       //             ),
  //       //           ),
  //       //         ),
  //       //         SpaceWidth_L,
  //       //         InkWell(
  //       //           onTap: () {
  //       //             print("delete");
  //       //           },
  //       //           child: Container(
  //       //             width:
  //       //                 SizeandStyleUtills().getProportionalWidth(width: 150),
  //       //             height:
  //       //                 SizeandStyleUtills().getProportionalHeight(height: 50),
  //       //             decoration: BoxDecoration(
  //       //                 border: Border.all(color: Colors.red),
  //       //                 borderRadius: BorderRadius.all(Radius.circular(25))),
  //       //             child: Center(
  //       //               child: Text(
  //       //                 "Delete",
  //       //                 style: TextStyle(color: Colors.red),
  //       //               ),
  //       //             ),
  //       //           ),
  //       //         ),
  //       //       ],
  //       //     ),
  //       //   ),
  //       // )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await PatientController().getPatientDetails(
          patientId: widget.patientModel!.patientId,
        );
      },
      child: Scaffold(body: patientOverViewBody()),
    );
    // Container(
    //   child: OnceFutureBuilder<PatientModel>(
    //     future: () => PatientController()
    //         .getPatientDetails(patientId: widget.patientModel.patientId),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState != ConnectionState.done) {
    //         return Center(child: CircularProgressIndicator());
    //       } else {
    //         return ListView.builder(
    //           itemCount: widget.patientModel.patientProcedureViewModels.length,
    //           itemBuilder: (context, index) {
    //             return Container(
    //               child: Column(
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       SpaceWidth_M,
    //                       Column(
    //                         children: [
    //                           CircleAvatar(
    //                             child: Icon(Icons.date_range),
    //                           ),
    //                           index != widget.patientModel.patientProcedureViewModels.length - 1
    //                               ? Container(
    //                             height: 80,
    //                             width: 3,
    //                             color: Colors.grey[200],
    //                           )
    //                               : Container(),
    //                         ],
    //                       ),
    //                       SpaceWidth_M,
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             );
    //           },
    //         );
    //       }
    //     },
    //   ),
    // );
  }

  Widget patientOverViewBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ListView(
        children: [
          SizedBox(height: 8),

          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeHeight_S,
              horizontal: SizeWidth_M,
            ),
            child: Text(
              S().Overview,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: buildOverViewCompouant(
                  title: S().ProcedureList,
                  count:
                      widget.patientModel!.patientProcedureViewModels!.length,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: buildOverViewCompouant(
                  title: S().DieasesType,
                  count: widget.patientModel!.dieases!.length,
                  color: Colors.redAccent,
                ),
              ),
              Expanded(
                child: buildOverViewCompouant(
                  title: S().Drugs,
                  count: widget.patientModel!.productViewModels!.length,
                  color: Colors.blue,
                ),
              ),
            ],
          ),

          Divider(color: Color(0xffB7B7B7)),

          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeHeight_S,
              horizontal: SizeWidth_M,
            ),
            child: Text(
              S().Appointments,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),

          // Container(
          //   height: SizeandStyleUtills().screenHeight *2.5,
          //   child: ListView.builder(
          //     itemCount: ApptStatusList.length,
          //
          //     physics: NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemBuilder:(context, index) {
          //       String title=ApptStatusList[index]['Code'];
          //       int Obj=0;
          //       widget.patientModel.calendarViewModels.forEach((element) {
          //          // Obj = ApptStatusList.firstWhere((x) => x['Code'] == element.status)['Count']+1;
          //          if(element.status ==title){
          //            Obj +=1;
          //          }
          //
          //       });
          //       print('obj $Obj');
          //

          //       // int count = ApptStatusList
          //       //     .firstWhere((element) => element['Code'] == widget.patientModel.calendarViewModels[0].status)['Count']+1;
          //       // print('count $count');
          //       String color = ApptStatusList
          //           .firstWhere((element) => element['Code'] == title)['Color'].replaceAll("#", "");
          //       return buildOverViewCompouant(
          //           title: '${AppLocalizations.of(context).translate(title)}', count: Obj, color:Color(int.parse("0xff$color")));
          //     },),
          // ),

          //Center(child: EmptyScreenWidget()) OverViewItem.length
          OverViewItem.length > 0
              ? GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // childAspectRatio: 2 / 2.2,
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,

                  mainAxisExtent: SizeandStyleUtills().screenWidth * 0.5,
                ),
                itemBuilder: (_, index) {
                  var title = OverViewItem[index];
                  // String title = ApptStatusList[index]['Code'];
                  //
                  // int Obj = 0;
                  // widget.patientModel.calendarViewModels.forEach((element) {
                  //   // Obj = ApptStatusList.firstWhere((x) => x['Code'] == element.status)['Count']+1;
                  //   if (element.status == title) {
                  //     Obj += 1;
                  //   }
                  // });
                  // print('obj $Obj');
                  //
                  // // int count = ApptStatusList
                  // //     .firstWhere((element) => element['Code'] == widget.patientModel.calendarViewModels[0].status)['Count']+1;
                  // // print('count $count');
                  // String color = ApptStatusList.firstWhere(
                  //         (element) => element['Code'] == title)['Color']
                  //     .replaceAll("#", "");
                  // return Obj == 0
                  //     ? SizedBox()
                  //     : buildOverViewCompouant(
                  //         title: '${AppLocalizations.of(context).translate(title)}',
                  //         count: Obj,
                  //         color: Color(int.parse("0xff$color")));

                  return buildOverViewCompouant(
                    title:
                        '${AppLocalizations.of(context)!.translate(title['Code'])}',
                    count: title['Count'],
                    color: Color(int.parse("0xff${title['Color']}")),
                  );
                },
                // itemCount: ApptStatusList.length,
                itemCount: OverViewItem.length,
              )
              : EmptyScreenWidget(assetPath: AssetsRoutes.noBoxDataAvailable),

          // buildOverViewCompouant(
          //     title: S().AS1, count: 20, color: Colors.blue),
          // buildOverViewCompouant(
          //     title: S().AS2, count: 0, color: Colors.blueGrey),
          // buildOverViewCompouant(
          //     title: S().AS3, count: 0, color: Colors.greenAccent),
          // buildOverViewCompouant(
          //     title: S().AS4, count: 0, color: Colors.grey),
          // buildOverViewCompouant(
          //     title: S().AS5, count: 0, color: Colors.green),
          // buildOverViewCompouant(
          //     title: S().AS6, count: 0, color: Colors.blueAccent),
          // buildOverViewCompouant(
          //     title: S().AS7, count: 0, color: Colors.amberAccent),
          // buildOverViewCompouant(title: S().AS8, count: 0, color: Colors.red),

          // Container(
          //   width: SizeandStyleUtills().getProportionalWidth(width: 500),
          //   height: SizeandStyleUtills().getProportionalHeight(height: 450),
          //   margin: EdgeInsets.symmetric(
          //       vertical: SizeHeight_M, horizontal: SizeWidth_M),
          //   padding: EdgeInsets.symmetric(
          //       vertical: SizeHeight_M, horizontal: SizeWidth_M),
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
          //       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2.0)]),
          //   child: SingleChildScrollView(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //
          //           width: SizeandStyleUtills().getProportionalWidth(width: 150),
          //           height:
          //               SizeandStyleUtills().getProportionalHeight(height: 100),
          //           child: CircleAvatar(
          //             // backgroundColor: Colors.transparent,
          //             child: widget.patientModel.photoJson != null
          //                 ? Image.network(
          //                     ApiRoutes.server_url +
          //                         widget.patientModel.photoJson,
          //                     // width: 150,
          //                     // height: 100,
          //                   )
          //                 : Icon(Icons.account_box_rounded),
          //           ),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         SpaceHeight_XS,
          //         Text(
          //           "Full Name",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         Text(
          //           widget.patientModel.patientName ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         SpaceHeight_XS,
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "Mobile",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.mobile ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "Age",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.age.toString() ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "Marital Status",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.maritalStatus == "MS1"
          //               ? "Single"
          //               : widget.patientModel.maritalStatus == "MS2"
          //                   ? "Married"
          //                   : widget.patientModel.maritalStatus == "MS3"
          //                       ? "Divorced"
          //                       : widget.patientModel.maritalStatus == "MS4"
          //                           ? "widow"
          //                           : "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "Occupation ",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.occupation ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "Title ",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.title ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "Patient Type",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.patientType == "PT1"
          //               ? "Standard"
          //               : widget.patientModel.patientType == "PT2"
          //                   ? "VIP"
          //                   : widget.patientModel.patientType == "PT3"
          //                       ? "Blacklist"
          //                       : "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "Address",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.address ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //           Text(
          //           "",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.medicalInsuranceId.toString() ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           " Email ",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.email ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           " National ID ",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.nationailityId ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           " Gender",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.gender ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "Patient Code ",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.patientCode ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "Phone Work ",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.phoneWork ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "House Head Phone No",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.houseHeadNumber ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //         Divider(
          //           color: Color(0xffB7B7B7),
          //         ),
          //         Text(
          //           "Comments",
          //           style: TextStyle(color: Color(0xffB7B7B7), fontSize: 14),
          //         ),
          //         SpaceHeight_XXS,
          //         Text(
          //           widget.patientModel.comments ?? "",
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () {
          //     print("edit");
          //     // print("patient id:${widget.patientModel.patientId}");
          //     //      _patientModel=PatientController().getPatientDetails(patientId: widget.patientModel.patientId);
          //     // print(GlobalData.patientData.age);
          //
          //   },
          //   child: Container(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Container(
          //           width: SizeandStyleUtills().getProportionalWidth(width: 150),
          //           height:
          //               SizeandStyleUtills().getProportionalHeight(height: 50),
          //           decoration: BoxDecoration(
          //               color: Colors.blue,
          //               borderRadius: BorderRadius.all(Radius.circular(25))),
          //           child: Center(
          //             child: Text(
          //               "Edit",
          //               style: TextStyle(color: Colors.white),
          //             ),
          //           ),
          //         ),
          //         SpaceWidth_L,
          //         InkWell(
          //           onTap: () {
          //             print("delete");
          //           },
          //           child: Container(
          //             width:
          //                 SizeandStyleUtills().getProportionalWidth(width: 150),
          //             height:
          //                 SizeandStyleUtills().getProportionalHeight(height: 50),
          //             decoration: BoxDecoration(
          //                 border: Border.all(color: Colors.red),
          //                 borderRadius: BorderRadius.all(Radius.circular(25))),
          //             child: Center(
          //               child: Text(
          //                 "Delete",
          //                 style: TextStyle(color: Colors.red),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget buildOverViewCompouant({String? title, int? count, Color? color}) {
    return Container(
      // width: SizeandStyleUtills().getProportionalWidth(width: 500),
      height: SizeandStyleUtills().getProportionalHeight(height: 160),
      margin: EdgeInsets.symmetric(
        vertical: SizeHeight_S,
        horizontal: SizeWidth_XXS,
      ),
      padding: EdgeInsets.symmetric(
        vertical: SizeHeight_S,
        horizontal: SizeWidth_S,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2.0)],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title!, style: TextStyle(color: Colors.blue, fontSize: 16)),
          SizedBox(height: 15),
          Container(
            width: SizeandStyleUtills().getProportionalWidth(width: 80),
            height: SizeandStyleUtills().getProportionalHeight(height: 60),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2.0)],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Text(
                  "${count}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
