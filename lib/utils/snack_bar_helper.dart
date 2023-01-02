import 'package:flutter/material.dart';

extension SnackBarHelper on BuildContext {

  Future<void> showSnackBar(String? message) async {
    final snackBar = SnackBar(
      content: Text(message ?? 'Ups, something went wrong'),
      duration: const Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

}