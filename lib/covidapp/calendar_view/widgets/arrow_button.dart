import 'package:flutter/material.dart';
import 'colors.dart';
///arrow button widget for grafik
class ArrowButton extends StatelessWidget {
  final EdgeInsets margin;
  final IconButton iconbutton;
  // ignore: use_key_in_widget_constructors
  const ArrowButton({required this.margin, required this.iconbutton});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(5),
            boxShadow: AppColors.neumorpShadow),
        alignment: Alignment.center,
        child: iconbutton,
      ),
    );
  }
}
