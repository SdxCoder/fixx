import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyContractView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, media) => Scaffold(
              appBar: buildAppBar(
                context: context,
                automaticallyImplyLeading: true,
                backgroundColor: Colors.transparent,
                title: Text("My Contract"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "No of Employees",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              subtitle: Text(
                                "8",
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
                                "Monthly Charges",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              subtitle: Text(
                                "\$75",
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
                                "Termination Date",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              subtitle: Text(
                                "01- August - 2020",
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
                                "Usage",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              subtitle: Text(
                                "2 Months",
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
                    Spacer(),
                    SizedBox(
                      width: media.screenSize.width,
                      height: 48,
                      child: raisedButton(
                          widget: Text(
                            "CANCEL CONTRACT",
                          ),
                          onPressed: ()  {}),
                    ),
                  ],
                ),
              ),
            ));
  }

    Future cancelContract() {
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "CANCEL CONTRACT",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                       SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Are you sure you want to\ncancel contract?",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                       SizedBox(
                        height: 20,
                      ),
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          raisedButton(
                              widget: Text("No"),
                              onPressed: () {
                                Modular.to.pop();
                              }),
                           raisedButton(
                              widget: Text("Cancel"),
                              onPressed: () {
                                Modular.to.pop();
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ));
  }
}
