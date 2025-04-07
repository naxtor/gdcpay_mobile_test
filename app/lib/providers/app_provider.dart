import 'package:app/models/github_profile_model.dart';
import 'package:app/models/github_repository_model.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  GithubProfileModel? profile;
  List<GithubRepositoryModel> repositories = [];
}
