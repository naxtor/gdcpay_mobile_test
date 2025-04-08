import 'dart:convert';
import 'dart:developer';

import 'package:app/models/github_profile_model.dart';
import 'package:app/models/github_repository_model.dart';
import 'package:app/utilities/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppProvider with ChangeNotifier {
  GithubProfileModel? profile;
  List<GithubRepositoryModel> repositories = [];
  bool isProfileLoading = false;
  bool isRepositoriesLoading = false;
  bool isDetailsLoading = false;

  Future<void> getGithubRepositories(String url) async {
    try {
      isRepositoriesLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url));

      final json = jsonDecode(response.body);

      if (response.statusCode == 404 && json["message"]) {
        throw json["message"];
      }

      repositories = List<GithubRepositoryModel>.from((json as List)
          .map((repository) => GithubRepositoryModel.fromJson(repository)));
    } catch (error) {
      log(error.toString());
      rethrow;
    } finally {
      isRepositoriesLoading = false;
      notifyListeners();
    }
  }

  Future<GithubRepositoryModel> getGithubRepositoryDetails(String url) async {
    try {
      isDetailsLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url));

      final json = jsonDecode(response.body);

      if (response.statusCode == 404 && json["message"]) {
        throw json["message"];
      }

      return GithubRepositoryModel.fromJson(json);
    } catch (error) {
      log(error.toString());
      rethrow;
    } finally {
      isDetailsLoading = false;
      notifyListeners();
    }
  }

  Future<void> getGithubProfile(String username) async {
    try {
      isProfileLoading = true;
      notifyListeners();

      final response = await http.get(
        Uri.parse('${AppConstants.githubProfileURL}$username'),
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == 404 && json["message"]) {
        throw json["message"];
      }

      profile = GithubProfileModel.fromJson(json);

      getGithubProfile(username);
    } catch (error) {
      log(error.toString());
      rethrow;
    } finally {
      isProfileLoading = false;
      notifyListeners();
    }
  }
}
