import 'package:client/core/core.dart';
import 'package:client/core/shared_widgets/rounded_card.dart';
import 'package:client/core/shared_widgets/top_navbar.dart';
import 'package:client/core/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TopNavBar(
            actions: [
              IconButton(
                iconSize: 25,
                color: Theme.of(context).accentColor,
                icon: Icon(FontAwesome.bell_o),
                onPressed: () {},
              )
            ],
          ),
          ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("TODAY'S BOOKING",
                  style: Theme.of(context).textTheme.subtitle1),
              trailing: GestureDetector(
                  onTap: () {},
                  child: Text("View All",
                      style: Theme.of(context).textTheme.caption))),
          Expanded(child: _bookingsList()),
        ]),
      ),
    );
  }

  Widget _bookingsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return RoundedCard(
          circularRadius: 10,
          cardColor: AppTheme.primaryColorLight,
          content: ListTile(
            onTap: () {
              Modular.to.pushNamed(Routes.bookingDetails);
            },
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/placeholder_photo.jpg"),
            ),
            isThreeLine: true,
            title: Text("CAROLINE RICHARDS",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white)),
            subtitle: Text(
              "Blow Dry\n\$15",
              style: Theme.of(context).textTheme.caption,
            ),
            trailing:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "09 : 00 AM",
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "11 : 00 AM",
                style: Theme.of(context).textTheme.caption,
              ),
            ]),
          ),
        );
      },
    );
  }
}
