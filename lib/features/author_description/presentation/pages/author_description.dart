import 'package:flutter/material.dart';

class AuthorDescription extends StatelessWidget {
  final String authorName;
  final String authorDesc;
  const AuthorDescription({super.key, required this.authorName, required this.authorDesc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(authorName)),
      body: Center(child: Text(authorDesc)),
    );
  }
}