import 'package:flutter/material.dart';

class MenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print(size.width);
    print(size.height);
    Path path = new Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(60, 70, size.width, 0);
    // path.quadraticBezierTo(60, 70, 50, 20);
    // path.quadraticBezierTo(30, 0, 50, 20);
    // path.quadraticBezierTo(size.width / 2, 40, size.width - 50, 20);
    // path.quadraticBezierTo(size.width - 30, 0, size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
