import 'package:calendar_ui/helper/helper_functions.dart';
import 'package:calendar_ui/presentation/providers/medicine_list_provider.dart';
import 'package:calendar_ui/presentation/widget/add_new_medicine_dialog.dart';
import 'package:calendar_ui/presentation/widget/medication_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedicationListComponent extends StatelessWidget {
  const MedicationListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: IconButton(
                  onPressed: () => HelperFunctions.openInputMedicineDialog(
                        context,
                        const AddNewMedicineDialog(),
                      ),
                  icon: const Icon(Icons.add)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(child: Consumer<MedicineListProvider>(
                builder: (context, medicationList, widget) {
              return ListView.builder(
                  itemCount: medicationList.listOfMedicines.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final currentMedicine =
                        medicationList.listOfMedicines[index];
                    return MedicationCard(medicineSchedule: currentMedicine);
                  });
            })),
          ),
        ],
      ),
    );
  }
}
