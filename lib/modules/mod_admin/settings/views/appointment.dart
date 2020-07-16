import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppointmentView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, media) => Scaffold(
              appBar: buildAppBar(
                context: context,
                automaticallyImplyLeading: true,
                backgroundColor: Colors.transparent,
                title: Text("Appointment Period"),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          "Specify your appointment period in which you want to\nprovide your services e.g 8am - 8pm",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption),
                      SizedBox(height: 16),
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
                    ],
                  )),
            ));
  }
}
