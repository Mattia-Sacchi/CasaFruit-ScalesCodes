


import 'package:casa_fruit_scale_codes/objects/scale_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/edit_screen.dart';
import '../widgets/custom_list_tile.dart';

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
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    separatorBuilder: (context, index) {
      return const SizedBox(height: 20,);
    },
    shrinkWrap: true,
    itemCount: scList.length,
    itemBuilder: (context, index) {
      ScaleCode sc = scList[index];
      return CustomListTile(sc: sc);
    },
  );
}