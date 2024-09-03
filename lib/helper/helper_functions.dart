import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperFunctions {
  static String getFormattedDate(DateTime date) {
    final formatter = DateFormat('d MMMM, E');
    final formattedDate = formatter.format(date);
    return formattedDate;
  }

  static void openInputMedicineDialog(BuildContext context, Widget child) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: child,
          );
        });
  }

  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}
