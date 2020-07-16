import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                   
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Salon Name",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              )),
                          TextSpan(
                              text: '  4.9/5.0 (1229)',
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.caption),
                  SizedBox(
                    height: 32,
                  ),
                  RoundedCard(
                    cardColor: AppTheme.primaryColorLight,
                    circularRadius: 10,
                    content: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("BUISNESS HOURS",
                              style: Theme.of(context).textTheme.subtitle1),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text("Monday",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                            subtitle: Text("09:30am - 10:00pm",
                                style: Theme.of(context).textTheme.caption),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text("Tuesday",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                            subtitle: Text("09:30am - 10:00pm",
                                style: Theme.of(context).textTheme.caption),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text("Wednesday",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                            subtitle: Text("09:30am - 10:00pm",
                                style: Theme.of(context).textTheme.caption),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RoundedCard(
                    cardColor: AppTheme.primaryColorLight,
                    circularRadius: 10,
                    content: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text("TELEPHONE NUMBER",
                            style: Theme.of(context).textTheme.subtitle1),
                        subtitle: Text("282-645-2732",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.phone,
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () {}),
                      ),
                    ),
                  ),
                  RoundedCard(
                    cardColor: AppTheme.primaryColorLight,
                    circularRadius: 10,
                    content: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text("ADDRESS",
                            style: Theme.of(context).textTheme.subtitle1),
                        subtitle: Text("746 ROGAN Square Suit 895",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text("AVAILABLE PROS",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold)),
                  _availablePros(context),
                   SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: raisedButton(
                        widget: Text(
                          "NEXT",
                        ),
                        onPressed: () async {
                          Modular.to.pushNamed(Routes.categoryServices);
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _availablePros(context) {
    return Wrap(
      spacing: 16,
      children: List.generate(
        3,
        (index) => RoundedCard(
          cardColor: (index % 2 != 0)
              ? AppTheme.primaryColorTint
              : AppTheme.primaryColorLight,
          circularRadius: 10,
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("LOLA GORDER",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: (index % 2 != 0)
                          ? AppTheme.primaryColorLight
                          : AppTheme.borderColor)),
              subtitle: Text("746 ROGAN Square Suit 895",
                  style: Theme.of(context).textTheme.caption.copyWith(
                      color: (index % 2 != 0)
                          ? AppTheme.primaryColors
                          : Colors.white,
                      fontWeight: FontWeight.bold)),
              trailing: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/placeholder_photo.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
