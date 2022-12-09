import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/fullview/model/detail_model.dart';
import 'package:provider/provider.dart';

import '../../../../cart/provider/cart_provider.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.product, required this.index});
  final Detail product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "₹ "
                        "${product.prodDetails?.unitPrice ?? ""}  ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: "₹ ${product.prodDetails?.costPrice ?? "0.00"}",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black45,
                      fontSize: 15.sp,
                    ))
              ])),
              SizedBox(
                width: 10.w,
              ),
              Container(
                height: 30.h,
                width: 60.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 48, 22, 143),
                          Color.fromARGB(255, 130, 60, 196)
                        ])),
                child: Center(
                  child: Text(
                    product.prodDetails?.markupPercentage ?? '3 % off',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 90.w,
            child: product.prodDetails!.isCarted!
                ? ElevatedButton(
                    onPressed: () {
                      context.read<CartProvder>().removeItem(
                          product.prodDetails!.urlKey!,
                          context,
                          index,
                          product);
                    },
                    child: const Text(
                      'remove',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      context
                          .read<CartProvder>()
                          .addTocart(product, context, index);
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
