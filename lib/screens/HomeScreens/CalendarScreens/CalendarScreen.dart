import 'package:denta_soft/controllers/mCalendarController.dart';
import 'package:denta_soft/widgets/OnceFutureBuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MCalendarController>(
      builder: (_, model, child) {
        return Scaffold(
          body: OnceFutureBuilder(
            future: () => model.getData(),
            builder: (ctx, snapShot) {
              if (snapShot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              }
              return SfCalendar(
                controller: model.calendarController,
                view: model.calendarView,
                allowedViews: [
                  CalendarView.day,
                  CalendarView.week,
                  CalendarView.workWeek,
                  CalendarView.month,
                  CalendarView.timelineDay,
                  CalendarView.timelineWeek,
                  CalendarView.timelineWorkWeek,
                  CalendarView.timelineMonth,
                ],
                onSelectionChanged: (v) {
                  // print(v.toString());
                },
                dataSource: model.events,
                onTap: (details) => model.onCalendarTapped(details, context),
                onLongPress:
                    (details) => model.onCalendarLongTapped(details, context),
                onViewChanged: (v) => model.onCalendarViewChange(v),
                loadMoreWidgetBuilder: (
                  BuildContext context,
                  LoadMoreCallback getAppointments,
                ) {
                  return FutureBuilder<void>(
                    future: getAppointments(),
                    builder: (context, snapShot) {
                      return Container(
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                          backgroundColor: Colors.grey,
                        ),
                      );
                    },
                  );
                },
                showNavigationArrow: true,
                showCurrentTimeIndicator: true,

                initialDisplayDate: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  0,
                  0,
                  0,
                ),
                monthViewSettings: MonthViewSettings(
                  showAgenda: true,
                  // agendaViewHeight: 200,
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                  appointmentDisplayCount: 2,
                ),
                timeSlotViewSettings: TimeSlotViewSettings(
                  timelineAppointmentHeight: 30,
                  timeIntervalWidth: 100,
                  // timeIntervalHeight: 50,
                  // timeRulerSize: 40,
                  startHour: 0,
                  endHour: 24,
                  dateFormat: 'd',
                  dayFormat: 'E',
                  minimumAppointmentDuration: const Duration(minutes: 15),
                ),
                resourceViewSettings: ResourceViewSettings(
                  visibleResourceCount: model.resourseRooms.length,
                  size: 70,
                  showAvatar: false,
                  displayNameTextStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
