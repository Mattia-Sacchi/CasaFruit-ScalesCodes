import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../objects/scale_code.dart';
import '../objects/utils.dart';
import '../screens/edit_screen.dart';
import '../singletons/database.dart';

class CodesSearchDelegate extends SearchDelegate {
  DatabaseManager dbManager = DatabaseManager();

  CodesSearchDelegate({required this.lst});

  final List<ScaleCode> lst;
  List<ScaleCode> _filteredItems = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  TextStyle? get searchFieldStyle => TextStyle(
      color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold);

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  InputDecorationTheme get searchFieldDecorationTheme => InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey),

    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,

  );

  @override
  Widget buildResults(BuildContext context) {
    if (query == '') {
      _filteredItems = lst;
    } else {
      _filteredItems = lst
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return buildSearchPage(context, _filteredItems);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Display search suggestions here
    return Center(
      child: Text('Search suggestions for: $query'),
    );
  }
}
