import 'package:flutter/material.dart';

class DescriptionTextField extends StatefulWidget {
  const DescriptionTextField({
    super.key,
    required this.controller,
    this.startDescription,
  });

  final TextEditingController controller;
  final String? startDescription;

  @override
  State<DescriptionTextField> createState() => _DescriptionTextFieldState();
}

class _DescriptionTextFieldState extends State<DescriptionTextField> {
  @override
  void initState() {
    widget.controller.text = widget.startDescription ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
            label: const Text("Description"),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10))),
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.bodyLarge!.apply(
              color: Colors.black,
            ),
        maxLines: 3,
        expands: false,
      ),
    );
  }
}
