import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/routes_manager.dart';
import 'package:otodeals/core/styles_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        // width: 40,
        // height: 40,
        color: Colormanager.white,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                SizedBox(
                    width: size.width * .4,
                    height: 40,
                    child: Image.asset(AssetImages.logoBlack)),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context,Routes.mainScreen);
              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset(
                    AssetImages.homeIcon,
                    width: 20,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Home",
                    style: getMediumtStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset(AssetImages.sellCarIcon, width: 20),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Sell Your Car",
                    style: getMediumtStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Image.asset(AssetImages.buyCarIcon, width: 20),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Buy Your Car",
                  style: getMediumtStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Image.asset(AssetImages.buyCarIcon, width: 20),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Live Auctions",
                  style: getMediumtStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Image.asset(AssetImages.buyCarIcon, width: 20),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "About Us",
                  style: getMediumtStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Image.asset(AssetImages.buyCarIcon, width: 20),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Contact Us",
                  style: getMediumtStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Image.asset(AssetImages.notification, width: 20),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Notification",
                  style: getMediumtStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Image.asset(AssetImages.faq, width: 20),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Faq",
                  style: getMediumtStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            // SizedBox(
            //   height: size.height * .5,
            // )
          ],
        ),
      ),
    );
  }
}
