import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class RedContainer extends StatelessWidget {
 RedContainer({super.key, required this.text,this.israting=false});
  final String text;
  bool israting;
  @override
  Widget build(BuildContext context) {
    String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colormanager.buttonBox,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: IntrinsicWidth(
            child: Row(
              children: [
                Center(
                    child: Text(
                 capitalizeFirstLetter( text),
                  style:
                      getMediumtStyle(color: Colormanager.buttonText, fontSize: 11),
                ),),
                israting?Icon(Icons.star,color: Colormanager.primary,size: 10,):Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
