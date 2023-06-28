import 'package:flutter/material.dart';

class DropdownContainer extends StatefulWidget {
  const DropdownContainer({super.key});

  @override
  _DropdownContainerState createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  bool _isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Visibility(
        visible: _isDropdownOpen,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: ListView(
            children: [
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Handle item 1 selection
                  setState(() {
                    _isDropdownOpen = false;
                  });
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Handle item 2 selection
                  setState(() {
                    _isDropdownOpen = false;
                  });
                },
              ),
              // Add more ListTiles for additional items
            ],
          ),
        ),
      ),
    );
  }
}


