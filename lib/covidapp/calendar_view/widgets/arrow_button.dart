// import 'package:covidapp/covidapp/content/size.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class ArrowButton extends StatelessWidget {
  final EdgeInsets margin;
  final IconButton iconbutton;
  // ignore: use_key_in_widget_constructors
  const ArrowButton({required this.margin, required this.iconbutton});
  @override
  Widget build(BuildContext context) {
    //var height = SizeConfig.getHeight(context);
    //var width = SizeConfig.getWidth(context);
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
