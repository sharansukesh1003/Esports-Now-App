import 'package:esports_now/clipspage/categorypageview.dart';
import 'package:esports_now/helper/data.dart';
import 'package:esports_now/models/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:esports_now/constants/constants.dart';
import 'package:esports_now/custom_widgets/maincontent.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> newsArticleDecider = [
    'csgoarticle',
    'valorantarticle',
    'dotaarticle',
    'pubgarticle',
  ];
  final ConstantColors constantColors = ConstantColors();
  List<CategoryModel> categories = [];
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 80,
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CategoryPageBuilder(
                                      newsDecider: newsArticleDecider[index]),
                                  type: PageTransitionType.rightToLeft));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          ),
                        ));
                  }),
            ),
          ),
          Expanded(
            child: MainContent(),
          ),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  final ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.network(
              imageUrl,
              height: 70,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 70,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.black26,
            ),
          ),
          Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: constantColors.whiteColor),
          )
        ],
      ),
    );
  }
}
