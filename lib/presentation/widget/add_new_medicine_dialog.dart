import 'package:calendar_ui/domain/models/medicine.dart';
import 'package:calendar_ui/helper/helper_functions.dart';
import 'package:calendar_ui/presentation/providers/medicine_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewMedicineDialog extends StatefulWidget {
  const AddNewMedicineDialog({super.key});

  @override
  State<AddNewMedicineDialog> createState() => _AddNewMedicineDialogState();
}

class _AddNewMedicineDialogState extends State<AddNewMedicineDialog> {
  final _medicineNameController = TextEditingController();
  final _timesToTakeController = TextEditingController();

  @override
  void dispose() {
    _medicineNameController.dispose();
    _timesToTakeController.dispose();
    super.dispose();
  }

  void _addToList() {
    final nameOfMedicine = _medicineNameController.text.trim();
    final timesToTake = _timesToTakeController.text.trim();

    if(nameOfMedicine.isEmpty || timesToTake.isEmpty) {
      HelperFunctions.showSnackBar(context, 'please enter all fields');
      return;
    }

    if(int.parse(timesToTake) < 1) {
      HelperFunctions.showSnackBar(context, 'Enter valid time');
      return;
    }

    final newMedicine = Medicine(medicineName: nameOfMedicine, timesToTake: int.parse(timesToTake));
    Provider.of<MedicineListProvider>(context, listen: false).addMedicine(newMedicine);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _inputField(TextInputType.text, 'Enter Medicine name', _medicineNameController),
          const SizedBox(height: 10),
          _inputField(TextInputType.number, 'Enter taking time', _timesToTakeController),
          _buildButtonsRow(context),
        ],
      ),
    );
  }

  Widget _inputField(TextInputType keyboardType, String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: _addToList,
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
