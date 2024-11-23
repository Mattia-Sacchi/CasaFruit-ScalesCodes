import 'package:flutter/material.dart';

import '../widgets/search_delegate.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key,});


  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:
      AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),

        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        title: const  Text('Codes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search,),
            onPressed: () {
              showSearch(

                context: context,
                delegate: CodesSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox.shrink(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
