import 'dart:math';

import 'package:flutter/material.dart';

class PageTransition extends StatelessWidget {
  final double revealPercent;
  final Widget child;

  PageTransition({
    this.revealPercent,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return new ClipOval(
      clipper: new CircleRevealClipper(revealPercent),
      child: child,
    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect> {
  final double revealPercent;

  CircleRevealClipper(
    this.revealPercent,
  );

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    final epicenter = new Offset(size.width / 2, size.height * 0.9);
    double thetha = atan(epicenter.dy / epicenter.dx);
    final distancetoCorner = epicenter.dy / sin(thetha);
    final radius = distancetoCorner * revealPercent;
    final diameter = 2 * radius;
    return new Rect.fromLTWH(epicenter.dx-radius, epicenter.dy-radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
