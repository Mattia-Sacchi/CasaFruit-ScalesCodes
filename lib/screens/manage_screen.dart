import 'package:casa_fruit_scale_codes/objects/scale_code.dart';
import 'package:casa_fruit_scale_codes/objects/utils.dart';
import 'package:casa_fruit_scale_codes/screens/add_screen.dart';
import 'package:casa_fruit_scale_codes/screens/edit_screen.dart';
import 'package:casa_fruit_scale_codes/singletons/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/autocomplete_text_field.dart';
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
  DatabaseManager dbManager = DatabaseManager();

  Map<String, ScaleCode>? _strToSC;
  List<String> _codesStrings = [];
  String _selectedItem = "";

  void reload() {
    dbManager.scaleCodes().then((scaleCodes) {
      setState(() {
        _strToSC = <String, ScaleCode>{};

        scaleCodes.sort((a, b) => a.id.compareTo(b.id));
        for (var elem in scaleCodes) {
          String codeString = '${elem.id} ${elem.name}';
          _codesStrings.add(codeString);
          _strToSC![codeString] = elem;
        }
      });
    });
  }

  @override
  void initState() {
    reload();
    super.initState();
  }

  void buttonClicked(ButtonId id) {
    switch (id) {
      case ButtonId.BI_Add:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddScreen()));
        break;
      case ButtonId.BI_Edit:
        if (_selectedItem.isEmpty) {
          failedAlert(context, "to load selected item");
          return;
        }

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    EditScreen(sc: _strToSC![_selectedItem]!)));

      case ButtonId.BI_Remove:
        if (_selectedItem.isEmpty) {
          failedAlert(context, "to load selected item");
          return;
        }

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Are you sure'),
              content:
                  Text('Do you want to remove $_selectedItem\nFrom the list?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () async {
                    await dbManager.deleteScaleCode(_strToSC![_selectedItem]!);
                    reload();
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
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
              const SizedBox(
                height: 25,
              ),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(35),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 20),
                  child: Column(children: [
                    Text(
                      "Select Code and the action:",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "Selected Code: $_selectedItem",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _strToSC != null
                        ? AutocompleteTextField(
                            items: _codesStrings,
                            decoration: InputDecoration(
                                label: const Text("Code Id"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (val) {
                              if (_codesStrings.contains(val)) {
                                return null;
                              } else {
                                return 'Invalid Code';
                              }
                            },
                            onItemSelect: (selected) {
                              print(selected);
                              setState(() {
                                _selectedItem = selected;
                              });
                            },
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultMaterialButton(
                        text: "Edit",
                        fcn: () => buttonClicked(ButtonId.BI_Edit),
                        icon: Icons.edit),
                    DefaultMaterialButton(
                        text: "Remove",
                        fcn: () => buttonClicked(ButtonId.BI_Remove),
                        icon: Icons.delete),
                  ]),
                ),
              ),
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
