import 'package:company_name/PageFirstScreen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class PageIndexer extends StatelessWidget {
  final PageIndexViewModel indexViewModel;

  PageIndexer({
    this.indexViewModel,
  });

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubble = [];
    for (var i = 0; i < indexViewModel.page.length; ++i) {
      final page = indexViewModel.page[i];
      bubble.add(
        new PageBubble(
          bubbleViewModel: new PageBubbleViewModel(
              Colors.black87.withOpacity(1.0),
              page.color.withOpacity(1.0),
              i == indexViewModel.isactive ? 1.0 : 0.0,
              page.iconIndicator,
              false),
        ),
      );
    }
    return new Column(
      children: [
        new Expanded(child: new Container()),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bubble,
        ),
      ],
    );
  }
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel bubbleViewModel;

  PageBubble({
    this.bubbleViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        width: lerpDouble(7.0, 27.0, bubbleViewModel.activePercent),
        height: lerpDouble(7.0, 27.0, bubbleViewModel.activePercent),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: bubbleViewModel.isHollow
                ? Colors.transparent
                : bubbleViewModel.insideColor,
            border: new Border.all(
              color: bubbleViewModel.color,
              width: 1.0,
            )),
        child: new Opacity(
            opacity: bubbleViewModel.activePercent,
            child: new Image.asset(bubbleViewModel.indexImage)),
      ),
    );
  }
}

enum SlideDirection {
  LtR,
  RtL,
  none,
}

class PageIndexViewModel {
  final List<PageFirstScreenViewModel> page ;
  final int isactive;
  final SlideDirection slideDirection;
  final double slidePercent;

  PageIndexViewModel(
      this.slideDirection, this.page, this.isactive, this.slidePercent);
}

class PageBubbleViewModel {
  final String indexImage;
  final Color color;
  final Color insideColor;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(this.color, this.insideColor, this.activePercent,
      this.indexImage, this.isHollow);
}
