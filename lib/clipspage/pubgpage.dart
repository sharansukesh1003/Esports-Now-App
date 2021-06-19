import 'package:esports_now/custom_widgets/videplayer.dart';
import 'package:flutter/material.dart';
import 'package:esports_now/constants/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

//the actual page where the clips are shown
final ConstantColors constantColors = ConstantColors();

class ClipsPageModel extends StatefulWidget {
  final String clipsCategory;

  ClipsPageModel({@required this.clipsCategory});
  @override
  _ClipsPageModelState createState() => _ClipsPageModelState();
}

class _ClipsPageModelState extends State<ClipsPageModel> {
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
            Text('NOW',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    fontStyle: FontStyle.italic,
                    color: constantColors.primaryColor)),
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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection(widget.clipsCategory)
                      .snapshots(),
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
                            return Column(
                              children: [
                                ClipsTile(
                                  imageUrl: data['imageUrl'],
                                  username: data['username'],
                                  youtube: data['youtube'],
                                  instagram: data['instagram'],
                                  twitter: data['twitter'],
                                  videoUrl: data['videoUrl'],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          });
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipsTile extends StatefulWidget {
  final String imageUrl, username, youtube, instagram, twitter, videoUrl;

  ClipsTile(
      {this.imageUrl,
      this.username,
      this.youtube,
      this.instagram,
      this.twitter,
      this.videoUrl});

  @override
  _ClipsTileState createState() => _ClipsTileState();
}

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

String videoUrl;
String getVideoUrl() {
  firebase_storage.Reference ref = storage.ref();
  firebase_storage.Reference videoFolderRef =
      ref.child('csgo').child('Comp 1.mp4');
  return videoFolderRef.getDownloadURL().toString();
}

class _ClipsTileState extends State<ClipsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 7.0,
              offset: Offset(
                0.0,
                1.0,
              ),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Stack(alignment: Alignment.center, children: [
              Image(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: VideoDisplay(
                            videoUrl: widget.videoUrl,
                          ),
                          type: PageTransitionType.rightToLeft));
                },
                child: Icon(
                  Icons.play_circle_outline,
                  size: 50,
                  color: constantColors.whiteColor,
                ),
              ),
            ]),
            Container(
              color: constantColors.backGroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Player Name',
                            style: TextStyle(
                                fontSize: 16,
                                color: constantColors.descTextColor),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.username,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                color: constantColors.whiteColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Youtube',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: constantColors.descTextColor)),
                          SizedBox(
                            height: 3,
                          ),
                          Text(widget.youtube,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: constantColors.whiteColor)),
                        ]),
                  ),
                  Container(
                    width: 1,
                    color: constantColors.whiteColor,
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Instagram',
                            style: TextStyle(
                                fontSize: 16,
                                color: constantColors.descTextColor),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.instagram,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                color: constantColors.whiteColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Twitter',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: constantColors.descTextColor)),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.twitter,
                            //fix text overflow//
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                color: constantColors.whiteColor),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
