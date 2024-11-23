import 'package:casa_fruit_scale_codes/screens/add_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/default_material_button.dart';


class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key,});


  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        title: const Text("Manage Codes",),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Flexible(flex:1, child: SizedBox.shrink()),
            DefaultMaterialButton(text: "Add", fcn: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddScreen()),
            ),icon: Icons.add),
            DefaultMaterialButton(text: "Edit", fcn: () => throw UnimplementedError(),icon: null),
            DefaultMaterialButton(text: "Remove", fcn: () => throw UnimplementedError(),icon: null),
            DefaultMaterialButton(text: "Home Page", fcn: () => Navigator.of(context).pop(),icon: null),
            const Flexible(flex:1, child: SizedBox.expand())
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
