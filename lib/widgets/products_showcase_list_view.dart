import 'package:flutter/material.dart';
import 'package:storezup/utils/color_themes.dart';

import '../utils/utils.dart';

class ProductsShowcaseListView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProductsShowcaseListView({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    double height = screenSize.height / 2.8;
    double titleHeight = 35;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      height: height,
      width: screenSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: titleHeight,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      "View all",
                      style: TextStyle(color: AppColors.greyTextColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: height - (titleHeight + 26),
            width: screenSize.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}

class ProductsShowcaseVerticalListView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProductsShowcaseVerticalListView({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    // double height = screenSize.height;
    double titleHeight = 35;
    return Container(
      // margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      // height: height,
      width: screenSize.width,
      // color: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: titleHeight,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      "View All",
                      style: TextStyle(color: AppColors.greyTextColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: screenSize.width,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
