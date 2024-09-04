import 'package:flutter/material.dart';

class SwipeRight extends PageRouteBuilder {
  final Widget page;
  SwipeRight({required this.page}) // Modify constructor
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.ease,
                  reverseCurve:
                      Curves.easeInOut, // You can change the reverse curve here
                ),
              ),
              child: child,
            );
          },
          transitionDuration:
              const Duration(milliseconds: 300), // Set transition duration
        );
}
