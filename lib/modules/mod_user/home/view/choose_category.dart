import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChooseCategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          automaticallyImplyLeading: true,
          context: context,
          backgroundColor: Colors.transparent,
          title: Text("Choose Salon"), // pass string value based on selection
          actions: [IconButton(icon: Icon(Icons.sort), onPressed: () {})]),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("CHOOSE A BEST SALON YOU LIKE",
                    style: Theme.of(context).textTheme.subtitle1),
                SizedBox(height: 16),
                Expanded(child: _categoryList()),
              ],
            )),
      ),
    );
  }

  Widget _categoryList() {
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
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("CAROLINE RICHARDS",
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
                flex: 3,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/visited_yoga.jpg"))),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
