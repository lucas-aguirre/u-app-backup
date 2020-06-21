import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/models/user_model.dart';
import 'package:ummense_app/src/repositories/user_repository.dart';
import 'package:ummense_app/src/resources/feed/feed_loading_posts.dart';
import 'package:ummense_app/src/resources/feed/feed_new_post_input.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ummense_app/src/widgets/images/user_avatar.dart';
import 'package:ummense_app/src/widgets/ui/post_info.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({this.showFilter});

  final bool showFilter;

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  List<PostModel> _posts;
  bool _loadingPosts = true;

  Future<dynamic> fetchPosts() async {
    setState(() {
     _loadingPosts = true;
    });

    final UserModel user = await UserRepository().getUserFromStorage();

    final Map<String, String> _headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };

    final http.Response response = await http.get('https://app.ummense.com/api/u-app/contacts/'+ user.id.toString() + '/posts', headers: _headers);

    if (response.statusCode != 200) {
      throw Exception('Usuário não encontrado');
    }

    return response.body;
  }

  static List<PostModel> loadPosts(String jsonString) {
    final dynamic parsed = json.decode(jsonString);
    return List<PostModel>.from(parsed.map((dynamic json) => PostModel.fromJson(json)).toList());
  }

  @override
  void initState() {
    super.initState();
    fetchPosts().then((dynamic posts){
      refreshPostsState(posts);
    });

    initializeDateFormatting();
  }

  void refreshPostsState(dynamic posts) {
    setState(() {
      _posts = loadPosts(posts);
      _loadingPosts = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double widthPadding = mediaQuery.size.width * 0.045;

    return Scaffold(
      // appBar: const FeedAppBar(),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () => fetchPosts().then((dynamic posts){
          refreshPostsState(posts);
        }),
        child: _loadingPosts == false
        ? ListView(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: ThemeColors.GREY_LIGHT_2, width: 0.2))
              ),
              padding: EdgeInsets.only(
                bottom: mediaQuery.size.height * 0.035,
                left: mediaQuery.size.width * 0.045,
                right: mediaQuery.size.width * 0.045,
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: const UserAvatar(),
                    onTap: () {
                      Navigator.pushNamed(context, RouteList.profileRoute);
                    },
                  ),
                  FeedNewPostInput(mediaQuery: mediaQuery)
                ],
              ),
            ),
            if(_posts.isNotEmpty)
            for (PostModel post in _posts)
            PostInfo(post: post, mediaQuery: mediaQuery, widthPadding: widthPadding, limitComments: true),

            if(_posts.isEmpty)
            Center(child: Container(padding: EdgeInsets.only(top: mediaQuery.size.height * 0.1), child: Text('Nenhum post encontrado...')))
          ]
        )
        : const FeedLoadingPosts()
      )
    );
  }
}
// TODO(Lucas): ajeitar post model aqui para comentários

