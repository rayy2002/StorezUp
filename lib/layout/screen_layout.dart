import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:storezup/utils/color_themes.dart';

import '../providers/user_details_provider.dart';
import '../resources/cloudfirestore_methods.dart';
import '../utils/constants.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  changePage(int page) {
    pageController.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override
  void initState() {
    super.initState();
    CloudFirestoreClass().getNameAndAddress();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserDetailsProvider>(context).getData();
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: screens,
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: Color.fromRGBO(189, 189, 189, 1), width: 1),
              ),
            ),
            child: TabBar(
              indicator: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.primaryColor, width: 4),
                ),
              ),
              onTap: changePage,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Icon(
                    Icons.home,
                    color:
                        currentPage == 0 ? AppColors.primaryColor : Colors.grey,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.event,
                    color:
                        currentPage == 1 ? AppColors.primaryColor : Colors.grey,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.account_circle,
                    color:
                        currentPage == 2 ? AppColors.primaryColor : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
