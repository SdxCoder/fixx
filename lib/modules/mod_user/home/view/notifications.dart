import 'package:client/core/core.dart';
import 'package:flutter/material.dart';

class UserNotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context: context,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          title: Text("Notifications"),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})]),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0), child: _notificationsList()),
      ),
    );
  }

  Widget _notificationsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return RoundedCard(
          circularRadius: 10,
          cardColor: AppTheme.primaryColorLight,
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
             contentPadding: EdgeInsets.zero,
                  title: Text("WED, 06 JULY 2020",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.77)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Salon Name",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        "Give Ratings to the Salon",
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
