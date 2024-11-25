import 'package:flutter/material.dart';

class DefaultMaterialButton extends StatelessWidget {
  const DefaultMaterialButton(
      {super.key, required this.text, required this.fcn, this.icon});

  final void Function() fcn;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: IconButton(
        onPressed: fcn,
        highlightColor: Colors.blueAccent,
        icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Row(
              mainAxisAlignment: icon != null
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                icon != null
                    ? Icon(
                  icon!,
                  color: Colors.white,
                )
                    : const SizedBox.shrink(),
                icon != null
                    ? const SizedBox(
                  width: 10,
                )
                    : const SizedBox.shrink(),
                Text(
                  textAlign: TextAlign.center,
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
    );
  }
}


