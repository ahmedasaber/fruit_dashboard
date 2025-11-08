import 'package:flutter/material.dart';

Widget buildAddressInfo(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 28, top: 4),
    child: Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    ),
  );
}
