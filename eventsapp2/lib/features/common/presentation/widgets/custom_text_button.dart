// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.lightText,
    required this.boldText,
    required this.onPressed,
  });

  final String lightText;
  final String boldText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: lightText,
              // style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            TextSpan(
              text: boldText,
              style: const TextStyle(
                fontSize: 16,
                // color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
