import 'package:flutter/material.dart';

class InputDeco extends StatefulWidget {
  const InputDeco({Key? key}) : super(key: key);

  @override
  State<InputDeco> createState() => _InputDecoState();
}

class _InputDecoState extends State<InputDeco> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextField(),
      ],
    );
  }
}
