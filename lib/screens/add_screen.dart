import 'package:casa_fruit_scale_codes/widgets/description_text_field.dart';
import 'package:casa_fruit_scale_codes/widgets/id_spin_box.dart';
import 'package:casa_fruit_scale_codes/widgets/name_text_field.dart';
import 'package:flutter/material.dart';

import '../objects/scale_code.dart';
import '../objects/utils.dart';
import '../singletons/database.dart';
import '../widgets/default_material_button.dart';
import 'manage_screen.dart';

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

  final double _spaceBetween = 10;

  @override
  void initState() {
    dbManager.scaleCodes().then(
        (scaleCodes)
        {
          int i;
          for(i = 1; scaleCodes.any((element) {return element.id == i; } ) ; i++);
          setState(() {
            idController.text = i.toString();
          });
        }

    );

    super.initState();
  }



  void confirmPressed() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      int id = int.parse(idController.text);
      String name = nameController.text;
      String description = descriptionController.text;

      if (await dbManager.checkCode(id)) {
        failedAlert(context,"Already exist");
        return;
      }
      dbManager.insertScaleCode(
          ScaleCode(id: id, name: name, description: description));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$name Created with id: $id!'),
        ),

      );

      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ManageScreen()),
      );
    } else {
      failedAlert(context,"General error code");
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
          "Add Code",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Insert the code:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.black)),
                    SizedBox(height: _spaceBetween,),
                    IdSpinBox(controller: idController),
                    SizedBox(height: _spaceBetween*2,),
                    Text("Insert the name:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.black)),
                    SizedBox(height: _spaceBetween,),
                    NameTextField(controller: nameController),
                    SizedBox(height: _spaceBetween*2,),
                    Text("Insert a description:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.black)),
                    SizedBox(height: _spaceBetween,),
                    DescriptionTextField(controller: descriptionController),
                    const Flexible(flex: 1,child: SizedBox.expand(),),
                    DefaultMaterialButton(
                      text: "Confirm",
                      fcn: confirmPressed,
                      icon: null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
