import 'package:flutter/material.dart';

Container gradient({Widget child}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff4158D0), Color(0xffC850C0), Color(0xffFFCC70)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: child,
  );
}
