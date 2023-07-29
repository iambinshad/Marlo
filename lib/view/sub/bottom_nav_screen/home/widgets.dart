import 'package:flutter/material.dart';
import 'package:marlo_technologies/common/widgets.dart';

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

class AllTransactionSectino extends StatelessWidget {
  const AllTransactionSectino({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 2, top: 2),
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
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
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
