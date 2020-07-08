
import 'package:flutter/material.dart';


Widget buildAppBar(
    {BuildContext context,
    Widget title,
    List<Widget> actions = const [],
    bool centerTitle= true,
    Widget leading,
    IconThemeData iconThemeData,
    Color backgroundColor,
    bool automaticallyImplyLeading = false,
    PreferredSizeWidget bottom
   }) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: backgroundColor,
    title: title,
    centerTitle: centerTitle,
    leading: leading,
    iconTheme: iconThemeData  ?? Theme.of(context).iconTheme,
    actionsIconTheme: Theme.of(context).iconTheme,
    automaticallyImplyLeading: automaticallyImplyLeading,
    bottom: bottom,
    actions: actions 
  );
}
