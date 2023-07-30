import 'package:flutter/material.dart';
import 'package:marlo_technologies/common/widgets.dart';
import 'package:marlo_technologies/controller/all_services.dart';
import 'package:marlo_technologies/controller/provider/all_transaction_provider.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/home/widgets.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/screen_two.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<String> currency = [
    "assets/usa.png",
    "assets/united-kingdom.png",
    "assets/canada.png"
  ];

  List<List<Color>> gredientColor = [
    [Colors.white, const Color.fromARGB(255, 136, 92, 144)],
    [Colors.white, Colors.orange.withOpacity(0.4)],
    [Colors.white, Colors.teal],
    [Colors.white, Colors.green]
  ];

  List<Color> centerColors = [
    Colors.purple.withOpacity(0.5),
    Colors.orange.withOpacity(0.5),
    Colors.teal.withOpacity(0.5),
    Colors.green.withOpacity(0.5)
  ];



  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        leading: const Icon(
          Icons.gif_box_sharp,
          color: Color.fromARGB(255, 255, 169, 49),
          size: 35,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.blue,
              )),
        ],
      ),
      body: Column(
        children: [
          CurrencyListSection(height: height, currency: currency),
          const KHeight(height: 13),
          const Padding(
            padding: EdgeInsets.only(left: 13, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "To do - 4",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          DocListSection(
              height: height,
              gredientColor: gredientColor,
              centerColors: centerColors),
          const KHeight(height: 13),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "All transactions",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllTransactions(),));
                  },
                  child: const Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const KHeight(
            height: 10,
          ),
          const AllTransactionSections()
        ],
      ),
    );
  }
}
