class GithubProfileModel {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final String userViewType;
  final bool siteAdmin;
  final String? name;
  final dynamic company;
  final String blog;
  final dynamic location;
  final dynamic email;
  final dynamic hireable;
  final String? bio;
  final dynamic twitterUsername;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;
  final DateTime createdAt;
  final DateTime updatedAt;

  GithubProfileModel({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.userViewType,
    required this.siteAdmin,
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.email,
    required this.hireable,
    required this.bio,
    required this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GithubProfileModel.fromJson(Map<String, dynamic> json) =>
      GithubProfileModel(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        userViewType: json["user_view_type"],
        siteAdmin: json["site_admin"],
        name: json["name"],
        company: json["company"],
        blog: json["blog"],
        location: json["location"],
        email: json["email"],
        hireable: json["hireable"],
        bio: json["bio"],
        twitterUsername: json["twitter_username"],
        publicRepos: json["public_repos"],
        publicGists: json["public_gists"],
        followers: json["followers"],
        following: json["following"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "user_view_type": userViewType,
        "site_admin": siteAdmin,
        "name": name,
        "company": company,
        "blog": blog,
        "location": location,
        "email": email,
        "hireable": hireable,
        "bio": bio,
        "twitter_username": twitterUsername,
        "public_repos": publicRepos,
        "public_gists": publicGists,
        "followers": followers,
        "following": following,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
