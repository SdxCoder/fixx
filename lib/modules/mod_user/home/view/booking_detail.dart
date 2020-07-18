import 'package:client/core/core.dart';
import 'package:client/modules/mod_user/home/view_model/booking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({
    Key key,
  }) : super(key: key);
  @override
  BookAppointmentViewState createState() => BookAppointmentViewState();
}

class BookAppointmentViewState extends State<BookAppointmentView> {
  CalendarController _calendarController;
  String _selectedSlot = "";

  @override
  initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingsViewModel>.reactive(
      viewModelBuilder: () => BookingsViewModel(),
      onModelReady: (model) {
        model.mapEvents();
      },
      builder: (context, BookingsViewModel model, child) => Scaffold(
        appBar: buildAppBar(
          context: context,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          title: Text("Book Appointment"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RoundedCard(
                  circularRadius: 10,
                  cardColor: AppTheme.primaryColorLight,
                  content: TableCalendar(
                      initialSelectedDay: model.selectedDate,
                      events: model.events,
                      calendarController: _calendarController,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: Theme.of(context).textTheme.bodyText1,
                        weekendStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                      calendarStyle: CalendarStyle(
                        markersMaxAmount: 1,
                        selectedColor: Theme.of(context).accentColor,
                        todayColor: Theme.of(context).primaryColor,
                        markersColor: Theme.of(context).accentColor,
                        outsideDaysVisible: true,
                        weekdayStyle: Theme.of(context).textTheme.caption,
                        weekendStyle: Theme.of(context).textTheme.caption,
                        holidayStyle: Theme.of(context).textTheme.caption,
                        outsideHolidayStyle:
                            Theme.of(context).textTheme.caption,
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonShowsNext: false,
                        formatButtonTextStyle: TextStyle()
                            .copyWith(color: Colors.white, fontSize: 16),
                        formatButtonDecoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onDaySelected: (dateTime, events) {
                        model.selectDate(dateTime, events);
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                model.selectedEvents.isEmpty
                    ? Offstage()
                    : Expanded(
                        child: _buildEventList(model),
                      ),
                SizedBox(
                  height: 20,
                ),
                    model.selectedEvents.isEmpty
                    ? Offstage() :
                SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  child: raisedButton(
                    btnText: "Next",
                    btnColor: AppTheme.accentColor,
                    onPressed: () {
                      Modular.to.pushNamed(Routes.orderSummary);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectedBookingWidget(String b) {
    return RoundedCard(
      circularRadius: 5,
      borderSide: BorderSide(
        color: AppTheme.accentColor,
      ),
      cardColor: AppTheme.accentColor.withOpacity(0.1),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Center(child: Text(b, style: Theme.of(context).textTheme.caption)),
      ),
    );
  }

  Widget _buildEventList(BookingsViewModel model) {
    return RoundedCard(
      circularRadius: 10,
      cardColor: AppTheme.primaryColorLight,
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...model.selectedEvents
                  .map<Widget>((b) => ListTile(
                        title: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSlot = b;
                            });
                          },
                          child: _selectedSlot == b
                              ? _selectedBookingWidget(b)
                              : RoundedCard(
                                  circularRadius: 5,
                                  cardColor: AppTheme.primaryColors,
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16),
                                    child: Center(
                                      child: Text(b,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ),
                                  ),
                                ),
                        ),
                      ))
                  .toList(),
              // ListTile(
              //   leading: Offstage(),
              //   title: SizedBox(
              //     width: MediaQuery.of(context).size.width,
              //     height: 48,
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 16.0),
              //       child: raisedButton(
              //         btnText: "Book Appointment",
              //         btnColor: AppTheme.accentColor,
              //         onPressed: () async {
              //           await showBookAppointmentDialog();
              //         },
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
