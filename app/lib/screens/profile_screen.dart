import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  const ProfileScreen({
    super.key,
    required this.username,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Overview"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Nabil",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "naxtor",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 24,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.people,
                    size: 16,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "2",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: " Followers",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "1",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: " Following",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(
              top: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                  ),
                  child: Text(
                    "Just do a little push ~",
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Blog",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                  ),
                  child: Text(
                    "https://www.naxtortech.net/",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
