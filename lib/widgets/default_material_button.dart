import 'package:flutter/material.dart';


class DefaultMaterialButton extends StatefulWidget {
  const DefaultMaterialButton({super.key, required this.text, required this.fcn, this.icon });

  final void Function() fcn;
  final String text;
  final IconData? icon;

  @override
  State<DefaultMaterialButton> createState() => _DefaultMaterialButtonState();
}

class _DefaultMaterialButtonState extends State<DefaultMaterialButton>
{
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,child: IconButton(

      onPressed: widget.fcn,
      highlightColor: Colors.blueAccent,
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(mainAxisAlignment: widget.icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,children: [
          (widget.icon != null ? Icon(widget.icon!,color: Colors.white,): const SizedBox.shrink()),
          widget.icon != null ? const SizedBox(width: 10,):const SizedBox.shrink() ,
          Text(
          textAlign: TextAlign.center,
          widget.text,
          style: const TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
        ),
        ],)
      ),
    ),);
  }
}
