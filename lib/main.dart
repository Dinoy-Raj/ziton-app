import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:ziton_error/ziton_error.dart';
import 'package:flutter/material.dart';
import 'package:zitonapp/Error/inparent.dart';
import 'package:zitonapp/Error/inputdeco.dart';
import 'package:zitonapp/Error/overflow.dart';
import 'package:zitonapp/Error/setstate.dart';

import 'Error/viewport.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    ZitonError(
        "https://BQZsqRJtZUnmLbUnaudOimRPjhFJIaNhsIlzhavqcDuVAGBZEvOMQsnyFrtL.ziton.live",
        errorDetails);
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ziton App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> errorName = [
    "RenderFlex overflowed",
    "InputDecorator cannot have unbounded width",
    "Incorrect use of ParentData widget",
    "setState called during build",
    "Vertical viewport was given unbounded height",
  ];
  List<Widget> errorRoute = [
    const Overflow(),
    const InputDeco(),
    const InParent(),
    const SetSta(),
    const ViewPort(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * .08,
            right: screenWidth * .08,
            top: screenHeight * .1),
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              const Text(
                "Error List",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: screenHeight * .8,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: errorName.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * .06),
                      child: Container(
                        height: screenHeight * .06,
                        width: screenWidth * .6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => errorRoute[index]));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shadowColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(0),
                            overlayColor: MaterialStateProperty.all(
                                Colors.grey.withOpacity(.2)),
                          ),
                          child: Text(
                            errorName[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.clip,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void errorun() {
  try {} catch (error) {
    ReportError(
        "https://OokNpSGVsSrzqesUiHBTXHnzFDtGMVoViJdgtXcFNCUmYwhQhwXiouYWbTFy.ziton.live",
        "error function does not exist",
        "main.dart",
        "error in running this code.this code produces error that must be reported to the ziton live");
  }
}
