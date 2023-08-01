import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marlo_technologies/controller/all_services.dart';
import 'package:marlo_technologies/model/transaction_list_model.dart';
import 'package:provider/provider.dart';

class FilterProvider with ChangeNotifier {
// List<AllTransactionModel> sampleList = [];

// List<AllTransactionModel> filList = [];
// void filt(){
//   for (var i = 0; i < sampleList.length; i++) {
//     if(sampleList[i].status == 'Completed'){
//       filList.add(sampleList[i]);
//       notifyListeners();
//     }

//   }
// }
// List<AllTransactionModel> data= [
//   {
//     'amount':"12,32,42",
//     'status':"SETTLED",
//     'sourceType':'PAYOUT',
//     'currency1':'USD',

//   },
// ];
  void setUpTrasactionList() {
    String responseData = """{
    "data": [
        {
            "id": "ftx_GM0g8hEBTNGGkPHV_n0MNw",
            "amount": "140.05",
            "status": "SETTLED",
            "sourceId": "0adf3758-e5b8-49f7-a662-17309fefbb41",
            "sourceType": "CONVERSION",
            "transactionType": "CONVERSION_BUY",
            "currency": "\$",
            "createdAt": "2023-07-27T06:18:29.238000+00:00",
            "fee": 0,
            "description": "",
            "settledAt": "2023-07-27T06:18:29.000000+05:30",
            "estimatedSettledAt": "2023-07-27T00:00:00.000000+00:00",
            "currency1": "USD"
        },
        {
            "id": "ftx_5dr8EyTxSgeptWuvzqO2Tw",
            "amount": "-1,000.00",
            "status": "SETTLED",
            "sourceId": "0adf3758-e5b8-49f7-a662-17309fefbb41",
            "sourceType": "CONVERSION",
            "transactionType": "CONVERSION_SELL",
            "currency": "¥",
            "createdAt": "2023-07-27T06:18:29.217000+00:00",
            "fee": 0,
            "description": "",
            "settledAt": "2023-07-27T06:18:29.000000+05:30",
            "estimatedSettledAt": "2023-07-27T00:00:00.000000+00:00",
            "currency1": "CNY"
        },
        {
            "id": "ftx_Y7OgBtdvTNqArk6IXJ92pQ",
            "amount": "-139.35",
            "status": "PENDING",
            "sourceId": "37b8b354-6688-4a81-9e62-5bb63273cc3f",
            "sourceType": "PAYOUT",
            "transactionType": "PAYOUT",
            "currency": "\$",
            "createdAt": "2023-07-27T06:18:29.201000+00:00",
            "fee": 0,
            "description": "business trip",
            "settledAt": null,
            "estimatedSettledAt": "2023-07-27T00:00:00.000000+00:00",
            "currency1": "USD"
        },
        {
            "id": "ftx_jmnP2hsmQT6LmLHkcRx8pQ",
            "amount": "-1,000.00",
            "status": "PENDING",
            "sourceId": "73c55e7b-fb67-4a1b-9f2d-799e38f04d33",
            "sourceType": "PAYOUT",
            "transactionType": "PAYOUT",
            "currency": "£",
            "createdAt": "2023-07-27T04:30:01.604000+00:00",
            "fee": 0,
            "description": "material purchase",
            "settledAt": null,
            "estimatedSettledAt": "2023-07-27T00:00:00.000000+00:00",
            "currency1": "GBP"
        },
        {
            "id": "ftx_Pf71IR2YR1W7UwcroNvCVw",
            "amount": "-10.00",
            "status": "SETTLED",
            "sourceId": "1141eca3-7e35-4612-b0cd-342821e83153",
            "sourceType": "CONVERSION",
            "transactionType": "CONVERSION_SELL",
            "currency": "\$",
            "createdAt": "2023-07-24T05:42:49.176000+00:00",
            "fee": 0,
            "description": "",
            "settledAt": "2023-07-24T05:42:49.000000+05:30",
            "estimatedSettledAt": "2023-07-24T05:42:49.056000+00:00",
            "currency1": "USD"
        },
        {
            "id": "ftx_vpgPgoThRRCkdGlzwPJ2vQ",
            "amount": "12,635.00",
            "status": "SETTLED",
            "sourceId": "1141eca3-7e35-4612-b0cd-342821e83153",
            "sourceType": "CONVERSION",
            "transactionType": "CONVERSION_BUY",
            "currency": "₩",
            "createdAt": "2023-07-24T05:42:49.176000+00:00",
            "fee": 128,
            "description": "",
            "settledAt": "2023-07-24T05:42:49.000000+05:30",
            "estimatedSettledAt": "2023-07-24T05:42:49.056000+00:00",
            "currency1": "KRW"
        },
        {
            "id": "ftx_LxSdEVVTSj6MKzAgL_P6Bg",
            "amount": "69.44",
            "status": "SETTLED",
            "sourceId": "85a833df-e008-4c15-88d4-7fd590265dbc",
            "sourceType": "CONVERSION",
            "transactionType": "CONVERSION_BUY",
            "currency": "\$",
            "createdAt": "2023-07-24T05:39:37.982000+00:00",
            "fee": 0,
            "description": "",
            "settledAt": "2023-07-24T05:39:38.000000+05:30",
            "estimatedSettledAt": "2023-07-24T00:00:00.000000+00:00",
            "currency1": "USD"
        },
        {
            "id": "ftx_8Hjw5IakQL63ssNdcHbdXw",
            "amount": "-500.00",
            "status": "SETTLED",
            "sourceId": "85a833df-e008-4c15-88d4-7fd590265dbc",
            "sourceType": "CONVERSION",
            "transactionType": "CONVERSION_SELL",
            "currency": "¥",
            "createdAt": "2023-07-24T05:39:37.337000+00:00",
            "fee": 0,
            "description": "",
            "settledAt": "2023-07-24T05:39:37.000000+05:30",
            "estimatedSettledAt": "2023-07-24T00:00:00.000000+00:00",
            "currency1": "CNY"
        },
        {
            "id": "ftx__tijBNxNSDyaEXtFrwltUw",
            "amount": "-69.09",
            "status": "PENDING",
            "sourceId": "92ee76ab-7aab-4704-9d92-bf79a8f40b92",
            "sourceType": "PAYOUT",
            "transactionType": "PAYOUT",
            "currency": "\$",
            "createdAt": "2023-07-24T05:39:37.332000+00:00",
            "fee": 0,
            "description": "Demo",
            "settledAt": null,
            "estimatedSettledAt": "2023-07-24T00:00:00.000000+00:00",
            "currency1": "USD"
        },
        {
            "id": "ftx_TNzv0lIRRBSOJ26ozZQACA",
            "amount": "8,193,794.90",
            "status": "SETTLED",
            "sourceId": "2d32d8f6-1a69-4cc3-9134-335db82ff123",
            "sourceType": "CONVERSION",
            "transactionType": "CONVERSION_BUY",
            "currency": "₨",
            "createdAt": "2023-07-24T05:17:48.378000+00:00",
            "fee": 81937,
            "description": "",
            "settledAt": "2023-07-24T05:17:48.000000+05:30",
            "estimatedSettledAt": "2023-07-24T00:00:00.000000+00:00",
            "currency1": "INR"
        }
    ]
}
""";

    final Map<String, dynamic> response = json.decode(responseData);
    final List<dynamic> data = response['data'];
    allTransactions =
        data.map((item) => AllTransactionModel.fromJson(item)).toList();

    log(allTransactions.toString());
    log(allTransactions[0].amount.toString(), name: "Win");
  }

  void copyAllData() {
    filteredList = [...allTransactions];
  }

  List<AllTransactionModel> allTransactions = [];
  List<String> selectedFilters = [];

  List<AllTransactionModel> filteredList = [];
// void realFiltering() {
//   filteredList.clear(); // Clear the filtered list before applying filters

//   for (var i = 0; i < allTransactions.length; i++) {
//     var transaction = allTransactions[i];
//     bool shouldInclude = true;

//     for (var j = 0; j < selectedFilters.length; j++) {
//       String filter = selectedFilters[j];

//       if (filter == 'Money In' &&
//           !(transaction.sourceType == 'DEPOSIT' ||
//               transaction.sourceType == 'CONVERSION' ||
//               transaction.sourceType == 'REFUND')) {
//         shouldInclude = false;
//         break;
//       } else if (filter == 'Money Out' &&
//           !(transaction.sourceType == 'PAYOUT' ||
//               transaction.sourceType == 'CHARGE' ||
//               transaction.sourceType == 'PAYMENT_ATTEMPT' ||
//               transaction.sourceType == 'FEE')) {
//         shouldInclude = false;
//         break;
//       } else if (filter == 'Completed' &&
//           transaction.sourceType != 'SETTLED') {
//         shouldInclude = false;
//         break;
//       } else if (filter == 'Pending' &&
//           transaction.sourceType != 'PENDING') {
//         shouldInclude = false;
//         break;
//       } else if (filter == 'Cancelled' &&
//           transaction.sourceType != 'CANCELLED') {
//         shouldInclude = false;
//         break;
//       }
//     }

//     if (shouldInclude) {
//       filteredList.add(transaction);
//     }
//   }

//   notifyListeners();
// }

  void realFiltering() {
    if (selectedFilters.isNotEmpty) {
      filteredList.clear();
    }
    for (var i = 0; i < selectedFilters.length; i++) {
      if (selectedFilters[i] == 'Money In') {
        for (var j = 0; j < allTransactions.length; j++) {
          if (allTransactions[j].sourceType == 'DEPOSIT' ||
              allTransactions[j].sourceType == 'CONVERSION' ||
              allTransactions[j].sourceType == 'REFUND') {
            filteredList.add(allTransactions[j]);
          }
        }
        notifyListeners();
      } else if (selectedFilters[i] == 'Money Out') {
        for (var j = 0; j < allTransactions.length; j++) {
          if (allTransactions[j].sourceType == 'PAYOUT' ||
              allTransactions[j].sourceType == 'CHARGE' ||
              allTransactions[j].sourceType == 'PAYMENT_ATTEMPT' ||
              allTransactions[j].sourceType == 'FEE') {
            filteredList.add(allTransactions[j]);
          }
        }
        notifyListeners();
      } else if (selectedFilters[i] == 'Completed') {
        for (var j = 0; j < allTransactions.length; j++) {
          if (allTransactions[j].sourceType == 'SETTLED') {
            filteredList.add(allTransactions[j]);
          }
        }
        notifyListeners();
      } else if (selectedFilters[i] == 'Pending') {
        for (var j = 0; j < allTransactions.length; j++) {
          if (allTransactions[j].sourceType == 'PENDING') {
            filteredList.add(allTransactions[j]);
          }
        }
        notifyListeners();
      } else if (selectedFilters[i] == 'Cancelled') {
        for (var j = 0; j < allTransactions.length; j++) {
          if (allTransactions[j].sourceType == 'CANCELLED') {
            filteredList.add(allTransactions[j]);
          }
        }
        notifyListeners();
      }else if(selectedFilters[i] == 'allCurrencies'){
        for (var j = 0; j < allTransactions.length; j++) {
          if (!filteredList.contains(allTransactions[j])) {
            filteredList.add(allTransactions[j]);
          }
        }
        notifyListeners();
      }else if(selectedFilters[i] == 'USD'){
         for (var j = 0; j < allTransactions.length; j++) {
          if (!filteredList.contains(allTransactions[j])&&allTransactions[j].currency1 == "USD") {
            filteredList.add(allTransactions[j]);
          }
        }
      }else if(selectedFilters[i] == 'CAD'){
         for (var j = 0; j < allTransactions.length; j++) {
          if (!filteredList.contains(allTransactions[j])&&allTransactions[j].currency1 == "CAD") {
            filteredList.add(allTransactions[j]);
          }
        }
      }else if(selectedFilters[i] == 'GBP'){
         for (var j = 0; j < allTransactions.length; j++) {
          if (!filteredList.contains(allTransactions[j])&&allTransactions[j].currency1 == "GBP") {
            filteredList.add(allTransactions[j]);
          }
        }
      }
    }

    for (var i = 0; i < selectedFilters.length; i++) {
      int count = 0;
      for (var j = 0; j < filteredList.length; j++) {
        if (selectedFilters[i] == 'Money In') {
          if ('CONVERSION' == filteredList[j].sourceType) {
            count++;
          }
        } else if (selectedFilters[i] == 'Money Out') {
          if ('PAYOUT' == filteredList[j].sourceType) {
            count++;
          }
        } else if (selectedFilters[i] == 'Completed') {
          if ('SETTLED' == filteredList[j].status) {
            count++;
          }
        } else {
          if ("PENDING" == filteredList[j].status) {
            count++;
          }
        }
      }
      if (count == 0) {
        filteredList.clear();
        break;
      }
    }
    notifyListeners();
  }

  void regenerateToken(context) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.delete(key: 'access_token');
    AllServices().getToken().then((value) {
      Provider.of<FilterProvider>(context, listen: false)
          .fetchAllTransactions(context);
    });
  }

  TextEditingController minimumController = TextEditingController();
  TextEditingController maximumController = TextEditingController();

  // List<AllTransactionModel> filteredTransactions = [];
  Future<void> fetchAllTransactions(BuildContext context) async {
    AllServices().allTransactionService(context).then((value) {
      allTransactions = value ?? [];
      notifyListeners();
      log(allTransactions.toString(), name: 'ivdim kitt');
    });
  }

  // void clickFilterApply() {
  //   // filteredTransactions = filterTransactions();
  // }

  bool allCheckBox = false;
  bool uSDCheckBox = false;
  bool cADCheckBox = false;
  bool gBPCheckBox = false;

  void setCheckBox(String box) {
    if (box == 'allCurrencies') {
      if (!selectedFilters.contains(box)) {
        selectedFilters.add(box);
      } else {
        selectedFilters.remove(box);
      }
      allCheckBox = !allCheckBox;
      uSDCheckBox = allCheckBox;
      cADCheckBox = allCheckBox;
      gBPCheckBox = allCheckBox;

      notifyListeners();
    } else if (box == 'USD') {
      if (!selectedFilters.contains('allCurrencies')) {
        if (!selectedFilters.contains(box)) {
          selectedFilters.add(box);
        } else {
          selectedFilters.remove(box);
        }
      }
      uSDCheckBox = !uSDCheckBox;
      notifyListeners();
    } else if (box == 'CAD') {
        if (!selectedFilters.contains('allCurrencies')) {
        if (!selectedFilters.contains(box)) {
          selectedFilters.add(box);
        } else {
          selectedFilters.remove(box);
        }
      }
      cADCheckBox = !cADCheckBox;
      notifyListeners();
    } else if (box == 'GBP') {
        if (!selectedFilters.contains('allCurrencies')) {
        if (!selectedFilters.contains(box)) {
          selectedFilters.add(box);
        } else {
          selectedFilters.remove(box);
        }
      }
      gBPCheckBox = !gBPCheckBox;
      notifyListeners();
    }
  }

  dynamic choosedDate = 'Custom';

  void setDateFilter([List<String>? data]) {
    if (data != null) {
      choosedDate = "${data[0]} - ${data[1]}";
    } else {
      choosedDate = 'Custom';
    }
    notifyListeners();
  }

  void setStatus(filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
      notifyListeners();
    } else {
      selectedFilters.add(filter);
      notifyListeners();
    }
  }

  // bool isMoneyInSelected = true;
  // bool isMoneyOutSelected = false;
  // void clickMoneyIn() {
  //   log('hei1');

  //   isMoneyInSelected = !isMoneyInSelected;
  //   isMoneyOutSelected = !isMoneyInSelected;
  //   notifyListeners();
  // }

  // void clickMoneyOut() {
  //   log('hei2');
  //   isMoneyOutSelected = !isMoneyOutSelected;
  //   isMoneyInSelected = !isMoneyOutSelected;
  //   notifyListeners();
  // }

//  // Method to filter the list of transactions based on selected filters
//   List<AllTransactionModel> filterTransactions() {
//     FilterProvider filterProvider = Provider.of<FilterProvider>(context, listen: false);

//     // Apply filter on the transaction list
//     List<AllTransactionModel> filteredList = allTransactions.where((transaction) {
//       // Filter based on money in/out
//       if (isMoneyInSelected && transaction.type != TransactionType.MoneyIn) {
//         return false;
//       }
//       if (filterProvider.isMoneyOutSelected && transaction.type != TransactionType.MoneyOut) {
//         return false;
//       }

//       // Filter based on status
//       if (filterProvider.selectedFilters.contains(transaction.status)) {
//         return false;
//       }

//       // Filter based on currency
//       if (!filterProvider.allCheckBox) {
//         if (transaction.currency != 'USD' && !filterProvider.uSDCheckBox) {
//           return false;
//         }
//         if (transaction.currency != 'CAD' && !filterProvider.cADCheckBox) {
//           return false;
//         }
//         if (transaction.currency != 'GBP' && !filterProvider.gBPCheckBox) {
//           return false;
//         }
//       }

//       // Filter based on time range
//       if (filterProvider.selectedFilters.contains('Custom')) {
//         // Apply custom date range filtering here
//         // You can use the CalenderProvider to get the start and end dates of the custom range
//         // DateTime customStartDate = Provider.of<CalenderProvider>(context, listen: false).startDate;
//         // DateTime customEndDate = Provider.of<CalenderProvider>(context, listen: false).endDate;
//         // Example: filteredList = filteredList.where((transaction) =>
//         //   transaction.date.isAfter(customStartDate) && transaction.date.isBefore(customEndDate)
//         // ).toList();
//       } else if (filterProvider.selectedFilters.contains('Today')) {
//         // Apply today's date filtering here
//       } else if (filterProvider.selectedFilters.contains('This Week')) {
//         // Apply this week's date filtering here
//       } else if (filterProvider.selectedFilters.contains('This Month')) {
//         // Apply this month's date filtering here
//       } else if (filterProvider.selectedFilters.contains('This Quarter')) {
//         // Apply this quarter's date filtering here
//       }

//       // Filter based on amount range
//       if (int.parse(minimumController.text) != null && transaction.amount < int.parse(minimumController.text)) {
//         return false;
//       }
//       if (filterProvider.maximumAmount != null && transaction.amount > filterProvider.maximumAmount) {
//         return false;
//       }

//       // If the transaction passes all filters, include it in the filtered list
//       return true;
//     }).toList();

//     return filteredList;
//   }

// import 'dart:convert';

// Assuming you have the response data stored in a variable named "responseString"
// Parse the JSON data and create a list of transactions
// List<Transaction> parseTransactions(String responseString) {
//   final List<Transaction> transactions = [];
//   final Map<String, dynamic> responseData = json.decode(responseString);

//   if (responseData['error_flag'] == 'SUCCESS') {
//     final List<dynamic> data = responseData['data'];
//     transactions.addAll(data.map((item) => Transaction.fromJson(item)).toList());
//   }

//   return transactions;
// }

// List<AllTransactionModel> parseTransactions(String responseString) {
//   final List<AllTransactionModel> transactions = [];
//   final Map<String, dynamic> responseData = json.decode(responseString);

//   if (responseData['error_flag'] == 'SUCCESS') {
//     final List<dynamic> data = responseData['data'];
//     transactions.addAll(data.map((item) => AllTransactionModel.fromJson(item)).toList());
//   }

//   return transactions;
// }

// List<AllTransactionModel> allTransactions2 = parseTransactions(responseString);

  // List<AllTransactionModel> filterTransactions() {
  //   // Apply filter on the transaction list
  //   List<AllTransactionModel> filteredList =
  //       allTransactions.where((transaction) {
  //     // Apply filtering logic based on selected filters
  //     // Filter by Money In and Money Out
  //     if (isMoneyInSelected && isMoneyOutSelected) {
  //       // If both Money In and Money Out are selected, include all transactions
  //       return true;
  //     } else if (isMoneyInSelected) {
  //       // If only Money In is selected, include transactions with positive amount
  //       return int.parse(transaction.amount) >= 0;
  //     } else if (isMoneyOutSelected) {
  //       // If only Money Out is selected, include transactions with negative amount
  //       return int.parse(transaction.amount) < 0;
  //     }

  //     // Filter by Statuses
  //     if (selectedFilters.isNotEmpty) {
  //       return selectedFilters.contains(transaction.status);
  //     }

  //     // Filter by Currencies
  //     if (allCheckBox) {
  //       return true; // Include all transactions if "All Currencies" is selected
  //     } else {
  //       return uSDCheckBox && transaction.currency1 == "USD" ||
  //           cADCheckBox && transaction.currency1 == "CAD" ||
  //           gBPCheckBox && transaction.currency1 == "GBP";
  //     }

  //     // You can add more filtering logic here based on other filters if needed
  //     // ...
  //   }).toList();

  //   return filteredList;
  // }

// Usage:
// Assuming you have an instance of FilterProvider named "filterProvider"
// import 'dart:datetime';

// List<AllTransactionModel> filterTransactions(List<AllTransactionModel> transactions, Map<String, dynamic> filters) {
//   List<AllTransactionModel> filteredTransactions = [];

//   // Filter by money in or money out
//   if (filters['moneyInOut']) {
//     if (filters['moneyInOut'] == 'moneyIn') {
//       filteredTransactions = transactions.where((transaction) => transaction.amount >= 0).toList();
//     } else if (filters['moneyInOut'] == 'moneyOut') {
//       filteredTransactions = transactions.where((transaction) => transaction.amount < 0).toList();
//     }
//   }

//   // Filter by status
//   if (filters['status']) {
//     filteredTransactions = filteredTransactions.where((transaction) => transaction.status == filters['status']).toList();
//   }

//   // Filter by currency
//   if (filters['currency']) {
//     filteredTransactions = filteredTransactions.where((transaction) => transaction.currency == filters['currency']).toList();
//   }

//   // Filter by time range
//   if (filters['timeRange']) {
//     if (filters['timeRange'] == 'custom') {
//       DateTime startDateTime = filters['startDateTime'];
//       DateTime endDateTime = filters['endDateTime'];
//       filteredTransactions = filteredTransactions.where((transaction) => startDateTime <= transaction.createdAt && transaction.createdAt <= endDateTime).toList();
//     } else if (filters['timeRange'] == 'today') {
//       DateTime today = DateTime.now();
//       filteredTransactions = filteredTransactions.where((transaction) => transaction.createdAt.day == today.day).toList();
//     } else if (filters['timeRange'] == 'thisWeek') {
//       DateTime thisWeek = today - Duration(days: 7);
//       filteredTransactions = filteredTransactions.where((transaction) => transaction.createdAt.isAfter(thisWeek)).toList();
//     } else if (filters['timeRange'] == 'thisMonth') {
//       int thisMonth = today.month;
//       filteredTransactions = filteredTransactions.where((transaction) => transaction.createdAt.month == thisMonth).toList();
//     } else if (filters['timeRange'] == 'thisQuarter') {
//       int thisQuarter = today.quarter;
//       filteredTransactions = filteredTransactions.where((transaction) => transaction.createdAt.quarter == thisQuarter).toList();
//     }
//   }

//   // Filter by amount
//   if (filters['amountMin'] && filters['amountMax']) {
//     filteredTransactions = filteredTransactions.where((transaction) => filters['amountMin'] <= transaction.amount && transaction.amount <= filters['amountMax']).toList();
//   }

//   return filteredTransactions;
// }
}
