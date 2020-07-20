import 'package:flutter/material.dart';

import '../utils/appTheme.dart';

class TextFieldCustom extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final String Function(String) validator;
  final Function onFieldSubmit;
  final String hintText;
  final Function onTapSuffixIcon;
  final Function onTapPrefixIcon;
  final IconData suffixIconData;
  final IconData prefixIconData;
  final FocusNode focusNode;
  final Color backgroundColor;
  final Color hintTextColor;
  final Color cursorColor;
  final Color textColor;
  final Color prefixIconColor;
  final Color sufixIconColor;
  final Widget prefixWidget;
  final TextInputType inputType;
  final bool obscureText;

  const TextFieldCustom({
    Key key,
    this.title,
    this.controller,
    this.validator,
    this.onFieldSubmit,
    this.hintText,
    this.onTapSuffixIcon,
    this.suffixIconData,
    this.prefixIconData,
    this.onTapPrefixIcon,
    this.focusNode,
    this.backgroundColor,
    this.hintTextColor = const Color(0xffd3d3d3),
    this.cursorColor =const Color(0xffd3d3d3),
    this.textColor = const Color(0xffd3d3d3),
    this.prefixIconColor = const Color(0xffd3d3d3),
    this.sufixIconColor =const Color(0xffd3d3d3), this.prefixWidget, this.inputType = TextInputType.text, this.obscureText = false,
  }) : super(key: key);

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldCustom> {
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        obscureText: widget.obscureText,
        keyboardType: widget.inputType,
        focusNode: widget.focusNode,
        validator: widget.validator,
        cursorWidth: 1,
        cursorColor: widget.cursorColor,
        autofocus: false,
        controller: widget.controller,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(decoration: TextDecoration.none, color: widget.textColor),
        onFieldSubmitted: widget.onFieldSubmit,
        decoration: InputDecoration(
            hoverColor: Colors.white,
            labelText: widget.title,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: widget.hintTextColor),
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.w300, color: widget.hintTextColor),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            suffixIcon: widget.suffixIconData == null
                ? null
                : GestureDetector(
                    onTap: widget.onTapSuffixIcon,
                    child: Icon(
                      widget.suffixIconData,
                      color: widget.sufixIconColor,
                    ),
                  ),
            prefixIcon: widget.prefixWidget != null ? widget.prefixWidget  : widget.prefixIconData == null
                ? null
                : GestureDetector(
                    onTap: widget.onTapPrefixIcon,
                    child: Icon(
                      widget.prefixIconData,
                      color: widget.prefixIconColor,
                    ),
                  ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppTheme.borderColor, ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppTheme.borderColor, width: 0.2),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppTheme.borderColor, width: 0.2),
            )),
      ),
    );
  }
}
