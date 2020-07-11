import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChooseServiceView extends StatefulWidget {
  @override
  _ChooseServiceViewState createState() => _ChooseServiceViewState();
}

class _ChooseServiceViewState extends State<ChooseServiceView> {
  String _service = "";

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, media) => Scaffold(
          appBar: buildAppBar(
            context: context,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            title: Text("Choose Service"),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
            child: SingleChildScrollView(
                          child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // GridView.count(
                  //   shrinkWrap: true,
                  //   mainAxisSpacing: 8,
                  //   crossAxisSpacing: 16,
                  //   childAspectRatio: 1.3,
                  //   crossAxisCount: 2, 
                  Wrap(
                    spacing: 16,

                    children: [
                    ...services.map<Widget>(
                      (service) => RoundedCardTapable(
                        circularRadius: 10,
                        width: media.screenSize.width * 0.4,
                        height: 150,
                        onTap: () {
                          setState(() {
                            _service = service;
                          });
                        },
                        cardColor: _service == service
                            ? Theme.of(context).accentColor
                            : AppTheme.primaryColorLight,
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Stack(
                            children: [
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    service == "Baby Sitter" ?  "assets/Baby_Sitter.png": "assets/$service.png",
                                  )),
                              Positioned(
                                top: 20,
                                left: 16,
                                child: Text(
                                  "$service",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                //  Spacer(),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: media.screenSize.width,
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: raisedButton(
                          widget: Text(
                            "NEXT",
                          ),
                          onPressed: () async {
                            Modular.to.pushNamed(Routes.serviceDetails);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
