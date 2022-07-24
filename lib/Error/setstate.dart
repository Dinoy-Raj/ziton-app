import 'package:flutter/material.dart';

class SetSta extends StatefulWidget {
  const SetSta({Key? key}) : super(key: key);

  @override
  State<SetSta> createState() => _SetStaState();
}

class _SetStaState extends State<SetSta> {
  @override
  Widget build(BuildContext context) {
    // Don't do this.
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Alert Dialog"),
          );
        });

    return Center(
      child: Column(
        children: const <Widget>[
          Text('Show Material Dialog'),
        ],
      ),
    );
  }
}
