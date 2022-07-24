import 'package:flutter/material.dart';

class Overflow extends StatefulWidget {
  const Overflow({Key? key}) : super(key: key);

  @override
  State<Overflow> createState() => _OverflowState();
}

class _OverflowState extends State<Overflow> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * .3,
              width: screenWidth * .7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.black),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight,
                    width: screenWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
