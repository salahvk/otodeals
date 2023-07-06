import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          color: Colormanager.buttonBox,
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
            child: Text(
          text,
          style: getMediumtStyle(color: Colormanager.buttonText, fontSize: 10),
        )),
      ),
    );
  }
}
