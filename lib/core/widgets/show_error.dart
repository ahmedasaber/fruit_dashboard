
import 'package:flutter/material.dart';

void showError(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(content),
      duration: Duration(seconds: 2),
    )
  );
}