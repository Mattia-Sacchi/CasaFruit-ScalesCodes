import 'package:flutter/material.dart';


class NameTextField extends StatefulWidget {
  const NameTextField({super.key, required this.controller,});

  final TextEditingController controller;

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField>
{
  @override
  void initState() {
    widget.controller.text = "";
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(widthFactor: 0.8,child:
    TextFormField(
      decoration: InputDecoration(
          label: const Text("Name"),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10))),
      validator: (value)
      {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        if( value.length < 3) {
          return "At least 3 characters";
        }

        return null;
      },
      controller: widget.controller,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.black,),
    ),);
  }
}
