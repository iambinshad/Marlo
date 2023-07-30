import 'dart:developer';

import 'package:flutter/cupertino.dart';

class FilterProvider with ChangeNotifier {
  Set<String> selectedFilters = {};

  bool allCheckBox = false;
  bool uSDCheckBox = false;
  bool cADCheckBox = false;
  bool gBPCheckBox = false;

  void setCheckBox(String box) {
    if (box == 'allCurrencies') {
      allCheckBox = !allCheckBox;
      uSDCheckBox = allCheckBox;
      cADCheckBox = allCheckBox;
      gBPCheckBox = allCheckBox;
      notifyListeners();
    } else if (box == 'USD') {
      uSDCheckBox = !uSDCheckBox;
      notifyListeners();
    } else if (box == 'CAD') {
      cADCheckBox = !cADCheckBox;
      notifyListeners();
    } else if (box == 'GBP') {
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

  bool isMoneyInSelected = true;
  bool isMoneyOutSelected = false;
  void clickMoneyIn() {
    log('hei1');

    isMoneyInSelected = !isMoneyInSelected;
    isMoneyOutSelected = !isMoneyInSelected;
    notifyListeners();
  }

  void clickMoneyOut() {
    log('hei2');
    isMoneyOutSelected = !isMoneyOutSelected;
    isMoneyInSelected = !isMoneyOutSelected;
    notifyListeners();
  }
}
