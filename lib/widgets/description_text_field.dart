import 'package:flutter/material.dart';


class DescriptionTextField extends StatefulWidget {
  const DescriptionTextField({super.key, required this.controller,});

  final TextEditingController controller;

  @override
  State<DescriptionTextField> createState() => _DescriptionTextFieldState();
}

class _DescriptionTextFieldState extends State<DescriptionTextField>
{
  @override
  void initState() {
    widget.controller.text = "";
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(widthFactor: 0.8,child:
    TextField(
      controller: widget.controller,
      decoration: const InputDecoration(labelText: "Description"),
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.black,),
      maxLines: 3,
      expands: false,
    ),);
  }
}
