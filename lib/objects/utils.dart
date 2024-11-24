


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void failedAlert(BuildContext context,String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: ListTile(
        title: const Text("Failed"),
        subtitle: Text(text),
      ),
    ),
  );
}