import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavouritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context: context,
          backgroundColor: Colors.transparent,
          title: Text("Favourites"),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})]),
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(16.0), child: _favList()),
      ),
    );
  }

  Widget _favList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return RoundedCardTapable(
          onTap: () {
            Modular.to.pushNamed(Routes.categoryDetails);
          },
          cardColor: AppTheme.primaryColorLight,
          circularRadius: 10,
          content: Row(
            children: [
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("SALON NAME",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.77)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "4.9/5.0 (1229)",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              height: 1.7, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "1.4KM Away",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Image.asset(
                    "assets/visited_yoga.jpg",
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        );
      },
    );
  }
}
