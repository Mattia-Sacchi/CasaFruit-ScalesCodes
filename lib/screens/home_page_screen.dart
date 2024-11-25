import 'dart:convert';

import 'package:casa_fruit_scale_codes/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/default_material_button.dart';
import 'manage_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
        canvasColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).canvasColor),
        backgroundColor: Theme.of(context).primaryColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 100, left: 20, right: 20),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 100, right: 10, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DefaultMaterialButton(
                      text: "Scale Codes",
                      fcn: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()),
                          ),
                      icon: Icons.view_agenda_rounded),
                  DefaultMaterialButton(
                      text: "Manage Codes",
                      fcn: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ManageScreen()),
                          ),
                      icon: Icons.edit),
                  const Flexible(
                    flex: 1,
                    child: SizedBox.expand(),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Image.network(
                        "https://static.vecteezy.com/system/resources/thumbnails/046/822/483/small_2x/a-vibrant-assortment-of-fresh-fruits-and-vegetables-isolated-on-a-transparent-background-free-png.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: homePageDrawer(context),
    );
  }

  Widget homePageDrawer(BuildContext context) {
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
            onTap: () => throw UnimplementedError(),
            leading: const Icon(Icons.import_export),
            title: const Text("Import"),
            subtitle: const Text('get data from file'),
          ),
          ListTile(
            onTap: () async {
              Share.shareXFiles([
                XFile.fromData(utf8.encode('Hello world!'),
                    mimeType: 'text/plain')
              ], fileNameOverrides: [
                'myfile.txt'
              ]);
            },
            leading: const Icon(Icons.import_export),
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
