import 'package:flutter/material.dart';
import 'PageFirstScreen.dart';
import 'PageTransition.dart';
import 'Pager_Indexer.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: new Scaffold(
        body: new Center(
          child: FirstScreen(),
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => new FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: [
          new PageFirstScreen(
            viewModel: pages[0],
            percentVisible: 1.0,
          ),
          new PageTransition(
            revealPercent: 0.0,
            child: new PageFirstScreen(
              viewModel: pages[1],
              percentVisible: 1.0,
            ),
          ),
          new PageTransition(
            child: new PageFirstScreen(
              viewModel: pages[2],
              percentVisible: 1.0,
            ),
          ),
          new PageIndexer(
            indexViewModel: new PageIndexViewModel(
              SlideDirection.none,
              pages,
              1,
              0.0,
            ),
          ),
        ],
      ),
    );
  }
}
