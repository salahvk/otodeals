import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class RedContainer extends StatelessWidget {
  const RedContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colormanager.buttonBox,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: IntrinsicWidth(
            child: Center(
                child: Text(
              text,
              style:
                  getMediumtStyle(color: Colormanager.buttonText, fontSize: 10),
            )),
          ),
        ),
      ),
    );
  }
}
