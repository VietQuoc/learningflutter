import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyApp extends StatefulWidget {
  MyApp();
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
    throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String _content = '';
  double _amount = 0.0;
  final _contentEditingController = TextEditingController();
  final _amountEdittingController = TextEditingController();
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  void _onClickButton(context) {
    this.setState(() {
      _content = _contentEditingController.text;
      _amount = double.tryParse(_amountEdittingController.text) ?? 0;
    });
    _messangerKey.currentState!.showSnackBar(SnackBar(
        content: Text(
            'Mất ${double.tryParse(_amountEdittingController.text) ?? 0}')));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuocApp',
      scaffoldMessengerKey: _messangerKey,
      home: Scaffold(
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: _contentEditingController,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: _amountEdittingController,
                  decoration: InputDecoration(
                    labelText: 'Amount(money)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () => {
                    _onClickButton(context),
                  },
                  child: Text(
                    'Button',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Content: $_content - Amount: $_amount',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                  textDirection: TextDirection.ltr,
                ),
              ),
            ],
          ),
        )),
      ),
    );
    throw UnimplementedError();
  }
}
