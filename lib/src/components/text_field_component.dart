import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const TextFieldComponent({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class TextFieldPasswordComponent extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const TextFieldPasswordComponent({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  @override
  State<TextFieldPasswordComponent> createState() =>
      _TextFieldPasswordComponentState();
}

class _TextFieldPasswordComponentState
    extends State<TextFieldPasswordComponent> {
  bool _isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isSecure,
        decoration: InputDecoration(
          hintText: widget.text,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(_isSecure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isSecure = !_isSecure;
              });
            },
          ),
        ),
      ),
    );
  }
}
