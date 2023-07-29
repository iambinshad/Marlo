import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewAllTransactions extends StatelessWidget {
  const ViewAllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
        body: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding:
                const EdgeInsets.only(left: 6, right: 6, bottom: 2, top: 2),
            child: Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                          color: const Color.fromARGB(255, 6, 72, 126),
                        ),
                        child: const Icon(
                          Icons.arrow_outward_outlined,
                          size: 34,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rent",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Sat-16 jul - 9.00 pm",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "-\$850.00",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void openBottomSheet(context, height) {
    double screenHeight = MediaQuery.of(context).size.height;
    double desiredHeight = (screenHeight / 3) * 4 + 750;
    showModalBottomSheet(
      context: context,
      builder: (context) => FractionallySizedBox(
        heightFactor: desiredHeight / screenHeight,
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
