import 'package:flutter/material.dart';

import '../widgets/default_material_button.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key,});


  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).primaryColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        title: const Text("Settings",),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Flexible(flex:1, child: SizedBox.shrink()),
            DefaultMaterialButton(text: "Export data", fcn: () => throw UnimplementedError(),icon: null),
            DefaultMaterialButton(text: "Home Page", fcn: () => Navigator.of(context).pop(),icon: null,),
            const Flexible(flex:1, child: SizedBox.expand())
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
