import 'package:flutter/material.dart';

import 'package:otodeals/core/color_manager.dart';

import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/core/util/bid_diologue.dart';


class BidListTile extends StatefulWidget {
  const BidListTile({
    super.key,
  });

  @override
  State<BidListTile> createState() => _BidListTileState();
}

class _BidListTileState extends State<BidListTile> {
    void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BidDiologue();
      },
    );
  }
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          isVisible = value;
        });
      },
      trailing: SizedBox(
        height: 0,
      ),
      tilePadding: EdgeInsets.only(left: 30),
      title: InkWell(
        onTap: () => _showDialog(context),
        child: Container(
          height: 50,
          // width: size.width * .5,
          decoration: BoxDecoration(
              color: Colormanager.primary,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text(
            "PLACE YOUR BID",
            style: getBoldStyle(color: Colormanager.white, fontSize: 15),
          )),
        ),
      ));
    // 
    
  }
}
