import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime today = DateTime.now();
  DateTime? _selectedDay;

  void onDaySelected(DateTime day, DateTime focus) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      child: SingleChildScrollView(
        child: TableCalendar(
          currentDay: today,
          focusedDay: today,
          firstDay: DateTime(1947, 1, 20),
          lastDay: DateTime(2040, 1, 20),
          onDaySelected: onDaySelected,
          selectedDayPredicate: (day) {
            return isSameDay(day, today);
          },
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: const Color(0xFF375137),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
