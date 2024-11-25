

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../objects/scale_code.dart';
import '../screens/edit_screen.dart';

class CustomListTile extends StatelessWidget
{

  const CustomListTile({super.key, required this.sc});

  final ScaleCode sc;

  Widget build(BuildContext context)
  {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Text("${sc.id}", style: Theme.of(context).textTheme.titleLarge!.apply(color: Colors.black),),

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sc.name,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.black),
                    ),
                    if (sc.description.isNotEmpty) Text(sc.description,)  ,
                  ],

                ),
              ),


            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditScreen(sc: sc,fromSearchScreen: true,)),
              );

            }, icon: const Icon(Icons.edit) ),
          ),
        ],
      ),
    );
  }
}