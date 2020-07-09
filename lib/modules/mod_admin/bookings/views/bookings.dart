import 'package:client/core/core.dart';
import 'package:client/modules/mod_admin/bookings/view_model/bookings_view_model.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingsView extends StatefulWidget {
  //final Booking booking;

  const BookingsView({
    Key key,
  }) : super(key: key);
  @override
  BookingsViewViewState createState() => BookingsViewViewState();
}

class BookingsViewViewState extends State<BookingsView>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  initState() {
    super.initState();

    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
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
          title: Text("Booking Details"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TableCalendar(
                    initialSelectedDay: model.selectedDate,
                    events: model.events,
                    calendarController: _calendarController,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      selectedColor: Colors.blue[400],
                      todayColor: Colors.blue[200],
                      markersColor: Colors.blue.withOpacity(0.5),
                      outsideDaysVisible: true,
                      holidayStyle: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.blue),
                      outsideHolidayStyle:
                          Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.blue,
                              ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonTextStyle: TextStyle()
                          .copyWith(color: Colors.white, fontSize: 16),
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onDaySelected: (dateTime, events) {
                      model.selectDate(dateTime, events);
                    }),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: _buildEventList(model),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventList(BookingsViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // (model.selectedEvents.isEmpty)
          //     ? Offstage()
          //     : Text(
          //         "Available Slots",
          //         style: subtitle1.copyWith(fontWeight: FontWeight.bold),
          //       ),
          SizedBox(
            height: 16,
          ),
          GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 2.0,
              shrinkWrap: true,
              children: model.selectedEvents
                  .map<Widget>((e) => RoundedCard(
                        cardColor: AppTheme.primaryColorLight,
                        content: Text("aksa"),
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
