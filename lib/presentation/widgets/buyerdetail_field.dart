import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class BuyerDetailField extends StatelessWidget {
  const BuyerDetailField(
      {super.key, required this.controller, required this.hintText});
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 23.0, right: 23),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colormanager.background,
          hintText: hintText,
          hintStyle: getSemiBoldStyle(
              fontSize: 14, color: const Color.fromARGB(255, 14, 14, 14)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: Color.fromARGB(255, 202, 200, 200))),
        ),
      ),
    );
  }
}
