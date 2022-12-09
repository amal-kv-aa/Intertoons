
import 'package:flutter/material.dart';
import 'package:intertoons/screens/cart/view/cart.dart';
import 'package:intertoons/screens/category/category.dart';
import 'package:intertoons/screens/home/view/home.dart';
import 'package:intertoons/screens/mainhome/provider/main_provider.dart';
import 'package:intertoons/screens/mainhome/view/widget/bottomnavbar/bottm_nav.dart';
import 'package:intertoons/screens/profile/profile.dart';
import 'package:intertoons/screens/search/search.dart';
import 'package:provider/provider.dart';

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);
  final List _pages = [
    const Home(),
   const Category(),
   const Cart(),const Search(),const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[context.watch<MainHomeProvider>().currentIndex],
      bottomNavigationBar:
      const BottomNavItem(),
    );
  }
}