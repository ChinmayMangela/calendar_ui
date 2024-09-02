import 'package:calendar_ui/helper/helper_functions.dart';
import 'package:calendar_ui/presentation/widget/medication_list_component.dart';
import 'package:calendar_ui/presentation/widget/my_calendar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Calender',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color(0xFF4A734A),
                fontSize: 60,
                fontWeight: FontWeight.bold,
                  ),
            ),
            const MyCalendar(),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xff72a172),
              width: double.infinity,
              child: Column(
                children: [
                  Text('Today, ${HelperFunctions.getFormattedDate(now)}', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color(0xFF203020),
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),),
                  Text('Medications for The Day', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color(0xFF365336),
                  ),),

                ],
              ),

            ),
            const SizedBox(height: 20),
            const MedicationListComponent(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }


}
