import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/fullview/model/detail_model.dart';
import 'package:intertoons/services/api_service/service.dart';

class DeatilsProvider with ChangeNotifier {
  Detail? details;

//=================Fetching==product==details==========//
  Future<void>? getDeatils(String productUrl, bool isCart) {
    ApiService().getProductDeatils(productUrl).then((value) {
      if (value != null) {
        details = value.data;
        details!.prodDetails!.isCarted = isCart;
        notifyListeners();
      } else {}
    });
    return null;
  }

//=================notify=item==removed===========//
  isCartRemove() {
    details!.prodDetails!.isCarted = false;
    notifyListeners();
  }

//======================Zoom==Image==============//
  zoomImage(BuildContext context, String url) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
            height: 400.h,
            width: 300.w,
            child: ImageSlideshow(
                indicatorColor: const Color.fromARGB(255, 246, 18, 125),
                indicatorBackgroundColor:
                    const Color.fromARGB(255, 175, 158, 195),
                height: 170.h,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Image.network(url),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Image.network(
                        'https://tse3.mm.bing.net/th?id=OIP.pGPfH0aY_FnHNhzInv6ZXAHaHY&pid=Api&P=0'),
                  ),
                ]),
          ));
        });
  }
}
