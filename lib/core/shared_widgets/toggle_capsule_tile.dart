import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final slot;
  final Color titleColor;
  final Function(dynamic) onSelection;
  final Function(dynamic) onCancelSelection;
  final Color selectedFillColor;
  final Color unSelectedFillColor;
  final Color selectedTextColor;

  final Widget content;

  ToggleButton({
    Key key,
    this.slot,
    this.titleColor,
    this.onSelection,
    this.onCancelSelection,
    this.content,
    this.selectedFillColor = Colors.blue,
    this.unSelectedFillColor,
    this.selectedTextColor = Colors.white,
  }) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected;
        });

        if (_isSelected == true) {
          widget.onSelection(widget.slot);
        }

        if (_isSelected == false) {
          widget.onCancelSelection(widget.slot);
        }
      },
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      constraints: BoxConstraints(),
      elevation: 0,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      hoverElevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      child: Text(widget.slot.toString(),
          style: Theme.of(context).textTheme.caption.copyWith(
              color: _isSelected
                  ? widget.selectedTextColor
                  : widget.selectedFillColor)),
      fillColor: _isSelected
          ? widget.selectedFillColor
          : (widget.unSelectedFillColor ??
              widget.selectedFillColor.withOpacity(0.3)),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}
