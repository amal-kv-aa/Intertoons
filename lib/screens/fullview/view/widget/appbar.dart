import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/cart/provider/cart_provider.dart';
import 'package:intertoons/screens/cart/view/cart.dart';
import 'package:provider/provider.dart';

class Deatilsappbar extends StatelessWidget {
  const Deatilsappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_sharp)),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            SizedBox(
              width: 20.w,
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => Cart(
                                popButton: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                              )));
                    },
                    icon: const Icon(Icons.shopping_cart_outlined)),
                context.watch<CartProvder>().cartList.isNotEmpty
                    ? CircleAvatar(
                        radius: 10.r,
                        backgroundColor: const Color.fromARGB(255, 224, 9, 9),
                        child: Text(
                          context
                              .watch<CartProvder>()
                              .cartList
                              .length
                              .toString(),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
      ],
    );
  }
}
