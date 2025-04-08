import 'package:app/models/github_repository_model.dart';
import 'package:app/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class RepositoryDetailsScreen extends StatefulWidget {
  final String url;

  const RepositoryDetailsScreen({
    super.key,
    required this.url,
  });

  @override
  State<RepositoryDetailsScreen> createState() =>
      _RepositoryDetailsScreenState();
}

class _RepositoryDetailsScreenState extends State<RepositoryDetailsScreen> {
  Future<void> getRepositoryDetails() async {
    final appProvider = Provider.of<AppProvider>(
      context,
      listen: false,
    );

    try {
      await appProvider.getGithubRepositoryDetails(widget.url);
    } catch (error) {
      if (!mounted) {
        return;
      }

      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: "Error",
        text: error as String,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => getRepositoryDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Repository Details"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Consumer<AppProvider>(
        builder: (_, appProvider, __) {
          if (appProvider.isDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }

          if (appProvider.repositoryDetails != null) {
            return repositoryDetails(appProvider.repositoryDetails!);
          }

          return Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Cannot reach the repository !",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "\nTry to search again later",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ListView repositoryDetails(GithubRepositoryModel details) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      children: [
        Text(
          details.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4,
          ),
          child: Text(
            details.description ?? "No description here",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Statistics",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 4,
                          ),
                          child: Icon(
                            Icons.star,
                            size: 16,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: details.stargazersCount.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: " Stars",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 4,
                          ),
                          child: Icon(
                            Icons.cable,
                            size: 16,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: details.forksCount.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: " Forks",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 4,
                          ),
                          child: Icon(
                            Icons.remove_red_eye,
                            size: 16,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: details.watchersCount.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: " Watchers",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
