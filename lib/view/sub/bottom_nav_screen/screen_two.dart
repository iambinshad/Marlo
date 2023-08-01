import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marlo_technologies/common/widgets.dart';
import 'package:marlo_technologies/controller/provider/calender_provider.dart';
import 'package:marlo_technologies/controller/provider/filter_provider.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/home/widgets.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/screen_five.dart';
import 'package:provider/provider.dart';

class ViewAllTransactions extends StatefulWidget {
  const ViewAllTransactions({super.key});

  @override
  State<ViewAllTransactions> createState() => _ViewAllTransactionsState();
}

class _ViewAllTransactionsState extends State<ViewAllTransactions> {
  List<String> currency = [
    "assets/usa.png",
    "assets/united-kingdom.png",
    "assets/canada.png"
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Transactions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Expanded(
                            flex: 7,
                            child: SizedBox(
                              height: 40,
                              child: CupertinoSearchTextField(
                                prefixIcon: SizedBox(),
                                placeholder: 'Search vessel',
                                suffixIcon: Icon(
                                  Icons.search,
                                  size: 20,
                                ),
                                suffixMode: OverlayVisibilityMode.always,
                              ),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Provider.of<FilterProvider>(context,listen: false).copyAllData();
                              openBottomSheet(context, height);
                            },
                            child: Container(
                                height: 41,
                                width: 41,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(
                                  Icons.filter_alt_rounded,
                                  color: Colors.grey.shade500,
                                  size: 20,
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 22,
              )),
          actions: const [
            Icon(
              Icons.download,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Column(
          children: [
            const AllTransactionSections(),
          ],
        ));
  }

  void openCalenderBottomSheet() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      enableDrag: true,
      showDragHandle: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (context) => SizedBox(
        height: screenHeight / 1.2,
        width: screenWidth,
        child: ScreenFive(),
      ),
    );
  }

  void openBottomSheet(context, height) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredHeight = (screenHeight / 3) * 4 + 750;
    showModalBottomSheet(
      enableDrag: true,
      showDragHandle: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      context: context,
      builder: (context) => SizedBox(
        height: screenHeight / 1.2,
        width: screenWidth,
        child: Container(
          height: desiredHeight,
          width: screenWidth,
          padding: const EdgeInsets.all(13),
          color: const Color.fromARGB(255, 243, 243, 243),
          child: Column(children: [
            Expanded(
              flex: 10,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Filter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Clear",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  const KHeight(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: Consumer<FilterProvider>(
                      builder: (context, value, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Money in and out - 2",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const KHeight(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildFilterButton('Money In',
                                  value.selectedFilters.contains('Money In'),
                                  () {
                                _toggleFilter('Money In');
                              }),
                              const SizedBox(width: 10),
                              _buildFilterButton('Money Out',
                                  value.selectedFilters.contains('Money Out'),
                                  () {
                                _toggleFilter('Money Out');
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: Consumer<FilterProvider>(
                      builder: (context, value, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Statuses - 3",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const KHeight(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildFilterButton('Completed',
                                  value.selectedFilters.contains('Completed'),
                                  () {
                                _toggleFilter('Completed');
                              }),
                              const SizedBox(width: 10),
                              _buildFilterButton('Pending',
                                  value.selectedFilters.contains('Pending'),
                                  () {
                                _toggleFilter('Pending');
                              }),
                              const SizedBox(width: 10),
                              _buildFilterButton('Cancelled',
                                  value.selectedFilters.contains('Cancelled'),
                                  () {
                                _toggleFilter('Cancelled');
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: Consumer<FilterProvider>(
                      builder: (context, value, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: value.allCheckBox,
                                  onChanged: (checkValue) {
                                    value.setCheckBox("allCurrencies");
                                  }),
                              const Text(
                                "Currencies -167",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: value.uSDCheckBox,
                                  onChanged: (checkValue) {
                                    value.setCheckBox(
                                      "USD",
                                    );
                                  }),
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  currency[0],
                                ),
                                radius: 19,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "USD",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "United States Dollar",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const KHeight(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: value.cADCheckBox,
                                  onChanged: (checkValue) {
                                    value.setCheckBox(
                                      "CAD",
                                    );
                                  }),
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  currency[1],
                                ),
                                radius: 19,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "CAD",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Cannedian Dollar",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const KHeight(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: value.gBPCheckBox,
                                  onChanged: (checkValue) {
                                    value.setCheckBox(
                                      "GBP",
                                    );
                                  }),
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  currency[2],
                                ),
                                radius: 19,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "GBP",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "British Pound",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const KHeight(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "See all accounts",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          const KHeight(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    height: 130,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: Consumer2<FilterProvider, CalenderProvider>(
                      builder: (context, value, value2, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Time Range",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const KHeight(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildFilterButton(value.choosedDate,
                                  value.selectedFilters.contains('Custom'), () {
                                openCalenderBottomSheet();
                              }),
                              const SizedBox(width: 10),
                              _buildFilterButton('Today',
                                  value.selectedFilters.contains('Today'), () {
                                _toggleFilter('Today');
                              }),
                              const SizedBox(width: 10),
                              _buildFilterButton('This Week',
                                  value.selectedFilters.contains('This Week'),
                                  () {
                                _toggleFilter('This Week');
                              }),
                            ],
                          ),
                          const KHeight(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildFilterButton('This Month',
                                  value.selectedFilters.contains('This Month'),
                                  () {
                                _toggleFilter('This Month');
                              }),
                              const SizedBox(width: 10),
                              _buildFilterButton(
                                  'This Quarter',
                                  value.selectedFilters
                                      .contains('This Quarter'), () {
                                _toggleFilter('This Quarter');
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const KHeight(
                    height: 30,
                  ),
                  Container(
                    height: 140,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: Consumer2<FilterProvider, CalenderProvider>(
                      builder: (context, value, value2, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Amount",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const KHeight(
                            height: 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: value.minimumController,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            color: Colors.grey.withOpacity(0.1),
                                          )),
                                          fillColor:
                                              Colors.grey.withOpacity(0.1),
                                          filled: true,
                                          labelText: "Minimum",
                                          isDense: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ))),
                              Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: value.maximumController,
                                      decoration: InputDecoration(
                                          labelText: "Maximum",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                            color: Colors.grey.withOpacity(0.1),
                                          )),
                                          fillColor:
                                              Colors.grey.withOpacity(0.1),
                                          filled: true,
                                          isDense: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ))),
                            ],
                          ),
                          const KHeight(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 6, right: 6, bottom: 13),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity / 1.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor:
                                  const Color.fromARGB(255, 172, 222, 245),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity / 1.5,
                        child: Consumer2<CalenderProvider, FilterProvider>(
                          builder: (context, value, value2, child) =>
                              ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                             
                              value2.realFiltering();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 10,
                                backgroundColor:
                                    const Color.fromARGB(255, 60, 164, 249),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text("Apply",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }

  void _toggleFilter(String filter) {
    Provider.of<FilterProvider>(context, listen: false).setStatus(filter);
  }

  Widget _buildFilterButton(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 189, 230, 250)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
