import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/home_screen.dart';
import 'package:netflix_clone/screen/like_screen.dart';
import 'package:netflix_clone/screen/more_screen.dart';
import 'package:netflix_clone/screen/search_screen.dart';
import 'package:netflix_clone/widget/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }
  @override
  void initState(){
    initializeFlutterFire();
    super.initState();
  }
  TabController controller;
  @override
  Widget build(BuildContext context) {
        // Show error message if initialization failed
    if(_error) {
      print('error');
    }
    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      print('wait');
    }

    return MaterialApp(
      title: 'Netfilx',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              SearchScreen(),
              LikeScreen(),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
