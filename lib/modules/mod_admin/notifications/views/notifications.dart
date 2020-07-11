import 'package:client/core/core.dart';
import 'package:client/modules/mod_admin/notifications/view_model/notifications_view_model.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationsViewModel>.reactive(
      viewModelBuilder: () => NotificationsViewModel(),
      builder: (context, NotificationsViewModel model, child) => Scaffold(
        appBar: buildAppBar(
          context: context,
          backgroundColor: Colors.transparent,
          title: Text("Notifications"),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _notificationsList(model)),
        ),
      ),
    );
  }

  Widget _notificationsList(NotificationsViewModel model) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.notifications.length,
      itemBuilder: (BuildContext context, int index) {
        final notification = model.notifications[index];
        if (notification.type == NotificationType.pending) {
          return _notificationTypePending(context);
        }

        if (notification.type == NotificationType.completed) {
          return _notificationTypeCompleted(context);
        }

        return _notificationTypeApproved(context);
      },
    );
  }

  Widget _notificationTypePending(context) {
    return RoundedCard(
      circularRadius: 10,
      cardColor: AppTheme.primaryColorLight,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/placeholder_photo.jpg"),
            ),
            isThreeLine: true,
            title: Text("CAROLINE RICHARDS",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.77)),
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
                    SizedBox(height: 16),
                    Text(
                      "Monday",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
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
                      "\$25",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "09:00 AM - 11:00 AM",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: raisedButton(
                      widget: Text(
                        "ACCPET",
                      ),
                      onPressed: () {}),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: raisedButton(
                      btnColor: Colors.white,
                      btnTextColor: Theme.of(context).primaryColor,
                      widget: Text(
                        "DECLINE",
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _notificationTypeApproved(context) {
    return RoundedCard(
      circularRadius: 10,
      cardColor: AppTheme.primaryColorLight,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/placeholder_photo.jpg"),
            ),
            isThreeLine: true,
            title: Text("CAROLINE RICHARDS",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.77)),
            subtitle: Text(
              "Hair Cut appointment is scheduled at 1:00 PM",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16),
              child: raisedButton(
                  btnColor: Colors.white,
                  btnTextColor: Theme.of(context).primaryColor,
                  widget: Text(
                    "CANCEL",
                  ),
                  onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }

  Widget _notificationTypeCompleted(context) {
    return RoundedCard(
      circularRadius: 10,
      cardColor: AppTheme.primaryColorLight,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/placeholder_photo.jpg"),
            ),
            title: Text("CAROLINE RICHARDS",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.77)),
            subtitle: Text(
              "Hair Cut appointment is scheduled at 1:00 PM",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
