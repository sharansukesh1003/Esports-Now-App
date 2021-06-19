import 'package:esports_now/helper/data.dart';
import 'package:flutter/material.dart';
import 'package:esports_now/constants/constants.dart';
import 'package:esports_now/models/categorymodel.dart';
import 'package:page_transition/page_transition.dart';
import 'package:esports_now/clipspage/pubgpage.dart';

//clips of the week page
class ClipsPage extends StatefulWidget {
  @override
  _ClipsPageState createState() => _ClipsPageState();
}

class _ClipsPageState extends State<ClipsPage> {
  final ConstantColors constantColors = ConstantColors();
  final Ktext constantText = Ktext();
  List<CategoryModel> categories = [];

  @override
  void initState() {
    categories = getClips();
    super.initState();
  }

  final List<String> clipsCategoryList = [
    'csgoclips',
    'valorantclips',
    'dotaclips',
    'pubgclips',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Clips Of',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: constantColors.whiteColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'The Week',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: constantColors.whiteColor),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
            child: Text(
              constantText.clipsPageText,
              style:
                  TextStyle(fontSize: 14, color: constantColors.descTextColor),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ClipsPageModel(
                                  clipsCategory: clipsCategoryList[index],
                                ),
                                type: PageTransitionType.rightToLeft));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 8.0, right: 8.0),
                        child: ClipsInfoTile(
                          imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName,
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipsInfoTile extends StatelessWidget {
  final imageUrl, categoryName;
  ClipsInfoTile({this.imageUrl, this.categoryName});
  final ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: constantColors.whiteColor,
                fontSize: 30),
          )
        ],
      ),
    );
  }
}
