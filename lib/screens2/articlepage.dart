import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esports_now/constants/constants.dart';

class ArticlePage extends StatelessWidget {
  final String imageUrl, title, detail;
  final bool trending;
  final ConstantColors constantColors = ConstantColors();
  ArticlePage({this.imageUrl, this.title, this.detail, this.trending});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
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
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(imageUrl),
                            width: double.infinity,
                          ),
                        ),
                        Visibility(
                          visible: trending,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20, right: 15, bottom: 7),
                            child: Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: constantColors.whiteColor,
                                  child: Icon(
                                    Icons.trending_up_rounded,
                                    size: 30,
                                    color: constantColors.primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          color: constantColors.whiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      detail,
                      style: TextStyle(
                        color: constantColors.descTextColor,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
