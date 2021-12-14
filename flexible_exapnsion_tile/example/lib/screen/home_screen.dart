import 'package:example/data/data_helper.dart';
import 'package:flexible_expansion_list/flexible_expansion_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<Data>? data;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    DataHelper helper = DataHelper();
    data = helper.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FlexibleExpansionList(
        itemCount: data!.length,
        headerBuilder: (BuildContext context, int index, bool isExpanded) {
          return ListTile(
            title: Text(isExpanded ? 'Collapse' : 'Expand'),
          );
        },
        fixedItemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(data![index].fields.title),
            subtitle: Text(data![index].fields.value),
          );
        },
        expandedItemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListTile(
              title: Text(data![index].title),
              subtitle: Text(data![index].subtitle),
            ),
          );
        },
      ),
    );
  }
}
