import 'package:flutter/material.dart';

import 'package:otodeals/core/color_manager.dart';

class IntroductionLogo extends StatelessWidget {
  const IntroductionLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colormanager.primary.withOpacity(0.1),
      radius: 68.5,
      child: CircleAvatar(
        backgroundColor: Colormanager.background,
        radius: 67.5,
        child: CircleAvatar(
          backgroundColor: Colormanager.primary.withOpacity(0.14),
          radius: 59.5,
          child: CircleAvatar(
            backgroundColor: Colormanager.background,
            radius: 58.5,
            child: CircleAvatar(
              backgroundColor: Colormanager.primary..withOpacity(0.2),
              radius: 51.5,
              child: CircleAvatar(
                backgroundColor: Colormanager.background,
                radius: 51,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colormanager.primary..withOpacity(0.25),
                    radius: 44.5,
                    child: Center(
                      child: Image.asset("assets/logo_black.png", height: 55),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
