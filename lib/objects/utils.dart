


import 'package:casa_fruit_scale_codes/objects/scale_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/edit_screen.dart';

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

Widget buildSearchPage(BuildContext context, List<ScaleCode> scList)
{
  return ListView.separated(
    separatorBuilder: (context, index) {
      return const SizedBox(height: 20,);
    },
    shrinkWrap: true,
    itemCount: scList.length,
    itemBuilder: (context, index) {
      ScaleCode sc = scList[index];
      return Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 35,
              child: Text(sc.id.toString(), style: const TextStyle(color: Colors.white),),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sc.name,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.black),
                ),
                if (sc.description.isNotEmpty) Text(sc.description,)  ,
              ],

            ),
            IconButton(onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditScreen(sc: sc,fromSearchScreen: true,)),
              );

            }, icon: const Icon(Icons.edit) ),

          ],
        ),
      );
    },
  );
}