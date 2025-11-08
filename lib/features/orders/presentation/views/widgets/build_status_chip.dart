import 'package:flutter/material.dart';

Widget buildStatusChip(String status) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.orange.shade100,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      status,
      style: TextStyle(
        color: Colors.orange.shade900,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    ),
  );
}
