import 'package:flutter/cupertino.dart';

class UpperRectangleShape extends ShapeBorder {
  const UpperRectangleShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.topLeft.dx, rect.topLeft.dy);
    path.lineTo(rect.topRight.dx, rect.topRight.dy);
    path.lineTo(rect.bottomRight.dx, rect.bottomRight.dy);
    path.lineTo(rect.bottomLeft.dx, rect.bottomLeft.dy - 120);
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class BelowContainerShape extends ShapeBorder {
  const BelowContainerShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.topLeft.dx, rect.topLeft.dy - 120);
    path.lineTo(rect.topRight.dx, rect.topRight.dy);
    path.lineTo(rect.bottomRight.dx, rect.bottomRight.dy);
    path.lineTo(rect.bottomLeft.dx, rect.bottomLeft.dy);
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
