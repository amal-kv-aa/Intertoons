import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/cart/provider/cart_provider.dart';
import 'package:intertoons/screens/fullview/model/detail_model.dart';
import 'package:provider/provider.dart';

class CountButton extends StatelessWidget {
  const CountButton({super.key, required this.prodcuts, required this.index});
  final ProdDetails prodcuts;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27.h,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 53, 120),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 27.w,
            height: 27.h,
            child: ElevatedButton(
                onPressed: () {
                  context.read<CartProvder>().decreaseCount(prodcuts);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 47, 7, 88),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(0)),
                child: const Text(
                  '-',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          SizedBox(
              child: Text(
            "${context.watch<CartProvder>().cartList[index].prodDetails!.cartItemQty!}"
                .toString(),
            style: const TextStyle(color: Colors.white),
          )),
          SizedBox(
            width: 27.w,
            height: 27.h,
            child: ElevatedButton(
                onPressed: () {
                  context.read<CartProvder>().increaseCount(prodcuts);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 47, 7, 88),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(0)),
                child: const Text(
                  '+',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
