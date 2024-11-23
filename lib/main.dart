import 'package:casa_fruit_scale_codes/screens/manage_screen.dart';
import 'package:casa_fruit_scale_codes/screens/search_screen.dart';
import 'package:casa_fruit_scale_codes/screens/settings_screen.dart';
import 'package:casa_fruit_scale_codes/widgets/default_material_button.dart';
import 'package:casa_fruit_scale_codes/singletons/database.dart';
import 'package:flutter/material.dart';

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
            titleLarge: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Flexible(flex: 1,child: SizedBox.shrink(),),

            DefaultMaterialButton(text: "Scale Codes", fcn: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            ),icon: null),
            DefaultMaterialButton(text: "Manage Codes", fcn: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ManageScreen()),
            ),icon: null),


            DefaultMaterialButton(text: "Settings", fcn: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            ),icon: Icons.settings),
            const Flexible(flex: 1,child: SizedBox.expand(),),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
