import 'package:casa_fruit_scale_codes/screens/search_screen.dart';
import 'package:casa_fruit_scale_codes/widgets/description_text_field.dart';
import 'package:casa_fruit_scale_codes/widgets/name_text_field.dart';
import 'package:flutter/material.dart';

import '../objects/scale_code.dart';
import '../singletons/database.dart';
import '../widgets/default_material_button.dart';
import 'manage_screen.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key, required this.sc,this.fromSearchScreen = false
  });

  final ScaleCode sc;

  final bool fromSearchScreen;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DatabaseManager dbManager = DatabaseManager();

  final _formKey = GlobalKey<FormState>();

  final double _spaceBetween = 10;

  @override
  void initState() {
    super.initState();
  }



  void failedAlert(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ListTile(
          title: const Text("Failed"),
          subtitle: Text(text),
        ),
      ),
    );
  }

  void confirmPressed() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      widget.sc.name = nameController.text;
      widget.sc.description = descriptionController.text;

      if (!await dbManager.checkCode(widget.sc.id)) {
        failedAlert("Synchronization Error");
        return;
      }
      dbManager.updateScaleCode(widget.sc);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Updated ${widget.sc.name} with success'),
        ),
      );

      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => widget.fromSearchScreen ? const SearchScreen() : const ManageScreen()),
      );


    } else {
      failedAlert("General error code");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).canvasColor),
        backgroundColor: Theme.of(context).primaryColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        title: Text(
          "Edit Code ${widget.sc.id}",
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
                    Text("Change name:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.black)),
                    SizedBox(height: _spaceBetween,),
                    NameTextField(controller: nameController,startName: widget.sc.name),
                    SizedBox(height: _spaceBetween*2,),
                    Text("Change description:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.black)),
                    SizedBox(height: _spaceBetween,),
                    DescriptionTextField(controller: descriptionController, startDescription: widget.sc.description,),
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
