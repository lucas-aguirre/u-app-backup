import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/resources/new_post/new_post_app_bar.dart';
import 'package:ummense_app/src/resources/new_post/new_post_available_post.dart';
import 'package:ummense_app/src/resources/new_post/new_post_input.dart';
import 'package:ummense_app/src/resources/new_post/new_post_navbar_list_icons.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/models/file_model.dart';
import 'package:ummense_app/src/models/project_model.dart';
import 'package:ummense_app/src/models/user_model.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class NewPostScreen extends StatefulWidget {

  const NewPostScreen();

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  bool _postHasContent = false;
  PostModel _selectedPost;
  int _step = 1;

  void _selectCurrentPost(PostModel post) {
    setState(() {
     _selectedPost = post;
    });
  }

  void _checkIfPostHasContent(String content) {
    bool contentExists = false;

    if ( content != null && content.isNotEmpty ) {
      contentExists = true;
    }

    setState(() {
      _postHasContent = contentExists;
    });
  }

  bool _checkIfCanAdvanceStep() {
    if ( _step == 1 && ! _postHasContent ) {
      return false;
    }

    if ( _step == 2 && _selectedPost == null ) {
      return false;
    }

    return true;
  }

  void _advanceStep() {
    if ( _step == 1 ) {
      setState(() {
        FocusScope.of(context).requestFocus(FocusNode());
      _step++;
      });
    }

    if ( _selectedPost != null ) {
      Navigator.pop(context);
    }


  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const UserModel lucas = UserModel(id: 1, name: 'Lucas', cellphone: '123456', avatar: 'assets/images/temp/Avatar1.png');
    const UserModel italo = UserModel(id: 1, name: 'Ítalo', cellphone: '123456', avatar: 'assets/images/temp/Avatar2.png');
    const UserModel felipe = UserModel(id: 1, name: 'Felipe', cellphone: '123456', avatar: 'assets/images/temp/Avatar5.png');
    const UserModel keli = UserModel(id: 1, name: 'Keli', cellphone: '123456', avatar: 'assets/images/temp/Avatar4.png');

    final List<PostModel> posts = <PostModel>[
      PostModel(
          id: 1,
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mollis imperdiet est at blandit. Vivamus euismod nunc leo, quis tristique leo condimentum eu.',
          user: lucas,
          createdAt: DateTime.now(),
        ),
        PostModel(
          id: 2,
          description: 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque et suscipit leo, posuere commodo dolor. Etiam euismod quam aliquet sem varius, in ornare turpis varius. Praesent sit amet bibendum dui, sed auctor quam. Etiam facilisis accumsan bibendum.',
          file: const FileModel(
            organizationUuid: 'teste',
            id: 1,
            path: 'assets/images/temp/Imagem.png',
            type: 'png'
          ),
          user: lucas,
          createdAt: DateTime.now(),
        ),
        PostModel(
            id: 3,
            file: const FileModel(
              organizationUuid: 'teste',
              id: 1,
              path: 'assets/images/temp/Imagem2.png',
              type: 'png'
            ),
            user: italo,
            project: const ProjectModel(id: 1, name: 'Criar telas legais'),
            createdAt: DateTime.now().subtract(const Duration(days: 20))),
        PostModel(
          id: 4,
          file: const FileModel(
            organizationUuid: 'teste',
            id: 1,
            path: 'assets/images/temp/Imagem3.png',
            type: 'png'
          ),
          description: 'Você realmente clicou no botão azul escrito "clique aqui"? Sê é burro cara?',
          user: felipe,
          project: const ProjectModel(id: 1, name: 'Não consigo'),
          createdAt: DateTime.now().subtract(const Duration(days: 5)),
        ),
        PostModel(
          id: 5,
          file: const FileModel(
            organizationUuid: 'teste',
            id: 1,
            path: 'assets/images/temp/Imagem4.png',
            type: 'png'
          ),
          user: keli,
          project: const ProjectModel(id: 1, name: 'Não consigo'),
          createdAt: DateTime.now().subtract(const Duration(days: 5)),
        ),
        PostModel(
          id: 6,
          description: 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque et suscipit leo, posuere commodo dolor. Etiam euismod quam aliquet sem varius, in ornare turpis varius. Praesent sit amet bibendum dui, sed auctor quam. Etiam facilisis accumsan bibendum.',
          file: const FileModel(
            organizationUuid: 'teste',
            id: 1,
            path: 'assets/images/temp/Imagem5.png',
            type: 'png'
          ),
          user: keli,
          createdAt: DateTime.now(),
        ),
    ];

    final String _actionLinkText = _step == 1 ? 'Avançar' : 'Próximo';
    final bool _canAdvanceStep = _checkIfCanAdvanceStep();

    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: NewPostAppBar(mediaQuery: mediaQuery, actionLinkText: _actionLinkText, canAdvanceStep: _canAdvanceStep, advanceStep: _advanceStep),
      bottomSheet: _step == 1 ? NewPostNavbarListIcons(mediaQuery: mediaQuery) : null,
      // bottomSheet: _step == 1 ? NewPostNavbarListIcons(mediaQuery: mediaQuery) : NewPostListAvailablePosts(mediaQuery: mediaQuery),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: <Widget>[
              Container(
                height: _step == 1 ? constraints.maxHeight : constraints.maxHeight * 0.4,
                width: constraints.maxWidth,
                child: NewPostInput(checkIfPostHasContent: _checkIfPostHasContent),
              ),
              Container(
                padding: EdgeInsets.only(left: constraints.maxWidth * 0.05),
                height: constraints.maxHeight * 0.1,
                width: constraints.maxWidth,
                color: ThemeColors.GREY_LIGHT_3,
                child: Row(children: <Widget>[
                  const Text(
                    'A qual projeto o post pertence?',
                    style: TextStyle(fontSize: ThemeText.FONT_SIZE_SMALL, fontWeight: FontWeight.bold),
                  )
                ],),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NewPostAvailablePost(post: posts[index], selectCurrentPost: _selectCurrentPost, mediaQuery: mediaQuery);
                  }
                ),
              )
            ],
          );
        },
      ),
    );
  }
}