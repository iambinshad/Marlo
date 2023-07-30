import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:marlo_technologies/common/widgets.dart';
import 'package:marlo_technologies/controller/provider/calender_provider.dart';
import 'package:provider/provider.dart';

class ScreenFive extends StatelessWidget {
  ScreenFive({Key? key}) : super(key: key);

  List<int> listOfDatesInMonth(DateTime currentDate) {
    var selectedMonthFirstDay =
        DateTime(currentDate.year, currentDate.month, currentDate.day);
    var nextMonthFirstDay = DateTime(selectedMonthFirstDay.year,
        selectedMonthFirstDay.month + 1, selectedMonthFirstDay.day);
    var totalDays = nextMonthFirstDay.difference(selectedMonthFirstDay).inDays;

    var listOfDates = List<int>.generate(totalDays, (i) => i + 1);
    return listOfDates;
  }

  int getIndexOfFirstDayInMonth(DateTime currentDate) {
    var selectedMonthFirstDay =
        DateTime(currentDate.year, currentDate.month, 1);
    var day = DateFormat('EEE').format(selectedMonthFirstDay).toUpperCase();

    return daysOfWeek.indexOf(day) + 1;
  }

  final List<String> daysOfWeek = [
    "M",
    "T",
    "W",
    "T",
    "F",
    "S",
    "S",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Custome Time Range",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Consumer<CalenderProvider>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "${DateFormat('MMMM d, yyyy').format(value.selectedDate)} - ",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  DateFormat('MMMM d, yyyy').format(value.selectedDate2),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        const KHeight(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 122, 121, 121).withOpacity(0.3),
                spreadRadius: 0.1,
                blurRadius: 9,
                offset: const Offset(0, 7.75),
              ),
            ],
          ),
          height: 50,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: daysOfWeek.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  daysOfWeek[index],
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
        const KHeight(
          height: 40,
        ),
        const SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "January 2023",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Consumer<CalenderProvider>(
          builder: (context, value, child) => SizedBox(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: listOfDatesInMonth(value.selectedDate).length +
                  getIndexOfFirstDayInMonth(value.selectedDate),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      if (index >=
                          getIndexOfFirstDayInMonth(value.selectedDate)) {
                        int dayOfMonth = index -
                            getIndexOfFirstDayInMonth(value.selectedDate) +
                            1;
                        value.changeSelectedDate(DateTime(
                            value.selectedDate.year,
                            value.selectedDate.month,
                            dayOfMonth));
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index ==
                                getIndexOfFirstDayInMonth(value.selectedDate) +
                                    value.selectedDate.day -
                                    1
                            ? Colors.blue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child:
                          index < getIndexOfFirstDayInMonth(value.selectedDate)
                              ? const Text("")
                              : Text(
                                  '${index + 1 - getIndexOfFirstDayInMonth(value.selectedDate)}',
                                  style: TextStyle(
                                    color: index ==
                                            getIndexOfFirstDayInMonth(
                                                    value.selectedDate) +
                                                value.selectedDate.day -
                                                1
                                        ? Colors.white
                                        : index % 7 == 6
                                            ? Colors.redAccent
                                            : Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "February 2023",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0.1,
                blurRadius: 7,
                offset: const Offset(0, 7.75),
              ),
            ],
          ),
          child: Consumer<CalenderProvider>(
            builder: (context, value, child) => GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: listOfDatesInMonth(value.selectedDate2).length +
                  getIndexOfFirstDayInMonth(value.selectedDate2),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      if (index >=
                          getIndexOfFirstDayInMonth(value.selectedDate2)) {
                        int dayOfMonth = index -
                            getIndexOfFirstDayInMonth(value.selectedDate2) +
                            1;
                        value.changeSelectedDate2(DateTime(
                            value.selectedDate2.year,
                            value.selectedDate2.month,
                            dayOfMonth));
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index ==
                                getIndexOfFirstDayInMonth(value.selectedDate2) +
                                    value.selectedDate2.day -
                                    1
                            ? Colors.blue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child:
                          index < getIndexOfFirstDayInMonth(value.selectedDate2)
                              ? const Text("")
                              : Text(
                                  '${index + 1 - getIndexOfFirstDayInMonth(value.selectedDate2)}',
                                  style: TextStyle(
                                    color: index ==
                                            getIndexOfFirstDayInMonth(
                                                    value.selectedDate2) +
                                                value.selectedDate2.day -
                                                1
                                        ? Colors.white
                                        : index % 7 == 6
                                            ? Colors.redAccent
                                            : Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
