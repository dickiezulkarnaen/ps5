import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({Key? key, required this.message, required this.callback}) : super(key: key);

  final String message;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Error', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
        const SizedBox(height: 10,),
        Text(message),
        const SizedBox(height: 10,),
        OutlinedButton(
          onPressed: () => callback.call(),
          child: const Text('Retry'),
        )
      ],
    );
  }
}

const commonErrorMessage = 'Ups, something went wrong!';
