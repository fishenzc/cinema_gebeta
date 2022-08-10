// ignore_for_file: prefer_const_constructors

import 'package:cinema_g/screens/home_screen.dart';
import 'package:cinema_g/screens/nav_screen.dart';
import 'package:flutter/material.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        actions: [
        IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
                
              );
            },
            icon: const Icon(Icons.search)),
      ]),
      // backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'search bar',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'selanchi',
    'amran',
    'defret',
    'hdar',
    'baletera',
    'quragnaye',
    'yefikir kale',
    'price of love',
    'sqie limut',
    'ywataln',
    'behig amlak',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear), color: Colors.redAccent,)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>NavScreen()));
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var film in searchTerms) {
      if (film.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(film);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var film in searchTerms) {
      if (film.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(film);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result, style: TextStyle(color: Colors.white),),
          );
        });
  }
}
