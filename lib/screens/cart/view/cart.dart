import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/cart/provider/cart_provider.dart';
import 'package:intertoons/screens/cart/view/widget/billdetails/billdetails.dart';
import 'package:intertoons/screens/cart/view/widget/count_button/button.dart';
import 'package:intertoons/screens/home/view/widgets/home_products/home_product.dart';
import 'package:intertoons/services/api_service/endpoints/endpoints.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key, this.popButton});
  final Widget? popButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90.h,
              width: double.infinity,
              color: Theme.of(context).backgroundColor,
              child: SafeArea(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      popButton ?? const SizedBox(),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Cart(${context.watch<CartProvder>().cartList.length.toString()})",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Empty cart",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 20.w,
                      )
                    ]
                  )
                ]
              )),
            ),
            SizedBox(
              height: context.watch<CartProvder>().cartList.length.toDouble() * 100 + 10,
              child: Consumer<CartProvder>(builder: (context, value, child) {
                if (value.cartList.isEmpty) {
                  return const Center();
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.cartList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      secondaryBackground: SizedBox(
                        height: 100.h,
                        child: const Card(
                          color: Color.fromARGB(255, 3, 205, 0),
                          child: Center(
                            child: Text(
                              "Save for Later",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      movementDuration: const Duration(milliseconds: 1000),
                      background: SizedBox(
                        height: 100.h,
                        child: const Card(
                          color: Color.fromARGB(255, 255, 58, 44),
                          child: Center(
                            child: Text(
                              " Remove Item ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      behavior: HitTestBehavior.translucent,
                      resizeDuration: const Duration(milliseconds: 2000),
                      key: Key(value.cartList[index].prodDetails!.urlKey!),
                      confirmDismiss: (direction) => context
                          .read<CartProvder>()
                          .confirmDismiss(
                              direction,
                              value.cartList[index].prodDetails!.urlKey,
                              context,
                              index,
                              value.cartList[index]),
                      child: SizedBox(
                        height: 100.h,
                        width: double.infinity,
                        child: Card(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage: NetworkImage(
                                      "${Endpoints.mediaPath}${value.cartList[index].prodDetails?.imageUrl ?? Endpoints.nullImage}"),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    value.cartList[index].prodDetails!.prName!),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: CountButton(
                                    prodcuts:
                                        value.cartList[index].prodDetails!,
                                    index: index,
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "₹ "
                                        "${value.cartList[index].prodDetails?.unitPrice ?? ""}  ",
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                      Text(
                                          "₹ ${value.cartList[index].prodDetails?.specialPrice ?? "0.00"}",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.red,
                                            fontSize: 10.sp,
                                          ))
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            SizedBox(
              height: 70.h,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.card_giftcard_rounded),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "Avail Offers And / Coupons",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_right,
                          color: Colors.pink,
                          size: 40.sp,
                        ),
                        SizedBox(
                          width: 20.w,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Text(
                "You Might Also Like",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const HomeProdcutCard(),
           const BillDetails()
          ],
        ),
      ),
    );
  }
}
