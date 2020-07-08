import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class AuthView extends StatelessWidget {
  final Widget formCard;
  final AppBar appBar;
  final model;

  const AuthView(
      {Key key,
      this.formCard,
      this.model, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, media) => Scaffold(
        appBar: appBar,
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: formCard)
          ],
        ),
      ),
    );
  }

}
