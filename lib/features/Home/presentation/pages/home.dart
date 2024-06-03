import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final ref = FirebaseDatabase.instance.ref('MyApp/Author');
  final reftwo = FirebaseDatabase.instance.ref('MyApp/Books');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('Authors',style: GoogleFonts.heebo(fontSize: 20 , fontWeight: FontWeight.w400),),
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
                GestureDetector(
                  onTap: () {
                    FirebaseAnalytics.instance.logEvent(name: "author",
                    parameters: {
                      "author_name":snapshot.child("authorName").value.toString(),
                    },
                    );
                   
                  context.push('/home/authordesc',extra:
                  {
                    "authorName" :snapshot.child("authorName").value.toString(),
                    "authorDesc" : snapshot.child("authorDesc").value.toString()
                  } );
                    print(snapshot.child("authorName").value.toString());
                  },
                  child: ListTile(
                    title: Text(snapshot.child('authorName').value.toString()),
                  ),
                );
              },
            ),
          ),
         Text(' Books',style: GoogleFonts.heebo(fontSize: 20 , fontWeight: FontWeight.w400),),
          Expanded(
            child: FirebaseAnimatedList(
              shrinkWrap: true,
              query: reftwo,
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
                GestureDetector(
                  onTap: (){
                    print('books');
                    FirebaseAnalytics.instance.logEvent(name: "books",
                    parameters: {
                      "book_name": snapshot.child('booksName').value.toString(),
                    },
                   
                    );
                    context.push('/home/bookdesc',extra: {
                      "bookName" : snapshot.child('booksName').value.toString(),
                      "bookDesc" : snapshot.child('bookDesc').value.toString(),
                    });
                     print(snapshot.child('booksName').value.toString(),);
                  },
                  child: ListTile(
                    title: Text(snapshot.child('booksName').value.toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
