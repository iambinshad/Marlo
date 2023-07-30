import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marlo_technologies/controller/all_services.dart';
import 'package:marlo_technologies/model/transaction_list_model.dart';

class TransactionProvider with ChangeNotifier {
  List<AllTransactionModel> allTransactions = [];

  Future<void> fetchAllTransactions() async {
    AllServices().allTransactionService().then((value) {
      allTransactions = value!;
      notifyListeners();
      log(allTransactions.toString(),name: 'ivdim kitt');
    });
  }
}
