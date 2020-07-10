import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BookingDetailView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, media) => Scaffold(
              appBar: buildAppBar(
                context: context,
                automaticallyImplyLeading: true,
                backgroundColor: Colors.transparent,
                title: Text("Booking Details"),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: RoundedCard(
                    circularRadius: 10,
                    cardColor: AppTheme.primaryColorLight,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height:16),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage("placeholder_photo.jpg"),
                          ),
                          isThreeLine: true,
                          title: Text("CAROLINE RICHARDS",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold, height: 1.77)),
                          subtitle: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Service:",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
                                    "Service By:",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
                                    "Price:",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                     SizedBox(height:16),
                                  Text(
                                    "Monday",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: AppTheme.accentColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 32,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Blow Dry",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Maria Ward",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$15",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height:16),
                                  Text(
                                    "09:00 AM - 11:00 AM",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                       ,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: media.screenSize.width,
                            height: 48,
                            child: raisedButton(
                                widget: Text(
                                  "STRIKE",
                                ),
                                onPressed: () {}),
                          ),
                        ),
                      ],
                    ),
                  )),
            ));
  }
}
