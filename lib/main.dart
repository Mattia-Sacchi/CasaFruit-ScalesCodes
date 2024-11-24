import 'dart:io';

import 'package:casa_fruit_scale_codes/screens/manage_screen.dart';
import 'package:casa_fruit_scale_codes/screens/search_screen.dart';
import 'package:casa_fruit_scale_codes/widgets/default_material_button.dart';
import 'package:casa_fruit_scale_codes/singletons/database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
  DatabaseManager dbManager = DatabaseManager();
  dbManager.loadDatabase();
}

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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                      icon: null),
                  DefaultMaterialButton(
                      text: "Manage Codes",
                      fcn: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ManageScreen()),
                          ),
                      icon: null),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
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
                onTap: () {},
                leading: const Icon(Icons.import_export),
                title: const Text("Import"),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.import_export),
                title: const Text("Export"),
              ),
              const Flexible(flex:1 ,child: SizedBox.expand(),),
              Column(children: [
                Text("Credits", style: Theme.of(context).textTheme.titleLarge!.apply(color: Colors.black),),

                Text("Mattia Sacchi", style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.black),),

                IconButton(

                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.network('https://cdn-icons-png.flaticon.com/128/2111/2111425.png', width: 32, height: 32),),
                        Text('Github')
                    ],
                  ),

                    onPressed: ()
                {
                  launchUrl(Uri.parse("https://github.com/Mattia-Sacchi"));
                }

                ),
              const SizedBox(height: 50,),

            ],
          ),],
      ),
    ),
    );
  }
}
