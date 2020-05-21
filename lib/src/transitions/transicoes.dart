import 'package:flutter/material.dart';

Route routeJogo(Widget tela) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => tela,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
