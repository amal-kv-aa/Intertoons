import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intertoons/screens/home/model/bannermodel/home_model.dart';
import 'package:intertoons/screens/home/model/featuredmodel/model.dart';
import 'package:intertoons/services/api_service/service.dart';
import 'package:intertoons/utils/toast/toast.dart';

class HomeProvider with ChangeNotifier {
  // HomeProvider() {
  //   getAllProduct();
  // }

  bool isShow = false;
  bool isFav = false;
  FeaturedModel? prodcuts;
  Data? allproducts;
  String location ="choose location"; 

//============to==like============//
  like(int index) {
    prodcuts!.data[index].isLiked = true;
    notifyListeners();
  }

//============to==unLike============//
  unLike(int index) {
    prodcuts!.data[index].isLiked = null;
    notifyListeners();
  }

//==========Favorite====//
  void isFave() {
    isFav = !isFav;
    notifyListeners();
  }

//============to==show=Descreiption==========//
  showMore() {
    isShow = !isShow;
    notifyListeners();
  }

//============to==update==on==model========//
  cartUpdate(int index) {
    if (prodcuts!.data[index].isCarted!) {
      prodcuts!.data[index].isCarted = false;
      notifyListeners();
    } else {
      prodcuts!.data[index].isCarted = true;
      notifyListeners();
    }
    log(prodcuts!.data[index].isCarted!.toString());
  }

//============fetching===banners==and===featurd==items=========//
  getAllProduct(BuildContext context) {
    ApiService().getHomeProducts().then((value) {
      if (value != null) {
        allproducts = value;
        notifyListeners();
      } else {
        Show.toast(
            context: context,
            text: "somthing went worng check your internet connection");
      }
    });
    ApiService().getFeaturedProduct().then((value) {
      if (value != null) {
        prodcuts = value;
        notifyListeners();
      } else {
        Show.toast(
            context: context,
            text: "somthing went worng check your internet connection");
      }
    });
  }
   List<DropdownMenuItem<String>> getUserDropDown() {
    List<String> users=["calicut","wayanad","kochi"];
  List<DropdownMenuItem<String>> items = [];
  for (int i = 0; i < users.length; i++) 
  {
    items.add(
      DropdownMenuItem(
      value: users[i],
      child: Text(users[i]),
    ));
  }
  return items;
}
updatelocation(String value){
location = value;
notifyListeners();
}
}