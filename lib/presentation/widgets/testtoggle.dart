import 'package:flutter/material.dart';

class ContainerLineExample extends StatefulWidget {
  const ContainerLineExample({super.key});

  @override
  _ContainerLineExampleState createState() => _ContainerLineExampleState();
}

class _ContainerLineExampleState extends State<ContainerLineExample> {
  int selectedContainer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Line Example'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContainer = 1;
                    });
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      // color: selectedContainer == 1 ? Colors.blue : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        'Container 1',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContainer = 2;
                    });
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      // color: selectedContainer == 2 ? Colors.blue : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        'Container 2',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 2,
                width: MediaQuery.of(context).size.width / 2,
                margin: EdgeInsets.only(left: selectedContainer == 1 ? 0 : MediaQuery.of(context).size.width / 2),
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              selectedContainer == 1 ? 'Content of Container 1' : 'Content of Container 2',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ContainerLineExample(),
  ));
}
