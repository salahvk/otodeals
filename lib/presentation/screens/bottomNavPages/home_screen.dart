import 'package:flutter/material.dart';
import 'package:otodeals/core/asset_manager.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/providers/dataprovider.dart';
import 'package:otodeals/presentation/screens/bottomNavPages/search.dart';
import 'package:otodeals/presentation/widgets/custom_drawer.dart';
import 'package:otodeals/presentation/widgets/home/buy.dart';
import 'package:otodeals/presentation/widgets/home/live.dart';
import 'package:otodeals/presentation/widgets/home/upcoming.dart';
import 'package:otodeals/presentation/widgets/Timers/nextauctiontimer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isBuySelected = false;
  int selectedContainer = 1;
  bool isRowVisible = true;

  @override
  void initState() {
    super.initState();
  }

  void toggleSelection(bool isBuy) async {
    setState(() {
      isBuySelected = isBuy;
    });
  }

  int current = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeres = Provider.of<DataProvider>(context, listen: true);

    return Scaffold(
      endDrawer: SizedBox(
        height: size.height,
        width: size.width * 0.7,
        child: const CustomDrawer(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * .4,
                      height: 40,
                      child: Image.asset(AssetImages.logoBlack),
                    ),
                    Builder(
                      builder: (context) => InkWell(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("assets/menu.png")),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  width: size.width,
                  color: Colormanager.background,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Drive Your",
                                  style: getMediumtStyle(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 22),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Dreams",
                                      style: getMediumtStyle(
                                          color: Colormanager.primary,
                                          fontSize: 22),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(
                                      'assets/slide_layer.png',
                                      height: 24,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            "assets/oto.jpg",
                            height: 80,
                            width: 130,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  homeres.homemodel?.nextAccutionTime?.label ?? "",
                  style: getSemiBoldStyle(color: Colors.black, fontSize: 19),
                ),
                const SizedBox(
                  height: 30,
                ),
                TimerScreen(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 260.0),
                  child: Container(
                    width: 90.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      color: Colormanager.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          alignment: isBuySelected
                              ? Alignment(-1, 0)
                              : Alignment(1, 0),
                          duration: Duration(milliseconds: 300),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 45.0,
                              height: 25.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-1, 0),
                          child: GestureDetector(
                            onTap: () {
                              toggleSelection(true);
                              isRowVisible = false;
                            },
                            child: Container(
                              width: 45.0,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                'BUY',
                                style: getMediumtStyle(
                                    color: isBuySelected
                                        ? Colormanager.black
                                        : Colormanager.white,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(1, 0),
                          child: GestureDetector(
                            onTap: () async {
                              toggleSelection(false);
                              isRowVisible = true;
                            },
                            child: Container(
                              width: 45.0,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                'BID',
                                style: getMediumtStyle(
                                    color: isBuySelected
                                        ? Colormanager.white
                                        : Colormanager.black,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Visibility(
                        visible: isRowVisible,
                        child: Column(
                          children: [
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
                                      height: 50,
                                      decoration: BoxDecoration(
                                          // color: selectedContainer == 1 ? Colors.blue : Colors.transparent,
                                          ),
                                      child: Center(
                                        child: Text(
                                          'LIVE',
                                          style: getMediumtStyle(
                                            fontSize: 15,
                                            color: const Color.fromARGB(
                                                255, 33, 32, 32),
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
                                      height: 50,
                                      decoration: BoxDecoration(
                                          // color: selectedContainer == 2 ? Colors.blue : Colors.transparent,
                                          ),
                                      child: Center(
                                        child: Text(
                                          'UPCOMING',
                                          style: getMediumtStyle(
                                            color: const Color.fromARGB(
                                                255, 33, 32, 32),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 5.4),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 2,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    margin: EdgeInsets.only(
                                        left: selectedContainer == 1
                                            ? 0
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.8),
                                    color: Colormanager.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(
                            homeres.homemodel?.tags?.length ?? 0, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Container(
                              height: 20,
                              width: 105,
                              decoration: BoxDecoration(
                                color: Colormanager.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  homeres.homemodel?.tags?[index].name ?? '',
                                  style: getMediumtStyle(
                                      color: Colormanager.black, fontSize: 10),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                isBuySelected
                    ? Buy()
                    : selectedContainer == 1
                        ? Live()
                        : Upcoming(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      width: size.width,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colormanager
                                .primary, // Set your desired color here
                          ),
                          onPressed: () {
                            isBuySelected
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Searchs(
                                              isBuySelected: true,
                                              selectedContainer: 1,
                                              isRowVisible: false,
                                            ))))
                                : selectedContainer == 1
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => Searchs(
                                                  isBuySelected: false,
                                                  selectedContainer: 1,
                                                  isRowVisible: true,
                                                ))))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => Searchs(
                                                  isBuySelected: false,
                                                  selectedContainer: 2,
                                                  isRowVisible: true,
                                                ))));
                          },
                          child: Text("View More"))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
