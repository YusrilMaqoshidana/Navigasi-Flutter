import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonComponent({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.90;
    return Center(
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: Size(buttonWidth, 50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                text,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )));
  }
}
