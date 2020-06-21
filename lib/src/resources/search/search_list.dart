import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/file_model.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/models/project_model.dart';
import 'package:ummense_app/src/models/user_model.dart';
import 'package:ummense_app/src/widgets/ui/post_list_item.dart';

class SearchList extends StatefulWidget {
  const SearchList();

  @override
  SearchListState createState() => SearchListState();
}

class SearchListState extends State<SearchList> {
  static UserModel lucas = const UserModel(id: 1, name: 'Lucas', cellphone: '123456', avatar: 'assets/images/temp/Avatar1.png');
  static UserModel italo = const UserModel(id: 1, name: 'Ítalo', cellphone: '123456', avatar: 'assets/images/temp/Avatar2.png');
  static UserModel felipe = const UserModel(id: 1, name: 'Felipe', cellphone: '123456', avatar: 'assets/images/temp/Avatar5.png');
  static UserModel keli = const UserModel(id: 1, name: 'Keli', cellphone: '123456', avatar: 'assets/images/temp/Avatar4.png');

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
          id: 1,
          organizationUuid: 'teste',
          path: 'assets/images/temp/Imagem.png',
          type: 'png'
        ),
        user: lucas,
        createdAt: DateTime.now(),
      ),
       PostModel(
          id: 3,
          file: const FileModel(
            id: 1,
            organizationUuid: 'teste',
            path: 'assets/images/temp/Imagem2.png',
            type: 'png'
          ),
          user: italo,
          project: const ProjectModel(id: 1, name: 'Criar telas legais'),
          createdAt: DateTime.now().subtract(const Duration(days: 20))),
      PostModel(
        id: 4,
        file: const FileModel(
          id: 1,
          organizationUuid: 'teste',
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
          id: 1,
          organizationUuid: 'teste',
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
          id: 1,
          organizationUuid: 'teste',
          path: 'assets/images/temp/Imagem5.png',
          type: 'png'
        ),
        user: keli,
        createdAt: DateTime.now(),
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return PostItemList(post: posts[index]);
      }
    );
  }
}