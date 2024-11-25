import 'dart:convert';

import 'package:casa_fruit_scale_codes/objects/scale_code.dart';
import 'package:casa_fruit_scale_codes/singletons/database.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key,});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  DatabaseManager dbManager = DatabaseManager();

  @override
  void initState() {
    super.initState();
  }

  void importClicked() async
  {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if(result != null)
    {
       if(result.xFiles.isEmpty)
         return;

       Uint8List bytes = await result.xFiles.first.readAsBytes();
       String output = String.fromCharCodes(bytes);

       List<dynamic> temp = jsonDecode(output);

       dbManager.importScaleCodes(temp).then(
               (s)
           {
             ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(
                 content: Text('Imported with success'),
               ),
             );
           }
       );

    }
  }

  void exportClicked() async
  {
    dbManager.scaleCodes().then(
        (scaleCodes)
        {

          String output = jsonEncode(scaleCodes);
          print(output);
          Share.shareXFiles([XFile.fromData(utf8.encode(output), mimeType: 'text/plain')], fileNameOverrides: ['ScaleCodes.json']);
        }
    );

  }

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://www.fruitsmith.com/pub/media/mageplaza/blog/post/o/n/one_seed_fruits.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Casa Fruit",
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text("La spesa\ndirettamentea casa tua",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  )
                ],
              )),
          ListTile(
            onTap: importClicked,
            leading: const Icon(Icons.import_export,color: Colors.blue,),
            title: const Text("Import"),
            subtitle: const Text('get data from file'),
          ),
          ListTile(
            onTap: exportClicked,
            leading: const Icon(Icons.share,color: Colors.blue,),
            title: const Text("Export"),
            subtitle: const Text('Save your data'),
          ),
          const Flexible(
            flex: 1,
            child: SizedBox.expand(),
          ),
          Column(
            children: [
              Text(
                "Credits",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: Colors.black),
              ),
              Text(
                "Mattia Sacchi",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image.network(
                                'https://cdn-icons-png.flaticon.com/128/2111/2111425.png',
                                width: 32,
                                height: 32),
                          ),
                          const Text('Github')
                        ],
                      ),
                      onPressed: () {
                        launchUrl(
                            Uri.parse("https://github.com/Mattia-Sacchi"));
                      }),
                  IconButton(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Image.network(
                                'https://imgs.search.brave.com/MspQtFIstYWh9I8XCeYe5l4nU74LF8jy4FSQ1wvWJAU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4t/aWNvbnMtcG5nLmZs/YXRpY29uLmNvbS81/MTIvMTc0LzE3NDg1/Ny5wbmc',
                                width: 32,
                                height: 32),
                          ),
                          const Text('Linkedin')
                        ],
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse(
                            "https://www.linkedin.com/in/mattiasacchi/"));
                      }),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

}
