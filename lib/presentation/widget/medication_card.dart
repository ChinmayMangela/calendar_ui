import 'dart:math';

import 'package:calendar_ui/domain/models/medicine.dart';
import 'package:flutter/material.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({
    super.key,
    required this.medicineSchedule,
  });

  final Medicine medicineSchedule;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.yellowAccent,
      Colors.red,
      Colors.purpleAccent,
      Colors.pink,
      Colors.blue,
    ];
    final random = Random().nextInt(colors.length);
    final color = colors[random];
    return Container(
      width: MediaQuery.of(context).size.width * 0.27,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black
        ),
        borderRadius: BorderRadius.circular(16),
        color: color.withOpacity(0.6),
      ),
      child: Column(
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            medicineSchedule.medicineName,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            '${medicineSchedule.timesToTake} times a day',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
