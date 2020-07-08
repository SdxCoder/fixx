import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddServiceDetailsView extends StatefulWidget {
  @override
  _AddServiceDetailsViewState createState() => _AddServiceDetailsViewState();
}

class _AddServiceDetailsViewState extends State<AddServiceDetailsView> {
  String _service = "";

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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("Buisness Details",
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color:Colors.white
                            )),
                SizedBox(height: 16,),
                RoundedCard(
                  circularRadius: 10,
                  cardColor: AppTheme.primaryColorLight,
                  content: Column(
                    children: [
                      
                      ListTile(
                        title: Text("Buisness Name",
                            style: Theme.of(context).textTheme.bodyText1),
                        subtitle: Text("Salon Name",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Divider(
                        color: Theme.of(context).primaryColor,
                      ),
                      ListTile(
                        title: Text("Address",
                            style: Theme.of(context).textTheme.bodyText1),
                        subtitle: Text("30 Expansion apt.39",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Divider(
                        color: Theme.of(context).primaryColor,
                      ),
                       ListTile(
                        title: Text("Telephone Number",
                            style: Theme.of(context).textTheme.bodyText1),
                        subtitle: Text("623-123-098",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Divider(
                        color: Theme.of(context).primaryColor,
                      ),
                       ListTile(
                        title: Text("Description",
                            style: Theme.of(context).textTheme.bodyText1),
                        subtitle: Text("salon description and details",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Divider(
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
