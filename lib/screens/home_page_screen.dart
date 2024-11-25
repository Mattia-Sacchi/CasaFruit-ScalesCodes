import 'package:casa_fruit_scale_codes/screens/search_screen.dart';
import 'package:casa_fruit_scale_codes/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/default_material_button.dart';
import 'manage_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      drawer: CustomDrawer(),
    );
  }


}
