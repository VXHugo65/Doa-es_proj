import 'package:flutter/material.dart';

class EventDetailRow extends StatelessWidget {
  const EventDetailRow({
    super.key,
    required this.label,
    required this.detail,
  });

  final String label;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$label:  ",
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          TextSpan(
            text: detail,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              // overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
