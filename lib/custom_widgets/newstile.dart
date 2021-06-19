import 'package:flutter/material.dart';
import 'package:esports_now/constants/constants.dart';

class NewsTile extends StatefulWidget {
  final String imageUrl, title, desc;
  final bool trending;

  NewsTile({this.imageUrl, this.title, this.desc, this.trending});

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  final ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.imageUrl),
                      width: double.infinity,
                    ),
                  ),
                  Visibility(
                    visible: widget.trending,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            widget.title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            widget.desc,
            style: TextStyle(color: constantColors.descTextColor),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
