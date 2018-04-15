import 'package:flutter/material.dart';

final pages = [
  new PageFirstScreenViewModel(
      Colors.blue.withOpacity(1.0),
      'Came to right place',
      'Lonely AF?',
      '',
      'assets/images/boy128.png',
      'CaviarDreams'),
  new PageFirstScreenViewModel(
      Colors.black38.withOpacity(1.0),
      'There is only one happiness in this life, to love and be loved.',
      '-George Sand',
      '',
      'assets/images/heart128.png',
      'CaviarDreams'),
  new PageFirstScreenViewModel(
      Colors.redAccent.withOpacity(1.0),
      'Lets find someone. Who don\'t share how you look ',
      'Let\'s Start',
      '',
      'assets/images/hands128.png',
      'CaviarDreams'),
];

class PageFirstScreen extends StatelessWidget {
  final PageFirstScreenViewModel viewModel;
  final double percentVisible;

  PageFirstScreen({this.viewModel, this.percentVisible = 1.0});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      color: viewModel.color,
      child: new Opacity(
        opacity: percentVisible,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 50.0 * (1.0 - percentVisible), 0.0),
              child: new Padding(
                padding: new EdgeInsets.only(bottom: 1.0),
                child: new Image.asset(
                  viewModel.imageAsset,
                  width: 200.00,
                  height: 200.0,
                ),
              ),
            ),
            new Transform(
              transform: Matrix4.translationValues(
                  0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: new Text(
                viewModel.body,
                style: new TextStyle(
                  color: Colors.white,
                  fontFamily: viewModel.fontFamily,
                  fontSize: 34.0,
                ),
              ),
            ),
            new Transform(
              transform: Matrix4.translationValues(
                  0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: new Padding(
                padding: new EdgeInsets.only(bottom: 50.0),
                child: new Text(
                  viewModel.title,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.white,
                    fontFamily: viewModel.fontFamily,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageFirstScreenViewModel {
  final Color color;
  final String title;
  final String body;
  final String iconIndicator;
  final String imageAsset;
  final String fontFamily;

  PageFirstScreenViewModel(this.color, this.title, this.body,
      this.iconIndicator, this.imageAsset, this.fontFamily);
}
