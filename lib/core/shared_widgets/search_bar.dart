import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';


class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String) onSubmit;
  final Function onEditingComplete;

  const SearchBar(
      {Key key,
      this.controller,
      this.onChanged,
      this.onSubmit,
      this.onEditingComplete})
      : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) => Container(
        height: 48,
        width: sizingInfo.screenSize.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          cursorWidth: 1,
          cursorColor: Theme.of(context).primaryColor,
          autofocus: false,
          controller: widget.controller,
          style: Theme.of(context).accentTextTheme.bodyText2,
          onFieldSubmitted: widget.onSubmit,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          decoration: InputDecoration(
              hintText: "Buscar Restaurante",
              hintStyle: Theme.of(context)
                  .accentTextTheme
                  .bodyText2
                  .copyWith(fontWeight: FontWeight.w300),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              prefixIcon: Icon(
                Icons.search,
                size: 16,
                color: Theme.of(context).accentColor,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
