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
    _lst = await DatabaseManager().scaleCodes();
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
                delegate: CodesSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: _lst != null
          ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: SingleChildScrollView(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20,);
                },
                shrinkWrap: true,
                  itemCount: _lst!.length,
                  itemBuilder: (context, index) {
                    ScaleCode sc = _lst![index];
                    return Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              radius: 35,
                              child: Text(sc.id.toString(), style: const TextStyle(color: Colors.white),),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  sc.name,
                                  style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.black),
                                ),
                                if (sc.description.isNotEmpty) Text(sc.description,)  ,
                              ],

                            ),
                            IconButton(onPressed: () {}, icon:Icon(Icons.edit) ),

                          ],
                        ),
                    );
                  },
                ),
            ),
          )
          : const SizedBox.shrink(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
