import 'package:flutter/material.dart';

class ViewPort extends StatefulWidget {
  const ViewPort({Key? key}) : super(key: key);

  @override
  State<ViewPort> createState() => _ViewPortState();
}

class _ViewPortState extends State<ViewPort> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height:screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            ListView(),
          ],
        ),
      ),
    );
  }
}
