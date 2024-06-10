import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AuthorScreen extends StatelessWidget {
   AuthorScreen({super.key});
   final ref = FirebaseDatabase.instance.ref('MyApp/Author');

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    return  Scaffold(
      appBar: AppBar(title: Text('Author')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Expanded(
            child: FirebaseAnimatedList(
              shrinkWrap: true,
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                if (!snapshot.exists) {
                  return ListTile(title: Text('No data'));
                }

                // final authorData = snapshot.value as Map?;
                // if (authorData == null) {
                //   return ListTile(title: Text('No data'));
                // }

                // final authorName = authorData['authorName'] ?? 'No Name';

                return 
                ListTile(
                  title: Text(snapshot.child('authorName').value.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}