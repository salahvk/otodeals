import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Container(
                decoration: BoxDecoration(
                    color: Colormanager.primary,
                    borderRadius: BorderRadius.circular(25)),
                width: size.width,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CHOOSE A CAR",
                            style: getRegularStyle(color: Colormanager.white),
                          ),
                          const Icon(Icons.menu)
                        ],
                      ),
                      Container(
                          width: size.width,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colormanager.white,
                              borderRadius: BorderRadius.circular(8)))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
