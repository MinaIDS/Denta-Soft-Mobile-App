import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/SearchDoctorModel.dart';
import 'package:denta_soft/models/SearchPatientModel.dart';
import 'package:denta_soft/utils/General.dart';
import 'package:denta_soft/utils/GlobalData.dart';
import 'package:denta_soft/utils/SizesStatic.dart';
import 'package:denta_soft/utils/ToastM.dart';
import 'package:denta_soft/utils/const_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../models/CalendarModel.dart';
import '../models/RoomModel.dart';
import '../services/CalendarServices.dart';

class MCalendarController extends ChangeNotifier {
  CalendarView calendarView = CalendarView.timelineMonth;
  CalendarController calendarController = CalendarController();
  bool isHaveData = false;
  CalendarModel? selectedEvent;
  DateTime? mSelectedDate;

  List<CalendarResource> resourseRooms = <CalendarResource>[];
  List<CalendarModel> appointmentList = <CalendarModel>[];
  _DataSource? events;

  DateTime? startDate;
  DateTime? endDate;

  initBaseDate() {
    startDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      1,
      DateTime.now().minute,
      DateTime.now().second,
    );
    endDate = startDate!.add(Duration(days: 31));
  }

  getData() async {
    resourseRooms.clear();
    appointmentList.clear();
    handleCalendarView();
    initBaseDate();
    await getListsOfData();
    await getRooms();
    await getAppointments(
      startDate: startDate.toString(),
      endDate: endDate.toString(),
    );
    events = _DataSource(appointmentList, resourseRooms);
    notifyListeners();
  }

  updateAppointment() async {
    appointmentList.clear();
    await getAppointments(
      startDate: startDate.toString(),
      endDate: endDate.toString(),
    );
    events = _DataSource(appointmentList, resourseRooms);
    notifyListeners();
  }

  Future getRooms() async {
    List<RoomModel> rooms = [];
    rooms = await CalendarServices().getRooms();
    for (var element in rooms) {
      resourseRooms.add(
        CalendarResource(
          displayName: element.roomName,
          id: element.roomId,
          color: Colors.blue,
        ),
      );
    }
    notifyListeners();
  }

  Future<List<CalendarModel>> getAppointments({
    required String startDate,
    required String endDate,
  }) async {
    List<CalendarModel> appointments = [];

    // Fetching appointments from the service
    appointments = await CalendarServices().getAppointments(
      startDate: startDate.toString(),
      endDate: endDate,
    );

    // Clearing the previous list of appointments
    appointmentList.clear();

    // Processing the fetched appointments
    for (var element in appointments) {
      Map color = ApptStatusList.firstWhere(
        (st) => st['Code'] == element.status,
      );
      Color eventColor = Color(
        int.parse("0xff${color['Color'].toString().replaceAll("#", "")}"),
      );

      // Adding the processed appointments to the appointment list
      appointmentList.add(
        CalendarModel(
          appointmentId: element.appointmentId,
          branchId: element.branchId,
          doctorId: element.doctorId,
          patientId: element.patientId,
          status: element.status,
          startTime: element.startTime!.toLocal(),
          endTime: element.endTime!.toLocal(),
          background: eventColor,
          startTimeZone: '',
          roomId: element.roomId,
          resourceIds: <Object>[element.roomId],
          endTimeZone: '',
          description: element.description,
          isAllDay: element.isAllDay,
          patientName: element.patientName,
          doctorName: element.doctorName,
        ),
      );
    }

    // Notify listeners for UI updates
    notifyListeners();

    // Return the list of appointments
    return appointmentList;
  }

  Future<List<CalendarModel>> saveAppointment({CalendarModel? calendar}) async {
    List<CalendarModel> calendarList = [];
    try {
      calendarList = await CalendarServices().saveAppointment(
        appointment: calendar!,
      );
      appointmentList.add(calendar);
      return calendarList;
    } catch (e) {
      return calendarList;
    }
  }

  Future<bool> updateAppointmentStatus({
    String? appointmentId,
    String? newStatus,
    String? updateUserId,
  }) async {
    bool status = false;
    try {
      status = await CalendarServices().updateAppointmentStatus(
        appointmentId: appointmentId!,
        newStatus: newStatus!,
        updateUserId: updateUserId!,
      );
      return status;
    } catch (e) {
      return status;
    }
  }

  Future<bool> deleteAppointment({required String appointmentId}) async {
    bool status = false;
    try {
      status = await CalendarServices().deleteAppointment(
        appointmentId: appointmentId,
      );
      return status;
    } catch (e) {
      return status;
    }
  }

  Future<bool> sendReminder({required String appointmentId}) async {
    bool status = false;
    try {
      status = await CalendarServices().sendReminder(
        appointmentId: appointmentId,
      );
      return status;
    } catch (e) {
      return status;
    }
  }

  Future onCalendarViewChange(ViewChangedDetails v) async {
    if (calendarView == CalendarView.timelineMonth) {
      startDate = v.visibleDates[0].toUtc();
      endDate = v.visibleDates[0].toUtc().add(Duration(days: 31));
    } else if (calendarView == CalendarView.timelineWeek) {
      startDate = v.visibleDates[0].toUtc();
      endDate = v.visibleDates[0].toUtc().add(Duration(days: 7));
    } else if (calendarView == CalendarView.timelineDay) {
      startDate = v.visibleDates[0].toUtc();
      endDate = v.visibleDates[0].toUtc().add(Duration(days: 1));
    } else {
      startDate = v.visibleDates[0].toUtc();
      endDate = v.visibleDates[0].toUtc().add(Duration(days: 31));
    }
    updateAppointment();

    // Return a Future to avoid the error
    return Future.value();
  }

  void onCalendarTapped(CalendarTapDetails calendarTapDetails, context) async {
    if (calendarController.view != CalendarView.month) {
      _showDialog(context, calendarTapDetails);
    }
  }

  void onCalendarLongTapped(
    CalendarLongPressDetails calendarTapDetails,
    context,
  ) async {}

  Future<void> _showDialog(
    context,
    CalendarTapDetails calendarTapDetails,
  ) async {
    CalendarModel? calendar;
    mSelectedDate = calendarTapDetails.date;
    String roomID;

    if (calendarTapDetails.resource == null) {
      roomID = resourseRooms[0].id.toString();
    } else {
      roomID = calendarTapDetails.resource!.id.toString();
    }

    if (calendarTapDetails.appointments != null &&
        calendarTapDetails.appointments!.isNotEmpty) {
      calendar = calendarTapDetails.appointments![0];
    }

    showDialog<String>(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (calendarTapDetails.appointments != null &&
                  calendarTapDetails.appointments!.isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // Doctor Name
                        Text(
                          calendar!.patientName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Divider(height: 1),
                        SpaceHeight_M,
                        Text(
                          "${convertDateTimeFormat(calendar.startTime!)} - ${convertDateTimeFormat(calendar.endTime!)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SpaceHeight_XS,
                        Text(
                          "${S().RL3} : ${calendar.doctorName}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SpaceHeight_XS,
                        Text(
                          calendar.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        Divider(height: 1),
                      ],
                    ),
                  ),
                ),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () async {
                    isHaveData = false;
                    selectedEvent = CalendarModel();
                    selectedEvent!.startTime = mSelectedDate;
                    selectedEvent!.endTime = mSelectedDate!.add(
                      Duration(hours: 1),
                    );
                    selectedEvent!.roomId = roomID;
                    selectedEvent!.status = "AS1";
                    Navigator.of(context).pop();
                    await getListsOfData();
                    // GoTo.screen(context, AppointmentEditor());
                    notifyListeners();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      S().add_event,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              if (calendarTapDetails.appointments != null &&
                  calendarTapDetails.appointments!.isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      isHaveData = true;
                      Navigator.of(context).pop();
                      selectedEvent = calendar;
                      // GoTo.screen(context, AppointmentEditor());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        S().update_event,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              if (calendarTapDetails.appointments != null &&
                  calendarTapDetails.appointments!.isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () async {
                      EasyLoading.show(status: S().Loading);
                      bool status = await deleteAppointment(
                        appointmentId: calendar!.appointmentId,
                      );
                      if (status) {
                        updateAppointment();
                      }
                      EasyLoading.dismiss();
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        S().delete_event,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          contentPadding: EdgeInsets.all(12),
        );
      },
    );
  }

  ////////// Edit/Update Details Functions /////////////
  TextEditingController descriptionC = TextEditingController();
  List<SearchDoctorModel> allDoctorList = [];
  List<SearchPatientModel> allPatientList = [];
  List<String> statusList = [];

  getListsOfData() async {
    allDoctorList.clear();
    // allPatientList.clear();
    statusList.clear();
    allDoctorList = await CalendarServices().getAllDoctors();
    // allPatientList = await CalendarServices().searchPatient("");
    for (int i = 1; i <= 9; i++) {
      statusList.add("AS$i");
    }
    notifyListeners();
  }

  Future<List<SearchPatientModel>> searchPatient(String name) async {
    allPatientList.clear();
    allPatientList = await CalendarServices().searchPatient(name.toLowerCase());
    notifyListeners();
    return allPatientList;
  }

  updateSelectedDoctor(String docID) {
    selectedEvent!.doctorId = docID;
    notifyListeners();
  }

  updateSelectedPatient(String patientID) {
    selectedEvent!.patientId = patientID;
    notifyListeners();
  }

  updateSelectedStatus(String status) {
    selectedEvent!.status = status;
    notifyListeners();
  }

  updateSelectedRooms(CalendarResource room) {
    selectedEvent!.roomId = room.id.toString();
    selectedEvent!.roomName = room.displayName;
    notifyListeners();
  }

  updateIsAllDay(bool status) {
    selectedEvent!.isAllDay = status;
    notifyListeners();
  }

  updateStartDate(DateTime startDate) {
    selectedEvent!.startTime = startDate;
    notifyListeners();
  }

  updateEndDate(DateTime endDate) {
    selectedEvent!.endTime = endDate;
    notifyListeners();
  }

  Future changeStatus(context, status) async {
    bool s = await updateAppointmentStatus(
      appointmentId: selectedEvent!.appointmentId,
      newStatus: status,
      updateUserId: selectedEvent!.updateUserId,
    );
    if (s) {
      ToastM.show(S().OperationDoneSuccessfuly);
      selectedEvent!.status = status;
      updateAppointment();
      Navigator.of(context).pop();
    }
  }

  void handleCalendarView() {
    switch (GlobalData.accountData!.objectData.calendarView) {
      case "Day":
        calendarView = CalendarView.day;
        break;
      case "Week":
        calendarView = CalendarView.week;
        break;
      case "WorkWeek":
        calendarView = CalendarView.workWeek;
        break;
      case "Month":
        calendarView = CalendarView.month;
        break;
      case "TimelineDay":
        calendarView = CalendarView.timelineDay;
        break;
      case "TimelineWeek":
        calendarView = CalendarView.timelineWeek;
        break;
      case "timelineMonth":
        calendarView = CalendarView.timelineMonth;
        break;
      default:
        calendarView = CalendarView.timelineWeek;
    }
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<CalendarModel> source, List<CalendarResource> resourceColl) {
    appointments = source;
    resources = resourceColl;
  }

  @override
  bool isAllDay(int index) => appointments![index].isAllDay;

  @override
  String getSubject(int index) => appointments![index].patientName;

  @override
  String getStartTimeZone(int index) => appointments![index].startTimeZone;

  @override
  String getNotes(int index) => appointments![index].description;

  @override
  String getEndTimeZone(int index) => appointments![index].endTimeZone;

  @override
  Color getColor(int index) => appointments![index].background;

  @override
  DateTime getStartTime(int index) => appointments![index].startTime;

  @override
  DateTime getEndTime(int index) => appointments![index].endTime;

  @override
  List<Object> getResourceIds(int index) => appointments![index].resourceIds;

  @override
  Future<Function> handleLoadMore(DateTime startDate, DateTime endDate) async {
    try {
      // Perform any necessary logic here
      notifyListeners(CalendarDataSourceAction.add, appointments!);

      // Return a valid value that matches the return type
      return Future.value(() {}); // returns an empty function as a placeholder
    } catch (e) {
      // Handle any errors, if necessary
      throw Exception("Error loading more data: $e");
    }
  }
}
