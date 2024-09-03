import 'package:calendar_ui/domain/models/medicine.dart';
import 'package:flutter/material.dart';

class MedicineListProvider extends ChangeNotifier {

  List<Medicine> _list =  [
    Medicine(medicineName: 'Azithromasen', timesToTake: 3),
    Medicine(medicineName: 'Panadal', timesToTake: 3),
    Medicine(medicineName: 'Panadal', timesToTake: 3),
    Medicine(medicineName: 'Panadal', timesToTake: 3)
  ];

  List<Medicine> get listOfMedicines => _list;

  void addMedicine(Medicine newMedicine) {
    _list.add(newMedicine);
    notifyListeners();
  }
}