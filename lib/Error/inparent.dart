import 'package:flutter/material.dart';

class InParent extends StatefulWidget {
  const InParent({Key? key}) : super(key: key);

  @override
  State<InParent> createState() => _InParentState();
}

class _InParentState extends State<InParent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Row(children: [],));
  }
}
