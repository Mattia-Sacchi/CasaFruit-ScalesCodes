import 'package:flutter/material.dart';

import '../singletons/database.dart';

class CodesSearchDelegate extends SearchDelegate {

  DatabaseManager dbManager = DatabaseManager();

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
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Display search results here
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Display search suggestions here
    return Center(
      child: Text('Search suggestions for: $query'),
    );
  }
}