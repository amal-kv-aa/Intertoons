import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/fullview/view/fullview.dart';
import 'package:intertoons/screens/home/provider/home_provider.dart';
import 'package:intertoons/screens/home/view/widgets/featured_product.dart/product_card.dart';
import 'package:provider/provider.dart';

import '../../../../fullview/provider/details.dart';

class HomeProdcutCard extends StatelessWidget {
  const HomeProdcutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 270.h,
              child: Consumer<HomeProvider>(builder: (context, value, child) {
                if (value.prodcuts == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: value.prodcuts!.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          context.read<DeatilsProvider>().getDeatils(
                              value.prodcuts!.data[index].urlKey.toString(),
                              value.prodcuts?.data[index].isCarted ?? false);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Product(
                                    url: value.prodcuts!.data[index].urlKey
                                        .toString(),
                                    index: index,
                                    //product: context.watch<DeatilsProvider>().details,
                                  )));
                        },
                        child: FeaturedProduct(
                          product: value.prodcuts?.data[index],
                          index: index,
                        ));
                  },
                );
              }),
            );
  }
}