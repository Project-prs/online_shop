import 'package:flutter/material.dart';
import 'package:online_shop/Controller/page_index_controller.dart';
import 'package:online_shop/View/Widgets/bottom_nav_item.dart';
import 'package:provider/provider.dart';

import '../../Constant/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageIndexController>(
      builder: (context, pageIndexController, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: blackColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavItem(
                      onTap: () {
                        pageIndexController.setSelectedIndex = 0;
                      },
                      icon: pageIndexController.selectedIndex == 0
                          ? Icons.home
                          : Icons.home_outlined),
                  BottomNavItem(
                      onTap: () {
                        pageIndexController.setSelectedIndex = 1;
                      },
                      icon: Icons.search),
                  BottomNavItem(
                      onTap: () {
                        pageIndexController.setSelectedIndex = 2;
                      },
                      icon: pageIndexController.selectedIndex == 2
                          ? Icons.add_circle_outlined
                          : Icons.add),
                  BottomNavItem(
                      onTap: () {
                        pageIndexController.setSelectedIndex = 3;
                      },
                      icon: pageIndexController.selectedIndex == 3
                          ? Icons.shopping_cart
                          : Icons.shopping_cart_outlined),
                  BottomNavItem(
                      onTap: () {
                        pageIndexController.setSelectedIndex = 4;
                      },
                      icon: pageIndexController.selectedIndex == 4
                          ? Icons.person
                          : Icons.person_outlined),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
