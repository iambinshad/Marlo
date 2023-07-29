import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      // body: Column(
      //   children: [
      //     Row(
      //       children: [
      //         Expanded(child:);
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
