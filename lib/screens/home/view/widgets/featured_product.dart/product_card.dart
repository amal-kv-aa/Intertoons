import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/home/model/featuredmodel/model.dart';
import 'package:intertoons/screens/home/provider/home_provider.dart';
import 'package:intertoons/services/api_service/endpoints/endpoints.dart';
import 'package:provider/provider.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({super.key, this.product, required this.index});
  final Datum? product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
            width: 150.w,
            height: 230.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(76, 5, 1, 1),
                  blurRadius: 10,
                  offset: Offset(-8, 10),
                ),
              ],
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          context
                                      .watch<HomeProvider>()
                                      .prodcuts
                                      ?.data[index]
                                      .isLiked ==
                                  null
                              ? IconButton(
                                  onPressed: () {
                                    context.read<HomeProvider>().like(index);
                                  },
                                  icon: const Icon(
                                    Icons.favorite_outline_outlined,
                                    color: Color.fromARGB(197, 181, 26, 78),
                                  ))
                              : IconButton(
                                  onPressed: () {
                                    context.read<HomeProvider>().unLike(index);
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Color.fromARGB(197, 181, 26, 78),
                                  ))
                        ],
                      ),
                      Image.network(
                        "https://thumbs.dreamstime.com/b/special-offer-tag-label-pink-vector-illustration-isolated-white-background-120623981.jpg",
                        height: 50.h,
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Image.network(
                      "${Endpoints.mediaPath}${product!.imageUrl}",
                    )),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product?.prName ?? "not available",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            product?.unitPrice.toString() ?? "",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black45),
                          ),
                          Text(
                              "₹ " "${product?.unitPrice.toString() ?? ""}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(product?.stockAvailability.toString() ?? ""),
                              Container(
                                height: 30.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(44, 5, 1, 1),
                                      blurRadius: 5,
                                      offset: Offset(-3, 3),
                                    ),
                                  ],
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.pink,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            )));
  }
}
