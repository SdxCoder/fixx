import 'package:client/core/core.dart';
import 'package:client/core/models/buisness_hours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddServiceView extends StatefulWidget {
  @override
  _AddServiceViewState createState() => _AddServiceViewState();
}

class _AddServiceViewState extends State<AddServiceView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, media) => Scaffold(
          appBar: buildAppBar(
            context: context,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            title: Text("Service Details"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text("Buisness Details",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.bold)),
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
                        children: [
                          TextFieldCustom(
                            backgroundColor: Colors.transparent,
                            hintText: "Buisness Name",
                          ),
                           SizedBox(height:8),
                          TextFieldCustom(
                            backgroundColor: Colors.transparent,
                            hintText: "Address",
                          ),
                           SizedBox(height:8),
                          TextFieldCustom(
                            backgroundColor: Colors.transparent,
                            hintText: "Telephone No",
                          ),

                           SizedBox(height:8),
                          TextFieldCustom(
                            backgroundColor: Colors.transparent,
                            hintText: "Description",
                          ),
                          // ListTile(
                          //   title: Text("Buisness Name",
                          //       style: Theme.of(context).textTheme.bodyText1),
                          //   subtitle: Text("Salon Name",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .caption
                          //           .copyWith(
                          //               fontWeight: FontWeight.bold,
                          //               color: Colors.white)),
                          // ),
                          // Divider(
                          //   color: Theme.of(context).primaryColor,
                          // ),
                          // ListTile(
                          //   title: Text("Address",
                          //       style: Theme.of(context).textTheme.bodyText1),
                          //   subtitle: Text("30 Expansion apt.39",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .caption
                          //           .copyWith(
                          //               fontWeight: FontWeight.bold,
                          //               color: Colors.white)),
                          // ),
                          // Divider(
                          //   color: Theme.of(context).primaryColor,
                          // ),
                          // ListTile(
                          //   title: Text("Telephone Number",
                          //       style: Theme.of(context).textTheme.bodyText1),
                          //   subtitle: Text("623-123-098",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .caption
                          //           .copyWith(
                          //               fontWeight: FontWeight.bold,
                          //               color: Colors.white)),
                          // ),
                          // Divider(
                          //   color: Theme.of(context).primaryColor,
                          // ),
                          // ListTile(
                          //   title: Text("Description",
                          //       style: Theme.of(context).textTheme.bodyText1),
                          //   subtitle: Text("salon description and details",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .caption
                          //           .copyWith(
                          //               fontWeight: FontWeight.bold,
                          //               color: Colors.white)),
                          // ),
                          // Divider(
                          //   color: Theme.of(context).primaryColor,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text("Buisness Hours",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _buisnessHours(context, media),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: media.screenSize.width,
                    height: 48,
                    child: raisedButton(
                        widget: Text(
                          "NEXT",
                        ),
                        onPressed: () async {
                          Modular.to.pushNamed(Routes.addEmployee);
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buisnessHours(context, SizingInformation media) {
    return RoundedCard(
        circularRadius: 10,
        cardColor: AppTheme.primaryColorLight,
        content: Column(
          children: [
            ...businessHoursList
                .map<Widget>((buisnessHours) => _eachDay(media, buisnessHours)),
          ],
        ));
  }

  Widget _eachDay(media, BuisnessHours buisnessHour) {
    return Column(
      children: [
        ListTile(
          dense: true,
          title: Text(buisnessHour.day,
              style: Theme.of(context).textTheme.bodyText1),
          trailing: IconButton(
              icon: Icon(Icons.add, color: Theme.of(context).accentColor),
              onPressed: () {
                // add item to actual list
              }),
        ),
        Row(
          children: [
            SizedBox(
              width: media.screenSize.width * 0.4,
              child: ListTile(
                dense: true,
                onTap: () async {
                  var timeOfDay = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());

                  int index = businessHoursList.indexOf(buisnessHour);

                  setState(() {
                    businessHoursList[index].from = timeOfDay.format(context);
                  });
                },
                title:
                    Text("From", style: Theme.of(context).textTheme.bodyText1),
                subtitle: Text(buisnessHour.from,
                    style: Theme.of(context).textTheme.caption.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            SizedBox(
              width: media.screenSize.width * 0.4,
              child: ListTile(
                onTap: () async {
                  var timeOfDay = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());

                  int index = businessHoursList.indexOf(buisnessHour);

                  setState(() {
                    businessHoursList[index].to = timeOfDay.format(context);
                  });
                },
                dense: true,
                title: Text("To", style: Theme.of(context).textTheme.bodyText1),
                subtitle: Text(buisnessHour.to,
                    style: Theme.of(context).textTheme.caption.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
