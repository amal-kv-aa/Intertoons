import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/fullview/model/detail_model.dart';
import 'package:intertoons/screens/fullview/provider/details.dart';
import 'package:intertoons/screens/fullview/view/widget/appbar.dart';
import 'package:intertoons/screens/fullview/view/widget/product_info/infocard.dart';
import 'package:intertoons/screens/home/view/widgets/home_products/home_product.dart';
import 'package:intertoons/services/api_service/endpoints/endpoints.dart';
import 'package:provider/provider.dart';
import '../../home/provider/home_provider.dart';

class Product extends StatelessWidget {
  const Product({Key? key, required this.index, required this.url})
      : super(key: key);
  final int index;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<DeatilsProvider>(builder: (context, value, child) {
          if (value.details == null ||
              value.details!.prodDetails!.urlKey != url) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          Detail product = value.details!;
          return AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(seconds: 3),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const Deatilsappbar(),
                  context.watch<HomeProvider>().prodcuts?.data[index].isLiked ==
                          null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.read<HomeProvider>().like(index);
                                },
                                icon: const Icon(
                                  Icons.favorite_outline_outlined,
                                  color: Color.fromARGB(197, 181, 26, 78),
                                ))
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.read<HomeProvider>().unLike(index);
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Color.fromARGB(197, 181, 26, 78),
                                )),
                          ],
                        ),
                  Stack(
                    children: [
                      ImageSlideshow(
                          indicatorColor:
                              const Color.fromARGB(255, 246, 18, 125),
                          indicatorBackgroundColor:
                              const Color.fromARGB(255, 175, 158, 195),
                          height: 170.h,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Image.network(
                                  "${Endpoints.mediaPath}${product.prodDetails!.imageUrl}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Image.network(
                                  'https://tse3.mm.bing.net/th?id=OIP.pGPfH0aY_FnHNhzInv6ZXAHaHY&pid=Api&P=0'),
                            ),
                          ]),
                      Positioned(
                          right: 5.w,
                          bottom: 5.w,
                          child: IconButton(
                              onPressed: () {
                                context.read<DeatilsProvider>().zoomImage(context, "${Endpoints.mediaPath}${product.prodDetails!.imageUrl}");
                              },
                              icon: const Icon(Icons.zoom_in_map)))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      product.prodDetails?.prName ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      product.prodDetails?.prWeight ?? "",
                      style: const TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InfoCard(product: product, index: index),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: const Divider(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "About Product",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<HomeProvider>().showMore();
                          },
                          icon: Icon(context.watch<HomeProvider>().isShow
                              ? Icons.keyboard_arrow_down_outlined
                              : Icons.keyboard_arrow_up_outlined),
                        )
                      ],
                    ),
                  ),
                  context.watch<HomeProvider>().isShow
                      ? SizedBox(
                          height: 170.h,
                          child: Column(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Description",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w700,
                                              wordSpacing: 3),maxLines: 4,overflow: TextOverflow.ellipsis,),
                                      SizedBox(height: 10.h),
                                      Text(
                                        product.prodDetails?.description
                                                ?.replaceAll("<li>", "")
                                                .replaceAll("<ul>", "")
                                                .replaceAll("</li>", "")
                                                .replaceAll("</ul>", "")
                                                .replaceAll("<p>", "")
                                                .replaceAll("</p>", "") ??
                                            "Not availabe",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            wordSpacing: 3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                             
                            ],
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: 40.h,
                    child: Center(child: Text(
                                      product.prodDetails?.catName ??
                                          "not available",
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w500,
                                          wordSpacing: 3))),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Text(
                      "You Might Also Like",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const HomeProdcutCard(),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ));
        }),
      ),
    );
  }
}
