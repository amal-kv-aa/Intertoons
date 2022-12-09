import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/home/provider/home_provider.dart';
import 'package:intertoons/screens/home/view/widgets/appbar/appbar.dart';
import 'package:intertoons/screens/home/view/widgets/home_products/home_product.dart';
import 'package:intertoons/screens/home/view/widgets/slideshow/coverimage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeProvider>().getAllProduct(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const HomeAppbar(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: SizedBox(
                  height: 180.h,
                  width: double.infinity,
                  child: Posterimage(context: context)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured Products",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 17.sp,
                        color: Colors.pink,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const HomeProdcutCard(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: SizedBox(
                height: 300.h,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Color.fromARGB(255, 76, 175, 139),
                                    child: Center(
                                      child: Icon(
                                        Icons.motorcycle_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Expanded(
                                    flex: 3,
                                    child: Text(
                                        "Get thing Deliverd to your Door step"))
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Color.fromARGB(255, 76, 175, 139),
                                    child: Center(
                                      child: Icon(
                                        Icons.currency_rupee,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Expanded(
                                    flex: 3,
                                    child: Text(
                                        "No minimal order value in your purchase"))
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Color.fromARGB(255, 76, 175, 139),
                                    child: Center(
                                      child: Icon(
                                        Icons.access_time_filled,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Expanded(
                                    flex: 3,
                                    child: Text(
                                        "Operational Hourse:\n08:00 AM - 10:00 PM"))
                              ],
                            )
                          ],
                        )),
                    Expanded(
                        flex: 2,
                        child: Center(
                          child: LottieBuilder.asset(
                              "assets/animation/21654-delivery-guy-order-pickup.json"),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
