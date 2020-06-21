import 'package:ummense_app/src/interfaces/post_repository_interface.dart';
import 'package:ummense_app/src/models/post_model.dart';

class PostRepository implements PostRepositoryInterface {
  @override
  Future<PostModel> checkPosts(String postsChecksum) {
    return null;
  }

  @override
  Future<List<PostModel>> listPosts() async {
    return null;
  }

  @override
  Future<PostModel> newComment(PostModel post, PostModel comment) {
    return null;
  }

  @override
  Future<PostModel> newPost(PostModel post) {
    return null;
  }

}