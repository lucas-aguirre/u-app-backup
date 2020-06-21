import 'package:ummense_app/src/models/post_model.dart';

abstract class PostRepositoryInterface {
  Future<PostModel> checkPosts(String postsChecksum);
  Future<List<PostModel>> listPosts();
  Future<PostModel> newPost(PostModel post);
  Future<PostModel> newComment(PostModel post, PostModel comment);
}