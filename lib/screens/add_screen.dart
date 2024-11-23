import 'package:casa_fruit_scale_codes/widgets/description_text_field.dart';
import 'package:casa_fruit_scale_codes/widgets/id_spin_box.dart';
import 'package:casa_fruit_scale_codes/widgets/name_text_field.dart';
import 'package:flutter/material.dart';

import '../singletons/database.dart';
import '../widgets/default_material_button.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({
    super.key,
  });

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DatabaseManager dbManager = DatabaseManager();

  final _formKey = GlobalKey<FormState>();

  void confirmPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      int id = int.parse(idController.text);
      String name = nameController.text;
      String description = descriptionController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$name Created with id: $id!'),

        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        title: const Text(
          "Add Code",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Flexible(
                flex: 1,
                child: SizedBox.shrink(),
              ),
              Text("Insert the code:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: Colors.black)),
              IdSpinBox(controller: idController),
              Text("Insert the name:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: Colors.black)),
              NameTextField(controller: nameController),
              Text("Insert a description:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: Colors.black)),
                DescriptionTextField(controller: descriptionController),

              DefaultMaterialButton(
                text: "Confirm",
                fcn: confirmPressed,
                icon: null,
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
