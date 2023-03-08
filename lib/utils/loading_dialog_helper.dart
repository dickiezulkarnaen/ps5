import 'package:flutter/material.dart';

class LoadingHelper {

  static BuildContext? dialogContext;

  static void hideLoadingDialog() {
    if (dialogContext != null) {
      Navigator.pop(dialogContext!);
    }
    dialogContext = null;
  }

  static void showLoadingDialog(BuildContext context){
    dialogContext = context;
    showDialog(
      barrierDismissible: false,
      context: dialogContext!,
      builder: (ctx) => AlertDialog(
        content: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent
          ),
          width: 60,
          height: 60,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}