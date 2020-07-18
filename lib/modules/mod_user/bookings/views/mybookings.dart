import 'package:client/core/core.dart';
import 'package:client/modules/mod_user/bookings/view_model/bookings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:stacked/stacked.dart';

class MyBookingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyBookingsViewModel>.reactive(
      viewModelBuilder: () => MyBookingsViewModel(),
      builder: (context, MyBookingsViewModel model, child) => Scaffold(
        appBar: buildAppBar(
            context: context,
            backgroundColor: Colors.transparent,
            title: Text("MY Bookings"),
            actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})]),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0), child: _bookingsList(model)),
        ),
      ),
    );
  }

  Widget _bookingsList(MyBookingsViewModel model) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.bookings.length,
      itemBuilder: (BuildContext context, int index) {
        final booking = model.bookings[index];
        if (booking.status == BookingsType.upcoming) {
          return _bookingUpcoming(context);
        }

        return _bookingPast(context);
      },
    );
  }

  Widget _bookingUpcoming(context) {
    return RoundedCard(
      circularRadius: 10,
      cardColor: AppTheme.primaryColorLight,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height:16),
          Divider(
            color: AppTheme.borderColor,
             height: 0,
          ),
          Text(
            "UP COMIMNG",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Divider(
            color: AppTheme.borderColor,
            height: 0,
          ),
          SizedBox(height: 16),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/visited_yoga.jpg"),
            ),
            isThreeLine: true,
            title: Text("UPTO",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.77)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nancy Lee",
                  style: Theme.of(context).textTheme.caption,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesome.calendar_o,
                      size: 10,
                    ),
                    Text(
                      " 15 Sep",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Icon(
                      FontAwesome.times_circle_o,
                      size: 10,
                    ),
                    Text(
                      " 4:45pm",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: raisedButton(
              btnColor: AppTheme.primaryColorTint,
              btnText: "Cancel",
              btnTextColor: AppTheme.primaryColors,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _bookingPast(context) {
    return RoundedCard(
      circularRadius: 10,
      cardColor: AppTheme.primaryColorLight,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         SizedBox(height:16),
          Divider(
            color: AppTheme.borderColor,
             height: 0,
          ),
          Text(
            "PAST",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Divider(
            color: AppTheme.borderColor,
            height: 0,
          ),
          SizedBox(height: 16),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/visited_yoga.jpg"),
            ),
            isThreeLine: true,
            title: Text("UPTO",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.77)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nancy Lee",
                  style: Theme.of(context).textTheme.caption,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesome.calendar_o,
                      size: 10,
                    ),
                    Text(
                      " 15 Sep",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Icon(
                      FontAwesome.times_circle_o,
                      size: 10,
                    ),
                    Text(
                      " 4:45pm",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: raisedButton(
              btnColor: AppTheme.accentColor,
              btnText: "BOOK AGAIN",
              btnTextColor:  Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

 
}
