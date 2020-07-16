import 'package:client/core/core.dart';
import 'package:client/modules/mod_user/home/view_model/booking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingsView extends StatefulWidget {

  const BookingsView({
    Key key,
  }) : super(key: key);
  @override
  BookingsViewViewState createState() => BookingsViewViewState();
}

class BookingsViewViewState extends State<BookingsView> {
  CalendarController _calendarController;
  Booking _selectedBooking = Booking();

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
          backgroundColor: Colors.transparent,
          title: Text("Bookings"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectedBookingWidget(Booking b) {
    return RoundedCard(
      circularRadius: 5,
      borderSide: BorderSide(
        color: AppTheme.accentColor,
      ),
      cardColor: AppTheme.accentColor.withOpacity(0.1),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(b.customerName, style: Theme.of(context).textTheme.caption),
            SizedBox(height: 4),
            Text(b.serviceName, style: Theme.of(context).textTheme.caption),
            Text(b.duration, style: Theme.of(context).textTheme.caption),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 30,
                child: raisedButton(
                  btnText: "Cancel",
                  btnColor: AppTheme.accentColor,
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
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
                        leading: Text(b.slot.format(context).padLeft(8, "0"),
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(fontWeight: FontWeight.bold)),
                        title: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedBooking = b;
                            });
                          },
                          child: _selectedBooking.slot == b.slot
                              ? _selectedBookingWidget(b)
                              : RoundedCard(
                                  circularRadius: 5,
                                  cardColor: AppTheme.primaryColors,
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(b.customerName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption),
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                      ))
                  .toList(),
              ListTile(
                leading: Offstage(),
                title: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: raisedButton(
                      btnText: "Book Appointment",
                      btnColor: AppTheme.accentColor,
                      onPressed: () async {
                        await showBookAppointmentDialog();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showBookAppointmentDialog() {
    return showDialog(
        context: Modular.navigatorKey.currentState.overlay.context,
        builder: (context) => Dialog(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: 500,
                margin: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "BOOK AN APPOINTMENT",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      RoundedCard(
                        cardColor: AppTheme.primaryColorLight,
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              TextFieldCustom(
                                backgroundColor: Colors.transparent,
                                hintText: "Customer Name",
                                prefixIconData: Icons.email,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              DropDownField(
                                valueColor: AppTheme.borderColor,
                                hintTextColor: AppTheme.borderColor,
                                onChanged: (value) {},
                                collection: ["Blow Dry", "Make Up"],
                                dropDownColor: AppTheme.primaryColorLight,
                                borderSide: BorderSide(
                                    color: AppTheme.borderColor, width: 0.2),
                                hintText: "Select Service",
                                backgrounColor: Colors.transparent,
                                defaultIconColor: AppTheme.accentColor,
                                value: null,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              DropDownField(
                                valueColor: AppTheme.borderColor,
                                hintTextColor: AppTheme.borderColor,
                                onChanged: (value) {},
                                collection: ["09:00am", "10:00am"],
                                dropDownColor: AppTheme.primaryColorLight,
                                borderSide: BorderSide(
                                    color: AppTheme.borderColor, width: 0.2),
                                hintText: "Select Time",
                                backgrounColor: Colors.transparent,
                                defaultIconColor: AppTheme.accentColor,
                                value: null,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: raisedButton(
                            widget: Text("BOOK APPOINTMENT"),
                            onPressed: () {
                              Modular.to.pop();
                            }),
                      ),
                    ]),
              ),
            ));
  }
}
