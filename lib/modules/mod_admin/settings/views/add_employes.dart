import 'package:client/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SettingsAddEmployeeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        title: Text("Add Employee"),
      ),
 
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16), child: Column(
              children: [
                Expanded(child: _eomployeesList()),
                RoundedCard(
                  circularRadius: 10,
                  cardColor: Colors.white,
                  content: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Add Another Employee",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: AppTheme.primaryColors, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Add another employee if you have\nmultiple services",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.grey)),
                      trailing: IconButton(
                          icon: Icon(Icons.add, color: AppTheme.accentColor),
                          onPressed: () {
                            Modular.to.pushNamed(Routes.addEmployee);
                          }),
                    ),
                  ),
                ),

              ],
            )),
      ),
    );
  }

  Widget _eomployeesList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          secondaryActions: <Widget>[
            RoundedCard(
              circularRadius: 10,
              cardColor: Colors.transparent,
              content: IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete_outline,
                  onTap: () {}),
            ),
          ],
          child: RoundedCard(
            circularRadius: 10,
            cardColor: AppTheme.primaryColorLight,
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      isThreeLine: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text("CAROLINE RICHARDS",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.77)),
                      subtitle: Text("demo[at]demo[dot]com\n112-345-2836",
                          style: Theme.of(context).textTheme.caption)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Show employees on service page",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      CupertinoSwitch(
                          activeColor: Theme.of(context).accentColor,
                          value: true,
                          onChanged: (v) {})
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
