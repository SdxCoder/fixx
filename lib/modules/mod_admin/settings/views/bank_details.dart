import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BankDetailsView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, media) => Scaffold(
              appBar: buildAppBar(
                context: context,
                automaticallyImplyLeading: true,
                backgroundColor: Colors.transparent,
                title: Text("Bank Details"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.accentColor,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          leading: Icon(FontAwesome.bank, color:Colors.white),
                          isThreeLine: true,
                          trailing: GestureDetector(
                            child: Text(
                              "Edit",
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.white,
                                      ),
                            ),
                          ),
                          title: Text(
                            "Bank of america",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "XXXX-XXXX-1234",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              Text(
                                "US Dollar",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Available amount",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                           Text(
                            "\$325",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: media.screenSize.width,
                      height: 48,
                      child: raisedButton(
                          widget: Text(
                            "WITHDRAW",
                          ),
                          onPressed: () {}),
                    ),
                    Spacer(),
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: Colors.white,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Add a Bank Account",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    color: AppTheme.primaryColors,
                                    fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              "Add a bank account to withdraw amount",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.grey)),
                          trailing: IconButton(
                              icon:
                                  Icon(Icons.add, color: AppTheme.accentColor),
                              onPressed: () {}),
                        ),
                      ),
                    ),
                     SizedBox(height: 8),
                     RoundedCard(
                      circularRadius: 10,
                      cardColor: Colors.white,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Add a Paypal Account",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    color: AppTheme.primaryColors,
                                    fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              "Add a paypal account to withdraw amount",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.grey)),
                          trailing: IconButton(
                              icon:
                                  Icon(Icons.add, color: AppTheme.accentColor),
                              onPressed: () {}),
                        ),
                      ),
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
