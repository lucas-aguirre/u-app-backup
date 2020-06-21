import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/file_model.dart';
import 'package:ummense_app/src/models/project_model.dart';
import 'package:ummense_app/src/models/user_model.dart';

class PostModel {
  const PostModel({
    @required this.id,
    @required this.user,
    @required this.createdAt,
    this.file,
    this.description,
    this.project,
    this.comments,
    this.type
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: int.parse(json['id'].toString()),
      description: json['description'],
      type: json['logs_type'],
      createdAt: DateTime.parse(json['created_at']),
      user: UserModel.fromJson(json['user']),
      comments: json['comments'] != null && json['comments'].length > 0
      ? List<PostModel>.from(json['comments'].map((dynamic post) => PostModel.fromJson(post)).toList())
      : null,
      project: ProjectModel.fromJson(json['logs']),
      file: FileModel.fromJson(json['file'])
    );
  }

  final int id;
  final String description;
  final String type;
  final DateTime createdAt;
  final FileModel file;
  final ProjectModel project;
  final List<PostModel> comments;
  final UserModel user;
}