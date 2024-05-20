import 'package:flutter/material.dart';

void navigateWithReplacement(BuildContext context, Widget page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

void navigate(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}
