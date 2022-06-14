import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Bar"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: const Center(
        // TODO: adding card layout
        child: Text('API Demo'),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Thura',
    'Khant',
    'Thein',
    'Thura Khant Thein',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> mathQuery = [];
    for (var name in searchTerms) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        mathQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: mathQuery.length,
      itemBuilder: (context, index) {
        var result = mathQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in searchTerms) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
