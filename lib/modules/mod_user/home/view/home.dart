import 'package:client/core/core.dart';
import 'package:client/core/shared_widgets/rating_bar.dart';
import 'package:client/core/shared_widgets/rounded_card.dart';
import 'package:client/core/shared_widgets/top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, media) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TopNavBar(
              actions: [
                IconButton(
                  iconSize: 25,
                  color: Theme.of(context).accentColor,
                  icon: Icon(FontAwesome.bell_o),
                  onPressed: () {
                    Modular.to.pushNamed(Routes.userNotifications);
                  },
                )
              ],
            ),
            ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("CHOOSE CATEGORY",
                    style: Theme.of(context).textTheme.subtitle1),
                trailing: GestureDetector(
                    onTap: () {},
                    child: Text("View All",
                        style: Theme.of(context).textTheme.caption))),
            _categoryList(context, media),
            SizedBox(height: 16),
            Text("ALREADY VISITED",
                style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height: 16),
            Expanded(child: _alreadyVistted(context, media)),
          ]),
        ),
      ),
    );
  }

  Widget _categoryList(context, media) {
    return GridView.count(
        shrinkWrap: true,
        mainAxisSpacing: 0,
        crossAxisSpacing: 16,
        childAspectRatio: 1.3,
        crossAxisCount: 3,
        // Wrap(
        //   spacing: 16,

        children: [
          ...services.getRange(0, 6).map<Widget>(
                (service) => RoundedCardTapable(
                  circularRadius: 10,
                  //  width: media.screenSize.width * 0.4,
                  height: 150,
                  onTap: () {
                    Modular.to.pushNamed(Routes.chooseCategory);
                  },
                  cardColor: colors[services.indexOf(service)],
                  content: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            right: 0,
                            width: 25,
                            height: 25,
                            child: Image.asset(
                              service == "Baby Sitter"
                                  ? "assets/Baby_Sitter.png"
                                  : "assets/$service.png",
                            )),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            "$service",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
        ]);
  }

  Widget _alreadyVistted(context, media) {
    return GridView.count(
        shrinkWrap: true,
        mainAxisSpacing: 0,
        crossAxisSpacing: 16,
        crossAxisCount: 2,
        // Wrap(spacing: 16,
        children: [
          ...services.getRange(0, 4).map<Widget>(
                (service) => Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedCardTapable(
                      circularRadius: 10,
                      onTap: () {},
                      cardColor: Colors.transparent,
                      content: Stack(
                        children: [
                          Image.asset(
                            "assets/visited_yoga.jpg",
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () {}))
                        ],
                      ),
                    ),
                    Text("SALON NAME",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  
                    RatingBar(
                      onRatingChanged: (v) {},
                      initialRating: 4,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      halfFilledIcon: Icons.star_half,
                      isHalfAllowed: true,
                      filledColor: Colors.amberAccent,
                      emptyColor: Colors.amberAccent,
                      halfFilledColor: Colors.amberAccent,
                      size: 14,
                    ),
                   
                  ],
                ),
              ),
        ]);
  }
}
