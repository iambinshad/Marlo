import 'package:flutter/cupertino.dart';

class CalenderProvider with ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 1);

  void changeSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void changeSelectedDate2(DateTime date) {
    selectedDate2 = date;
    notifyListeners();
  }
}
