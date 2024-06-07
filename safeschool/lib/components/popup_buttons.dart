import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:safeschool/Utilities/colors_use.dart';

class SecondaryButton extends StatefulWidget {
  final String name;
  final Color primary;
  final Color textColor;
  final bool borderColor;

  const SecondaryButton({
    Key? key,
    required this.name,
    required this.primary,
    required this.textColor,
    this.borderColor = false,
  }) : super(key: key);

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color onPrimary = widget.primary.withOpacity(_isPressed ? 0.9 : 1.0);

    return Center(
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.transparent, // Ensures the splash effect is visible
        child: InkWell(
          splashFactory: InkRipple.splashFactory,
          customBorder: const StadiumBorder(),
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 44,
            width: 243,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: onPrimary,
              border: widget.borderColor
                  ? Border.all(color: ColorsUse.accentColor, width: 2.0)
                  : null,
            ),
            child: Center(
              child: Text(
                widget.name,
                style: TextUse.heading_3().copyWith(color: widget.textColor),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
