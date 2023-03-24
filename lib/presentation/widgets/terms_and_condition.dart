import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({
    Key? key,
  }) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, Routes.termsAndConditions);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                });
              },
            ),
            Text("I agree to the",
                style: getBoldtStyle(
                    color: const Color(0xffafafaf), fontSize: 14)),
            Text(" terms & conditions",
                style:
                    getBoldtStyle(color: Colormanager.textColor, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
