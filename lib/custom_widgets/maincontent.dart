import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';
import 'package:esports_now/screens2/articlepage.dart';
import 'package:esports_now/custom_widgets/newstile.dart';

class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('newsarticle').snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ArticlePage(
                                  imageUrl: data['imageUrl'],
                                  title: data['title'],
                                  detail: data['detail'],
                                  trending: data['trending'],
                                ),
                                type: PageTransitionType.rightToLeft));
                      },
                      child: NewsTile(
                        imageUrl: data['imageUrl'],
                        title: data['title'],
                        desc: data['description'],
                        trending: data['trending'],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
