import 'package:flutter/material.dart';
import 'package:navigasi/src/components/button_component.dart';

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({Key? key, required this.message, required this.onPressed})
      : super(key: key);
  final String message;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Gagal Login",
        style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.red),
      ),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Text(message, style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black),
                textAlign: TextAlign.center
                ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          child: ButtonComponent(text: 'OK',onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}