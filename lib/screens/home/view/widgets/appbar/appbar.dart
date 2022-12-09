import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 15, 1, 55),
        Color.fromARGB(255, 119, 27, 155)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.pin_drop_outlined,
                          color: Color.fromARGB(255, 128, 15, 53),
                        )),
                    SizedBox(width: 20.w),
                    Row(
                      children: [
                        DropdownButton<String>(
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          underline: const SizedBox(),
                          iconEnabledColor:
                              const Color.fromARGB(255, 147, 8, 54),
                          hint: Text(
                            context.watch<HomeProvider>().location,
                            style: const TextStyle(color: Colors.white),
                          ),
                          items: context.read<HomeProvider>().getUserDropDown(),
                          onChanged: (value) {
                            if (value == null) return;
                            context.read<HomeProvider>().updatelocation(value);
                          },
                        )
                      ],
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      context.read<HomeProvider>().isFave();
                    },
                    icon: Icon(
                      context.watch<HomeProvider>().isFav == true
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Colors.white30,
                    ))
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    hintText: 'Search for over 5000 products',
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
