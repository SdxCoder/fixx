import 'package:client/core/core.dart';
import 'package:client/modules/mod_admin/settings/view_model/settings_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

class AvailabilityView extends StatefulWidget {
  //final Booking booking;

  const AvailabilityView({
    Key key,
  }) : super(key: key);
  @override
  AvailabilityViewState createState() => AvailabilityViewState();
}

class AvailabilityViewState extends State<AvailabilityView> {
  CalendarController _calendarController;

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
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, SettingsViewModel model, child) => Scaffold(
        appBar: buildAppBar(
          context: context,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          title: Text("Availability"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RoundedCard(
                    circularRadius: 10,
                    cardColor: AppTheme.primaryColorLight,
                    content: TableCalendar(
                        initialSelectedDay: model.selectedDate,
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
                    height: 16,
                  ),
                  RoundedCard(
                    circularRadius: 10,
                    cardColor: AppTheme.primaryColorLight,
                    content: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("From",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontWeight: FontWeight.bold)),
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
                             SizedBox(
                              height: 8,
                            ),
                            Text("To",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontWeight: FontWeight.bold)),
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
                          ]),
                    ),
                  ),
                  SizedBox(height: 16),
                  RoundedCard(
                    circularRadius: 10,
                    cardColor: Colors.white,
                    content: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Availability",
                            style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: AppTheme.primaryColors,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              "An employee can turn it if he/she\nis not available on certain date",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.grey)),
                          trailing: CupertinoSwitch(
                              activeColor: Theme.of(context).accentColor,
                              value: true,
                              onChanged: (v) {})),
                    ),
                  ),

                  // model.selectedEvents.isEmpty
                  //     ? Offstage()
                  //     : Expanded(
                  //         child: _buildEventList(model),
                  //       ),
                ],
              ),
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
}
