import 'dart:io';

import 'package:ummense_app/src/models/organization_model.dart';

mixin API {
  static const String baseURI = 'https://app.ummense.com/api/u-app';

  static const Map<String, String> apiHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  static String registerRoute = baseURI + '/organization/' + const OrganizationModel().id.toString() + '/contacts/';

  static String requestValidationCodeRoute = baseURI + '/organization/' + const OrganizationModel().id.toString() + '/contacts/validation-code';

  static String loginRoute = baseURI + '/organization/' + const OrganizationModel().id.toString() + '/login';

  String checkNewPostsRoute(int contactId) {
    return baseURI + '/contacts/' + contactId.toString() + '/check-posts';
  }

  String getPostsRoute(int contactId) {
    return baseURI + '/contacts/' + contactId.toString() + '/posts';
  }
}