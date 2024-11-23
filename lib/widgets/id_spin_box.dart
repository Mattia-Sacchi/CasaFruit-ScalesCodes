import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class IdSpinBox extends StatefulWidget {
  const IdSpinBox({super.key, required this.controller,});

  final TextEditingController controller;

  @override
  State<IdSpinBox> createState() => _IdSpinBoxState();
}

class _IdSpinBoxState extends State<IdSpinBox>
{
  @override
  void initState() {
    widget.controller.text = "01";
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(widthFactor: 0.8,child:
      TextFormField(controller: widget.controller,
        validator: (value)
        {

          if(value == null || value.isEmpty) {
            return "Please enter a Id";
          }
          int? id = int.tryParse(value);
          if(id == null) {
            return "Please enter a valid Id";
          }

          if(id < 1)
          {
            return "Please enter a bigger number than 0";
          }

          return null;
        },
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.black,),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly, // Allow only digits
        ],),);
  }
}
