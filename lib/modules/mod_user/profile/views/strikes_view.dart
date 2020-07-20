import 'package:client/core/core.dart';
import 'package:flutter/material.dart';

class UserStrikesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        title: Text("Strikes"),
      ),
      body: SafeArea(
        child:
            Padding(padding: const EdgeInsets.all(16.0), child: _strikesList()),
      ),
    );
  }

  Widget _strikesList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
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
                  "2 Strikes",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: AppTheme.accentColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
