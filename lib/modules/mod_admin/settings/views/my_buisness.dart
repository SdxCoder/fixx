import 'package:client/core/core.dart';
import 'package:client/core/models/buisness_hours.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyBuisnessView extends StatefulWidget {
  @override
  _MyBuisnessViewState createState() => _MyBuisnessViewState();
}

class _MyBuisnessViewState extends State<MyBuisnessView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, media) => Scaffold(
          appBar: buildAppBar(
            context: context,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            title: Text("My Buisness"),
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
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.bold)),
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
                          ListTile(
                            title: Text(
                              "Buisness Name",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "Salon Name",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).primaryColor,
                          ),
                          ListTile(
                            title: Text(
                              "Address",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "Salon address",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).primaryColor,
                          ),
                          ListTile(
                            title: Text(
                              "Telephone Number",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "123-456-2649",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).primaryColor,
                          ),
                          ListTile(
                            title: Text(
                              "Description",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "description",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
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
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _buisnessHours(context, media),
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
