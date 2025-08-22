import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/utils/app_style.dart';

class DrawerIteme extends StatelessWidget {
  const DrawerIteme({super.key, required this.text, required this.iconsName});
  final String text;
  final String iconsName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconsName,
          height: 24,
          width: 24,
          fit: BoxFit.scaleDown,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: AppStyle.bold20white,
        )
      ],
    );
  }
}
