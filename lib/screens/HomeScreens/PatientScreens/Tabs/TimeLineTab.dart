import 'package:denta_soft/utils/assets_routes.dart';
import 'package:denta_soft/utils/const_info.dart';
import 'package:denta_soft/widgets/EmptyScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/PatientController.dart';
import '../../../../models/PatientModel.dart';
import '../../../../utils/SizeandStyleUtills.dart';
import '../../../../utils/SizesStatic.dart';
import '../../../../widgets/OnceFutureBuilder.dart';

class TimeLineTab extends StatefulWidget {
  final PatientModel? patientModel;

  const TimeLineTab({Key? key, this.patientModel}) : super(key: key);

  @override
  _TimeLineTabState createState() => _TimeLineTabState();
}

class _TimeLineTabState extends State<TimeLineTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: () async {
          // Null safety: Ensure patientModel is not null before accessing properties
          if (widget.patientModel != null) {
            await PatientController().getPatientDetails(
              patientId: widget.patientModel!.patientId,
            );
          }
        },
        child: OnceFutureBuilder<List<CalendarViewModel>>(
          future: () async {
            // Null safety: Ensure patientModel is not null before accessing properties
            if (widget.patientModel != null) {
              return await PatientController().getPatientCalendars(
                patientId: widget.patientModel!.patientId,
              );
            }
            return []; // Return empty list if patientModel is null
          },
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return EmptyScreenWidget(
                  assetPath: AssetsRoutes.noCalendarDataAvailable,
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    var calendar = snapshot.data![index];
                    String color = ApptStatusList.firstWhere(
                      (element) => element['Code'] == calendar.status,
                      orElse: () => {'Color': '#000000'},
                    )['Color'].replaceAll("#", "");
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SpaceWidth_M,
                              Column(
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Color(
                                      int.parse("0xff$color"),
                                    ),
                                  ),
                                  index != snapshot.data!.length - 1
                                      ? Container(
                                        height: 80,
                                        width: 3,
                                        color: Colors.grey[200],
                                      )
                                      : Container(),
                                ],
                              ),
                              SpaceWidth_M,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SpaceHeight_S,
                                  Text(
                                    calendar.doctorName ?? "",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SpaceHeight_XS,
                                  Container(
                                    width: SizeandStyleUtills()
                                        .getProportionalWidth(width: 300),
                                    child: Text(
                                      calendar.description ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SpaceHeight_S,
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          DateFormat(
                                            "yyyy/MM/dd hh:mm",
                                          ).format(calendar.startTime!),
                                          style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          " - ",
                                          style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          DateFormat(
                                            "yyyy/MM/dd hh:mm",
                                          ).format(calendar.endTime!),
                                          style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}
