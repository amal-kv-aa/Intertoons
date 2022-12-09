import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/home/provider/home_provider.dart';
import 'package:intertoons/services/api_service/endpoints/endpoints.dart';
import 'package:provider/provider.dart';

class Posterimage extends StatelessWidget {
  const Posterimage({Key? key, required this.context}) : super(key: key);
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return ImageSlideshow(
        initialPage: 0,
        indicatorColor: const Color.fromARGB(255, 239, 16, 172),
        indicatorBackgroundColor: const Color.fromARGB(255, 113, 29, 125),
        onPageChanged: (key) {},
        autoPlayInterval: 4000,
        isLoop: true,
        children: [
          Poster(
              image:
                  "${Endpoints.mediaPath}${value.allproducts?.topCategories[0].bannerImgUrl ?? Endpoints.nullImage}"),
          Poster(
              image:
                  "${Endpoints.mediaPath}${value.allproducts?.topCategories[8].bannerImgUrl ?? Endpoints.nullImage}"),
          Poster(
            image:
                "${Endpoints.mediaPath}${value.allproducts?.topCategories[2].bannerImgUrl ?? Endpoints.nullImage}",
          )
        ],
      );
    });
  }
}

class Poster extends StatelessWidget {
  const Poster({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 255, 255, 255),
          image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
