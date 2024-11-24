import 'package:casa_fruit_scale_codes/objects/utils.dart';
import 'package:casa_fruit_scale_codes/screens/edit_screen.dart';
import 'package:casa_fruit_scale_codes/singletons/database.dart';
import 'package:flutter/material.dart';

import '../objects/scale_code.dart';
import '../widgets/search_delegate.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ScaleCode>? _lst;

  @override
  void initState() {
    reload();
    super.initState();
  }

  void reload() async {
    List<ScaleCode> temp = await DatabaseManager().scaleCodes();
    temp.sort((a, b) => a.id.compareTo(b.id));
    _lst = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Theme.of(context).canvasColor),
        backgroundColor: Theme.of(context).primaryColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        title: const Text('Codes'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: _lst != null  ? CodesSearchDelegate(lst: _lst!) : CodesSearchDelegate(lst: []),
              );
            },
          ),
        ],
      ),
      body: _lst != null
          ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: SingleChildScrollView(
              child: buildSearchPage(context, _lst!),
            ),
          )
          : const SizedBox.shrink(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
