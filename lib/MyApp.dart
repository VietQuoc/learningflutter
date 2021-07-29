import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp();
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String _username = '';
  String _password = '';
  final usernameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  @override
  void initState() {
    print('Lần đầu tiên load');
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print('Ra khỏi app');
    WidgetsBinding.instance!.removeObserver(this);
    usernameEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('change');
    if (state == AppLifecycleState.paused) {
      print('pause');
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quoc Flutter',
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login Form',
                  style: TextStyle(fontSize: 30, color: Colors.blue[600]),
                  textDirection: TextDirection.ltr,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: usernameEditingController,
                    onChanged: (text) => {
                      this.setState(() {
                        _username = text;
                      })
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      labelText: 'Username',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: passwordEditingController,
                    obscureText: true,
                    onChanged: (value) => {
                      this.setState(() {
                        _password = value;
                      })
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextButton(
                    onPressed: () => onClickLogin(),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.red,
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onClickLogin() {
    print(
        'Username: ${usernameEditingController.text} - Passwork: ${passwordEditingController.text}');
    usernameEditingController.clear();
    passwordEditingController.clear();
  }
}
