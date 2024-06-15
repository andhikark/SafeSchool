import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';

class PrimaryButton extends StatefulWidget {
  final String name;
  final Color primary;
  final Color textColor;
  final bool borderColor;

  const PrimaryButton({
    Key? key,
    required this.name,
    required this.primary,
    required this.textColor,
    this.borderColor = false,
  }) : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color onPrimary = widget.primary.withOpacity(_isPressed ? 0.9 : 1.0);

    return Center(
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.transparent, // Ensures the splash effect is visible
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          splashColor: Colors.white,
          onTapDown: (_) {
            setState(() {
              _isPressed = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              _isPressed = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _isPressed = false;
            });
          },
          onTap: () {
            // Add your onTap functionality here
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: onPrimary,
              border: widget.borderColor
                  ? Border.all(color: ColorsUse.accentColor, width: 2.0)
                  : null,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 57,
              width: 305,
              child: Center(
                child: Text(
                  widget.name,
                  style: TextUse.heading_2().copyWith(color: widget.textColor),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
