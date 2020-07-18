import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryServicesView extends StatefulWidget {
  @override
  _CategoryServicesViewState createState() => _CategoryServicesViewState();
}

class _CategoryServicesViewState extends State<CategoryServicesView> {
  String _selectedService = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          automaticallyImplyLeading: true,
          context: context,
          backgroundColor: Colors.transparent,
          title: Text("Salon Services"), // pass string value based on selection
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.location_on), onPressed: () {})
          ]),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Services",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                Expanded(child: _servicesList()),
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
                          Modular.to.pushNamed(Routes.bookAppointment);
                        }),
                  ),
              ],
            )),
      ),
    );
  }

  Widget _servicesList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return RoundedCardTapable(
          onTap: () {
            setState(() {
              _selectedService = "$index";
            });
          },
          cardColor: _selectedService == "$index"
              ? AppTheme.primaryColorTint
              : AppTheme.primaryColorLight,
          circularRadius: 10,
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("LOLA GORDER",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: _selectedService == "$index"
                          ? AppTheme.primaryColorLight
                          : AppTheme.borderColor)),
              subtitle: Text("746 ROGAN Square Suit 895",
                  style: Theme.of(context).textTheme.caption.copyWith(
                      color: _selectedService == "$index"
                          ? AppTheme.primaryColors
                          : Colors.white,
                      fontWeight: FontWeight.bold)),
              trailing: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/placeholder_photo.jpg"),
              ),
            ),
          ),
        );
      },
    );
  }
}
