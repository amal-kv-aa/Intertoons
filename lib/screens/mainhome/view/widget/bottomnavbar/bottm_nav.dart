import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/cart/provider/cart_provider.dart';
import 'package:intertoons/screens/mainhome/provider/main_provider.dart';
import 'package:provider/provider.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.category), label: 'Category'),
        BottomNavigationBarItem(
            icon: context.watch<CartProvder>().cartList.isNotEmpty
                ? SizedBox(
                    height: 30.h,
                    width: 50.w,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Positioned(
                            bottom: 0,
                            right: 15,
                            child: Icon(Icons.shopping_cart_outlined)),
                        Positioned(
                          right: 5,
                          top: 0,
                          child: CircleAvatar(
                            radius: 8,
                            child: Center(
                              child: Text(
                                context
                                    .watch<CartProvder>()
                                    .cartList
                                    .length
                                    .toString(),
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const Icon(Icons.shopping_cart_outlined),
            label: 'Cart'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.search), label: 'Search'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile')
      ],
      currentIndex: context.watch<MainHomeProvider>().currentIndex,
      selectedItemColor: Theme.of(context).backgroundColor,
      unselectedItemColor: Colors.grey,
      elevation: 30,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (newIndex) {
        context.read<MainHomeProvider>().updateIndex(newIndex);
      },
    );
  }
}
