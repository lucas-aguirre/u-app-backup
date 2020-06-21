import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/search/search_app_bar.dart';
import 'package:ummense_app/src/resources/search/search_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _showPosts = false;

  void _updateShowPosts(bool showPosts) {
    setState(() {
      _showPosts = showPosts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(updateShowPosts: _updateShowPosts),
      body: _showPosts == true
      ? const SearchList()
      : const SizedBox(),
    );
  }
}
