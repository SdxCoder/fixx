import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderSummaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          automaticallyImplyLeading: true,
          context: context,
          backgroundColor: Colors.transparent,
          title: Text("Order Summary"),
        ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              RoundedCard(
                cardColor: AppTheme.primaryColorLight,
                circularRadius: 10,
                content: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "WEDNESDAY, MARCH 15TH",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold, ),
                      ),
                      Text(
                        "08:30 am",
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: AppTheme.accentColor,
                              height: 1.7171
                            ),
                      ),
                      Text("123 5th Avenue",
                          style: Theme.of(context).textTheme.bodyText2),
                      Divider(color: AppTheme.borderColor),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "UPTO",
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$120",
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Lola Gardner",
                            style: Theme.of(context).textTheme.caption),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",
                                style: Theme.of(context).textTheme.caption),
                            Text("\$120",
                                style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tax(4.5%)",
                                style: Theme.of(context).textTheme.caption),
                            Text("\$6", style: Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                        SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TOTAL",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$126",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
                SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  child: raisedButton(
                    btnText: "BOOK APPOINTMENT",
                    btnColor: AppTheme.accentColor,
                    onPressed: () {
                      Modular.to.pushNamed(Routes.orderConfrimed);
                    },
                  ),
                ),
            ],
          )),
    );
  }
}
