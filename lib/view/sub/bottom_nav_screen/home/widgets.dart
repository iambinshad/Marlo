import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marlo_technologies/common/widgets.dart';
import 'package:marlo_technologies/controller/provider/all_transaction_provider.dart';
import 'package:marlo_technologies/controller/provider/filter_provider.dart';
import 'package:provider/provider.dart';

class CurrencyListSection extends StatelessWidget {
  const CurrencyListSection({
    super.key,
    required this.height,
    required this.currency,
  });

  final double height;
  final List<String> currency;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height / 5.6,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 13, top: 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: height / 5.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          currency[index],
                        ),
                        radius: 30,
                      ),
                      const KHeight(
                        height: 13,
                      ),
                      const Text(
                        "12,45,78.00.00",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const KHeight(
                        height: 2,
                      ),
                      const Text(
                        'Britsh pound',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class AllTransactionSections extends StatelessWidget {
  const AllTransactionSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FilterProvider>(context, listen: false).copyAllData();

    });
    return Expanded(
        child: Consumer<FilterProvider>(
            builder: (context, value, child) => value.filteredList.length!=0
                ? ListView.builder(
                    itemCount: value.filteredList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 2, top: 2),
                      child: Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 43,
                                  width: 43,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        const Color.fromARGB(255, 6, 72, 126),
                                  ),
                                  child: Icon(
                                    !value.filteredList[index].amount!
                                            .contains("-")
                                        ? Icons.arrow_outward_outlined
                                        : Icons.arrow_downward_outlined,
                                    size: 34,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  value.filteredList[index].sourceType!,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  value.filteredList[index].currency1!,
                                  // value.filteredList[index].settledAt != null
                                  //     ? DateFormat('MMMM d, yyyy').format(
                                  //         value.filteredList[index].settledAt!)
                                  //     : "none",
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\$${value.filteredList[index].amount!.replaceAll("-", "")}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: !value.filteredList[index].amount!
                                              .contains("-")
                                          ? Colors.green
                                          : Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: Text("List is empty"),
                  )));
  }
}

class DocListSection extends StatelessWidget {
  const DocListSection({
    super.key,
    required this.height,
    required this.gredientColor,
    required this.centerColors,
  });

  final double height;
  final List<List<Color>> gredientColor;
  final List<Color> centerColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height / 6,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 13, top: 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: height / 5.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: gredientColor[index]),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: centerColors[index],
                        radius: 28,
                        child: const Icon(Icons.document_scanner),
                      ),
                      const KHeight(
                        height: 13,
                      ),
                      const Text(
                        "Verify your business documents",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
