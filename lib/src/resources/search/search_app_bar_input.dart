import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class SearchAppBarInput extends StatefulWidget {
  const SearchAppBarInput({this.mediaQuery, this.updateShowPosts});

  final MediaQueryData mediaQuery;
  final Function updateShowPosts;

  @override
  _SearchAppBarInputState createState() => _SearchAppBarInputState();
}

class _SearchAppBarInputState extends State<SearchAppBarInput> {
  final TextEditingController _searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.mediaQuery.size.width,
      height: widget.mediaQuery.size.height * 0.05,
      child: TextField(
        controller: _searchInputController,
        onSubmitted: (String value) {
          bool _showFilteredPosts = false;

          if ( value.isNotEmpty ) {
            _showFilteredPosts = true;
          }

          widget.updateShowPosts(_showFilteredPosts);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: ThemeColors.GREY_LIGHT_3,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
            enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ThemeColors.GREY_LIGHT_3),
          ),
          labelText: 'Pesquisar',
          labelStyle: const TextStyle(fontSize: ThemeText.FONT_SIZE_SMALL, color: ThemeColors.GREY_LIGHT_1),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}