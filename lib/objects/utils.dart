


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void failedAlert(BuildContext context,String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: ListTile(
        title: const Text("Failed", style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        subtitle: Text(text,style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
      ),
    ),
  );
}