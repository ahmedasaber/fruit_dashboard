import 'package:flutter/material.dart';

Widget buildPaymentMethodChip(String method) {
  final isCash = method.toLowerCase() == 'cash';
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: isCash ? Colors.green.shade100 : Colors.blue.shade100,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isCash ? Icons.payments : Icons.credit_card,
          size: 16,
          color: isCash ? Colors.green.shade900 : Colors.blue.shade900,
        ),
        const SizedBox(width: 4),
        Text(
          method.toUpperCase(),
          style: TextStyle(
            color: isCash ? Colors.green.shade900 : Colors.blue.shade900,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
