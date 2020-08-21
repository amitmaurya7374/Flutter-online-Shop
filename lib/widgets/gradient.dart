import 'package:flutter/material.dart';

Container gradient({Widget child}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff00DBDE),
          Color(0xffFC00FF),
          // Color(0xffFFCC70),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: child,
  );
}
