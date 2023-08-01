import 'package:flutter/material.dart';
import 'package:marlo_technologies/controller/provider/filter_provider.dart';
import 'package:marlo_technologies/model/transaction_list_model.dart';
import 'package:provider/provider.dart';

class ScreenFour extends StatefulWidget {
  const ScreenFour({super.key});

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  @override
  Widget build(BuildContext context) {
  //   Provider.of<FilterProvider>(context)
  //       .sampleList
  //       .add(AllTransactionModel(status: 'Completed'));
  //   Provider.of<FilterProvider>(context)
  //       .sampleList
  //       .add(AllTransactionModel(status: 'pending'));

  //   Provider.of<FilterProvider>(context)
  //       .sampleList
  //       .add(AllTransactionModel(status: 'Canceled'));

  //   Provider.of<FilterProvider>(context)
  //       .sampleList
  //       .add(AllTransactionModel(status: 'Canceled'));
  //   Provider.of<FilterProvider>(context)
  //       .filt();
  //   return Consumer<FilterProvider>(
  //       builder: (context, value, child) => ListView.builder(
  //         itemCount: value.filList.length,
  //             itemBuilder: (context, index) => ListTile(
  //               title: Text(value.filList[index].status!),
  //             ),
  //           ));
  // }
  return Center();
  }}
