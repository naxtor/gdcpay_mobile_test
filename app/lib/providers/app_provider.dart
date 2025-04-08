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
  GithubRepositoryModel? repositoryDetails;
  bool isProfileLoading = false;
  bool isRepositoriesLoading = false;
  bool isDetailsLoading = false;

  Future<void> getGithubRepositories(String url) async {
    log(url);
    try {
      isRepositoriesLoading = true;
      notifyListeners();

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization':
              "Bearer ${utf8.decode(base64.decode(AppConstants.githubToken))}",
        },
      );

      final json = jsonDecode(response.body);

      if ([403, 404].contains(response.statusCode) && json["message"]) {
        throw json["message"];
      }

      repositories = List<GithubRepositoryModel>.from((json as List)
          .map((repository) => GithubRepositoryModel.fromJson(repository)));
      repositories.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } catch (error) {
      log(error.toString());
      rethrow;
    } finally {
      isRepositoriesLoading = false;
      notifyListeners();
    }
  }

  Future<void> getGithubRepositoryDetails(String url) async {
    try {
      isDetailsLoading = true;
      repositoryDetails = null;
      notifyListeners();

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization':
              "Bearer ${utf8.decode(base64.decode(AppConstants.githubToken))}",
        },
      );

      final json = jsonDecode(response.body);

      if ([403, 404].contains(response.statusCode) && json["message"]) {
        throw json["message"];
      }

      repositoryDetails = GithubRepositoryModel.fromJson(json);
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
      profile = null;
      repositories.clear();
      notifyListeners();

      final response = await http.get(
        Uri.parse('${AppConstants.githubProfileURL}$username'),
        headers: {
          'Authorization':
              "Bearer ${utf8.decode(base64.decode(AppConstants.githubToken))}",
        },
      );

      final json = jsonDecode(response.body);
      log("Suk");

      if ([403, 404].contains(response.statusCode) && json["message"]) {
        throw json["message"];
      }

      profile = GithubProfileModel.fromJson(json);
      log("Suk sini");

      getGithubRepositories(profile!.reposUrl);
    } catch (error) {
      log("getGithubProfile: ${error.toString()}");
      rethrow;
    } finally {
      isProfileLoading = false;
      notifyListeners();
    }
  }
}
