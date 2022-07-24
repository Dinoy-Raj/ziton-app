import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zitonapp/Error/inparent.dart';
import 'package:zitonapp/Error/inputdeco.dart';
import 'package:zitonapp/Error/overflow.dart';
import 'package:zitonapp/Error/setstate.dart';

import 'Error/viewport.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    String mode, theme, drive = "null", absFile = "null";
    int lineNumber = 0;

    try {
      absFile = TextTreeRenderer(
        maxDescendentsTruncatableNode: 5,
      )
          .render(details.toDiagnosticsNode(style: DiagnosticsTreeStyle.error))
          .trimRight()
          .split('The relevant error-causing widget was:')[1]
          .split(":")[3];
    } catch (error) {
      //skipp
    }

    try {
      drive = "${TextTreeRenderer(
        maxDescendentsTruncatableNode: 5,
      ).render(details.toDiagnosticsNode(style: DiagnosticsTreeStyle.error)).trimRight().split('The relevant error-causing widget was:')[1].split(':')[2].split('/')[3]}:";
    } catch (error) {
      //skipp
    }

    try {
      lineNumber = int.parse(TextTreeRenderer(
        maxDescendentsTruncatableNode: 5,
      )
          .render(details.toDiagnosticsNode(style: DiagnosticsTreeStyle.error))
          .trimRight()
          .split('The relevant error-causing widget was:')[1]
          .split(":")[4]);
    } catch (error) {
      //skipp
    }

    String fileName = drive + absFile;
    print(fileName);

    int i = 1;
    List<String> errorLines = [];
    // await File(fileName)
    //     .openRead()
    //     .map(utf8.decode)
    //     .transform(const LineSplitter())
    //     .forEach((l) {
    //   if (i > (lineNumber - 10) && i < (lineNumber + 10)) {
    //     errorLines.add(l.toString());
    //   }
    //   i++;
    // });

    if (kDebugMode) {
      print(errorLines);
    }

    //mode check
    if (kDebugMode) {
      mode = "Debug Mode";
    } else if (kReleaseMode) {
      mode = "Release Mode";
    } else {
      mode = "Profile Mode";
    }

    if (window.platformBrightness == Brightness.light) {
      theme = "Light";
    } else {
      theme = "Dark";
    }

    Map plat = {
      "Operating System": Platform.operatingSystem,
      "Operating System Version": Platform.operatingSystemVersion,
      "local host name": Platform.localHostname,
      "Number of processors": Platform.numberOfProcessors,
      "OS Details": Platform.version,
    };

    Map screenDetails = {
      "Pixel Ratio": window.devicePixelRatio,
      "Height": window.physicalSize.height,
      "Width": window.physicalSize.width,
      "Theme": theme,
      "Padding": {
        "Left": window.padding.left,
        "Right": window.padding.right,
        "Top": window.padding.top,
        "Bottom": window.padding.bottom,
      },
    };

    String Exception_Splited, error_file = "not available";

    try {
      error_file = TextTreeRenderer(
        maxDescendentsTruncatableNode: 5,
      )
          .render(details.toDiagnosticsNode(style: DiagnosticsTreeStyle.error))
          .trimRight()
          .split('The relevant error-causing widget was:')[1]
          .split(":")[3];
    } catch (error) {
      //skipp
    }

    if (details.exception.toString().length > 500) {
      Exception_Splited = details.exception.toString().split(".")[0];
    } else {
      Exception_Splited = details.exception.toString();
    }

    String hostUrl = "https://api.ziton.live";

    String stack = details.stack == null
        ? StackTrace.current.toString()
        : details.stack.toString();

    // print(stack);

    http.Response response =
        await http.post(Uri.parse("$hostUrl/api/flutter/"), body: {
      "stack_trace": stack,
      "name": Exception_Splited,
      "error_file_name": error_file,
      "line_number": lineNumber.toString(),
      "file": fileName.toString(),
      "starting_line_number": "21",
      "ending_line_number": "2147",
      "information": TextTreeRenderer(
        maxDescendentsTruncatableNode: 5,
      )
          .render(details.toDiagnosticsNode(style: DiagnosticsTreeStyle.error))
          .trimRight(),
      "environment": mode,
      "context": details.context.toString(),
      "library": details.library.toString(),
      "platform": json.encode(plat),
      "screen": json.encode(screenDetails),
      "project":
          "https://dnCrMoCmSzZQHTqPgLNWUdLsnaAFLQkGbKnecHuiOFVtaOZdMIqlxnWObxyC.ziton.live"
    });

    if (kDebugMode) {
      print(response.statusCode);
    }

    if (kDebugMode) {}
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
    "Vertical viewport was given unbounded height",
    "InputDecorator cannot have unbounded width",
    "Incorrect use of ParentData widget",
    "setState called during build",
  ];
  List<Widget> errorRoute = [
    const Overflow(),
    const ViewPort(),
    const InputDeco(),
    const InParent(),
    const SetSta(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: screenWidth*.08, right: screenWidth*.08, top: screenHeight * .1),
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
