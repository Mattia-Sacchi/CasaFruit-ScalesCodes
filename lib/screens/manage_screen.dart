import 'package:casa_fruit_scale_codes/screens/add_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/default_material_button.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({
    super.key,
  });

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

enum ButtonId {
  BI_Edit,
  BI_Add,
  BI_Remove,
}

class _ManageScreenState extends State<ManageScreen> {
  void buttonClicked(ButtonId id) {
    switch (id) {
      case ButtonId.BI_Add:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddScreen()));
        break;
      case ButtonId.BI_Edit:
      case ButtonId.BI_Remove:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  id == ButtonId.BI_Edit ? 'Edit' : 'Remove',
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                        color: Colors.black,
                      ),
                ),
                content: Text('Select'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Text('Ok'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).canvasColor),
        backgroundColor: Theme.of(context).primaryColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        title: const Text(
          "Manage Codes",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30.0, bottom: 50, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DefaultMaterialButton(
                  text: "Add",
                  fcn: () => buttonClicked(ButtonId.BI_Add),
                  icon: Icons.add),
              DefaultMaterialButton(
                  text: "Edit",
                  fcn: () => buttonClicked(ButtonId.BI_Edit),
                  icon: Icons.edit),
              DefaultMaterialButton(
                  text: "Remove",
                  fcn: () => buttonClicked(ButtonId.BI_Remove),
                  icon: Icons.delete),
              const Flexible(flex: 1, child: SizedBox.expand()),
              DefaultMaterialButton(
                  text: "Home Page",
                  fcn: () => Navigator.of(context).pop(),
                  icon: null),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
