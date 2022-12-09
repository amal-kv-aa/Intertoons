import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/cart/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class BillDetails extends StatelessWidget {
  const BillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     Consumer<CartProvder>(builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      "Bill Details",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item total",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(value.total.toString(),
                            style: Theme.of(context).textTheme.labelLarge)
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Product Discount",
                            style: Theme.of(context).textTheme.labelLarge),
                        Text("0%",
                            style: Theme.of(context).textTheme.labelLarge),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sub Total",
                            style: Theme.of(context).textTheme.displayLarge),
                        Text(
                          value.total.toString(),
                          style: Theme.of(context).textTheme.displayLarge,
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black26,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("SELECT DELIVERY OPTION")),
                    )
                  ],
                ),
              );
            });
  }
}