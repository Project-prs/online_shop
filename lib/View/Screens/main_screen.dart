import 'package:flutter/material.dart';
import 'package:online_shop/Constant/colors.dart';
import 'package:online_shop/Controller/page_index_controller.dart';
import 'package:online_shop/View/Screens/bottom_nav_screen.dart';
import 'package:online_shop/View/Screens/Cart/cart_screen.dart';
import 'package:online_shop/View/Screens/Favorite/favorite_items_screen.dart';
import 'package:online_shop/View/Screens/Home/home_screen.dart';
import 'package:online_shop/View/Screens/Profile/profile_screen.dart';
import 'package:online_shop/View/Screens/Search/search_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<Widget> pageList = const [
  HomeScreen(),
  SearchScreen(),
  FavoriteItemsScreen(),
  CartScreen(),
  ProfileScreen()
];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageIndexController>(
      builder: (context, pageIndexController, child) {
        return Scaffold(
          backgroundColor: greyColor,
          body: pageList[pageIndexController.selectedIndex],
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
