import 'package:esports_now/constants/constants.dart';
import 'package:esports_now/screens2/articlepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';
import 'package:esports_now/custom_widgets/newstile.dart';

class CategoryPageBuilder extends StatefulWidget {
  @override
  _CategoryPageBuilderState createState() => _CategoryPageBuilderState();
  final String newsDecider;
  CategoryPageBuilder({this.newsDecider});
}

final ConstantColors constantColors = ConstantColors();

class _CategoryPageBuilderState extends State<CategoryPageBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: constantColors.backGroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ESPORTS',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontStyle: FontStyle.italic),
            ),
            Text(
              'NOW',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                  color: constantColors.primaryColor),
            ),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.preview),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection(widget.newsDecider)
                    .snapshots(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (!snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
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
          )),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
