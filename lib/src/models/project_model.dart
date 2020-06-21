import 'package:flutter/material.dart';

class ProjectModel {
  const ProjectModel({
    @required this.id,
    @required this.name,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    if ( json != null ) {
      return ProjectModel(
        id: int.parse(json['id'].toString()),
        name: json['name'],
      );
    }

    return null;
  }

  final int id;
  final String name;
}