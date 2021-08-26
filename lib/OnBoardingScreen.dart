import 'package:flutter/material.dart';
import 'package:page_view_ornek/PageViewItem.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List<Map<String, String>> pageList = [
    {
      "title":"Iphone 12",
      "desc":"Blast past fast.",
      "image":"assets/iphone12_1.png",
    },
    {
      "title":"Iphone 12",
      "desc":"To behold And be held",
      "image":"assets/iphone12_2.png",
    },
    {
      "title":"Iphone 12",
      "desc":"The chip that pushes what's possible",
      "image":"assets/iphone12_3.png",
    },
  ];



  PageController _pageController = PageController(initialPage: 0);

  bool isShowButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          PageView(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (int i) {
                              print(i);
                              if (i == pageList.length - 1) {
                                setState(() {
                                  isShowButton = true;
                                });
                              } else {
                                setState(() {
                                  isShowButton = false;
                                });
                              }

                            },
                            children: pageList.map((item) {
                                return PageViewItem(
                                  title: item["title"],
                                  desc: item["desc"],
                                  url: item["image"],
                                );
                              }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: _buildIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Visibility _buildIndicator() {
    return Visibility(
      visible: isShowButton,
        child: Positioned(
          bottom: 40,
          right: 40,
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Container(
              color: Colors.orange,
              child: Text('Next'),
            ),
          ),
        ),
    );
  }
}
