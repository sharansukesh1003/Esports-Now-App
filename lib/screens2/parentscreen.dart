import 'package:esports_now/screens2/clipspage.dart';
import 'package:esports_now/screens2/homepage.dart';
import 'package:flutter/material.dart';
import 'package:esports_now/constants/constants.dart';

class MyBottomBarDemo extends StatefulWidget {
  @override
  _MyBottomBarDemoState createState() => new _MyBottomBarDemoState();
}

class _MyBottomBarDemoState extends State<MyBottomBarDemo> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    HomePage(),
    ClipsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  ConstantColors constantColors = ConstantColors();
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
            Text('NOW',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    fontStyle: FontStyle.italic,
                    color: constantColors.primaryColor)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        // showSelectedLabels: false,
        fixedColor: constantColors.whiteColor,
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: constantColors.primaryColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.article_outlined,
                size: 30,
              ),
              label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_outline,
                size: 30,
              ),
              label: 'Clips'),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
