import 'package:flutter/material.dart';
import 'package:otodeals/core/color_manager.dart';
import 'package:otodeals/core/controllers.dart';
import 'package:otodeals/core/styles_manager.dart';
import 'package:otodeals/data/providers/vehicleprovider.dart';
import 'package:otodeals/data/repositories/vehiclelisting.dart';

import 'package:otodeals/presentation/widgets/Searchfilterdrawer.dart';
import 'package:otodeals/presentation/widgets/bottom_nav.dart';
import 'package:otodeals/presentation/widgets/search/search_bid.dart';
import 'package:otodeals/presentation/widgets/search/search_buy.dart';
import 'package:otodeals/presentation/widgets/search/search_upcomingbid.dart';
import 'package:provider/provider.dart';

class Searchs extends StatefulWidget {
  bool isBuySelected;
  int selectedContainer;
  bool isRowVisible;
  bool isnavigatethroughhome;
  // bool isnavigatethroughhome;

  Searchs(
      {Key? key,
      this.isBuySelected = false,
      this.selectedContainer = 1,
      this.isRowVisible = true,
      this.isnavigatethroughhome = false})
      : super(key: key);

  @override
  State<Searchs> createState() => _SearchsState();
}

class _SearchsState extends State<Searchs> {
  bool isBuySelected = false;

  int selectedContainer = 1;
  bool isRowVisible = true;
  String s = "abc";
  // List<dynamic>allresults=[];
  //  List<dynamic> searchResults = [];
  final searchdata = Searchcontroller.searchdatacontroller.text;

  String? type;
  @override
  void initState() {
    Searchcontroller.vehicletypecontroller.text = "bid";
    super.initState();
    isBuySelected = widget.isBuySelected;
    selectedContainer = widget.selectedContainer;
    isRowVisible = widget.isRowVisible;
    // isnavigatethroughhome=widget.isnavigatethroughhome;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await fetchSearchResults(context);
    });
  }

  void toggleSelection(bool isBuy) async {
    setState(() {
      isBuySelected = isBuy;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final res=Provider.of<Vehicleprovider>(context,listen: false);
    // final searchres = Provider.of<DataProvider>(context, listen: false);
    final res = Provider.of<Vehicleprovider>(context, listen: true);
    final tags = res.vlist?.tags;
    // print(res.vlist?.products?.data?.length.toString()??"");
    final size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: SingleChildScrollView(
        child: SizedBox(
          // height: size.height,
          width: size.width * 0.8,
          child: FilterDrawer(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colormanager.primary,
                    borderRadius: BorderRadius.circular(25),
                  ),
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
                              style: getSemiBoldStyle(
                                color: Colormanager.white,
                                fontSize: 15,
                              ),
                            ),
                            Builder(
                              builder: (context) => InkWell(
                                  onTap: () {
                                    Scaffold.of(context).openEndDrawer();
                                  },
                                  child: Image.asset("assets/menu.png")),
                            ),
                          ],
                        ),
                        Container(
                          width: size.width,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colormanager.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: Searchcontroller.searchdatacontroller,
                            // onChanged: (value) {

                            // },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: getSemiBoldStyle(
                                color: Colormanager.textColor,
                                fontSize: 15,
                              ),
                              prefixIcon: InkWell(
                                onTap: () {
                                  fetchSearchResults(context);
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: Colormanager.textColor,
                                ),
                              ),
                              // suffixIcon: const Icon(
                              //   Icons.location_on_sharp,
                              //   color: Colormanager.primary,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    
                    Text(isBuySelected?
                      res.vlist?.products?.data?.length.toString() ?? "":selectedContainer==1?res.vlist?.products?.data?.length.toString()??"":res.vlist?.upcomingbid?.data?.length.toString()??"",
                      style: getSemiBoldStyle(
                        color: Colormanager.primary,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "RESULTS",
                      style: getSemiBoldStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 123,
                    ),
                    Container(
                      width: 90.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 169, 20, 20),
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
                              onTap: () async {
                                toggleSelection(true);
                                isRowVisible = false;
                                Searchcontroller.vehicletypecontroller.text =
                                    "sale";
                                await fetchSearchResults(context);
                              },
                              child: Container(
                                width: 45.0,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Text(
                                  'BUY',
                                  style: getMediumtStyle(
                                      color: isBuySelected
                                          ? Colors.black
                                          : Colors.white,
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
                                Searchcontroller.vehicletypecontroller.text =
                                    "bid";
                                await fetchSearchResults(context);
                              },
                              child: Container(
                                width: 45.0,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Text(
                                  'BID',
                                  style: getMediumtStyle(
                                      color: isBuySelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
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
                                    color:
                                        const Color.fromARGB(255, 33, 32, 32),
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
                                    color:
                                        const Color.fromARGB(255, 33, 32, 32),
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
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 5.4),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 2,
                            width: MediaQuery.of(context).size.width / 2.5,
                            margin: EdgeInsets.only(
                                left: selectedContainer == 1
                                    ? 0
                                    : MediaQuery.of(context).size.width / 1.8),
                            color: Colormanager.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(tags?.length ?? 0, (index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: InkWell(
                      onTap: () {
                      int id=res.vlist?.tags![index].id??0;
                      Searchcontroller.tagcontroller.text='&filter_tag=$id';
                      fetchSearchResults(context);

                      },
                      child: Container(
                        height: 20,
                        width: 105,
                        decoration: BoxDecoration(
                          color: Colormanager.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            tags?[index].name ?? '',
                            style: getMediumtStyle(
                                color: Colormanager.black, fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 10,
              ),
              isBuySelected
                  ? BuyFunction()
                  : selectedContainer == 1
                      ? BidFunction()
                      : UpcomingbidFunction()
            ],
          ),
        ),
      ),
      bottomNavigationBar: widget.isnavigatethroughhome
          ? BottomNavigationWidget(
              isInsidePage: true,
            )
          : null,
    );
  }
}
