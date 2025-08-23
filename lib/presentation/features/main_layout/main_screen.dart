import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/core/widgets/main_header.dart';
import 'package:ecommerce/presentation/features/main_layout/categories/categories_tab.dart';
import 'package:ecommerce/presentation/features/main_layout/favorite/favorite_tab.dart';
import 'package:ecommerce/presentation/features/main_layout/home/home_tab.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'main screen';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> tabs = [HomeTab(), CategoriesTab(), FavoriteTab()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/home_title.png'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage('assets/images/settings_icon.png'),
                color: MyApp.mainColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          MainHeader(),
          SizedBox(height: 20),
          Expanded(child: tabs[selectedIndex]),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          border: Border.all(),
          color: MyApp.mainColor,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: [
            buildNavItem('assets/images/home_icon.png', 'home', 0),
            buildNavItem('assets/images/categories_icon.png', 'categories', 1),
            buildNavItem('assets/images/favorite_icon.png', 'favorite', 2),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildNavItem(String icon, String label, int index) {
    bool isSelected = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(7),
        decoration:
            isSelected
                ? BoxDecoration(shape: BoxShape.circle, color: Colors.white)
                : null,
        child: ImageIcon(
          AssetImage(icon),
          size: 30,
          color: isSelected ? MyApp.mainColor : Colors.white,
        ),
      ),
      label: label,
      backgroundColor: Colors.transparent,
    );
  }
}
