// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              // style: GoogleFonts.lato(
              //   textStyle: Theme.of(context).textTheme.displayLarge,
              //   fontSize: 58,
              // ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 58,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
