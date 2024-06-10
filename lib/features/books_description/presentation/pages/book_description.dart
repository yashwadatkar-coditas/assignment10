import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
 final String bookName;
 final String bookDesc;
   BookDescription({super.key, required this.bookName, required this.bookDesc , });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bookName)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(bookDesc)
        ],
      ),
    );
  }
}