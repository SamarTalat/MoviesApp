// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/core/utils/movies_colors.dart';
import 'package:movieapp/features/browse/view/browse_view.dart';
import 'package:movieapp/features/browse/view/categoryDM.dart';
import 'package:movieapp/features/home/view/home_screen.dart';
import 'package:movieapp/features/search/view/search_screen.dart';
import 'package:movieapp/features/watchlist/view/watchlist_screen.dart';

class StartPoint extends StatefulWidget {
  static const String routeName = "StartPoint";

  const StartPoint({super.key});

  @override
  State<StartPoint> createState() => _StartPointState();
}

class _StartPointState extends State<StartPoint> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: screens[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            unselectedFontSize: 12.sp,
            selectedFontSize: 12.sp,
            selectedItemColor: MoviesColors.yellowColor,
            unselectedItemColor: MoviesColors.greyColor,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/home.png"),
                  ),
                  label: "HOME"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/search.png"),
                  ),
                  label: "SEARCH"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/browse.png"),
                  ),
                  label: "BROWSE"),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/watchlist.png"),
                ),
                label: "WATCHLIST",
              ),
            ],
          )),
    );
  }
  CategoryDM? selectedCategory;
  void onCategoryClick(CategoryDM newSelectedCategory){
    selectedCategory=newSelectedCategory;
    setState(() {

    });
  }
}
