import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intertoons/screens/fullview/model/detail_model.dart';
import 'package:intertoons/screens/fullview/provider/details.dart';
import 'package:intertoons/screens/home/provider/home_provider.dart';
import 'package:intertoons/utils/toast/toast.dart';
import 'package:provider/provider.dart';

class CartProvder with ChangeNotifier {
  List<Detail> cartList = [];
  double total = 0;

//=================add==items=to===cart==============/
  void addTocart(Detail item, BuildContext context, int index) {
    item.prodDetails!.cartItemQty = 1;
    item.prodDetails!.isCarted = true;
    cartList.add(item);
    Show.toast(context: context, text: "Item Added");
    total = total + item.prodDetails!.unitPrice!;
    notifyListeners();
    context.read<HomeProvider>().cartUpdate(index);
  }

//=================remove==items=from===cart==============//
  void removeItem(
      String urlKey, BuildContext context, int itemIndex, Detail item) {
    int index = cartList.indexWhere((e) => e.prodDetails!.urlKey == urlKey);
    final qty = item.prodDetails!.cartItemQty!.toDouble();
    cartList.removeAt(index);
    Show.toast(context: context, text: "Item removed");
    if (cartList.isEmpty) {
      total = 0;
    } else {
      total = total - (item.prodDetails!.unitPrice! * qty);
    }
    notifyListeners();
    context.read<DeatilsProvider>().isCartRemove();
    context.read<HomeProvider>().cartUpdate(itemIndex);
  }

//===============adding==product==count==========//
  increaseCount(ProdDetails product) {
    if (product.cartItemQty! < 5) {
      final qty = product.cartItemQty!.toDouble();
      product.cartItemQty = product.cartItemQty! + 1;
      total = total + (product.unitPrice! * qty);
      notifyListeners();
    }
  }

//===============Minus==product==count==========//
  decreaseCount(ProdDetails product) {
    if (product.cartItemQty! > 1) {
      final qty = product.cartItemQty!.toDouble() - 1;
      total = total - (product.unitPrice! * qty);
      product.cartItemQty = product.cartItemQty! - 1;
      notifyListeners();
    }
  }

//================swipe====remove===============//
  Future<bool?> confirmDismiss(
      DismissDirection direction, urlKey, context, itemIndex, item) async {
    if (direction == DismissDirection.startToEnd) {
      log("hey..");
      removeItem(urlKey, context, itemIndex, item);
      return true;
    } else if (direction == DismissDirection.endToStart) {
      Show.toast(context: context, text: "Item Saved 😊");
    }
    return null;
  }
}
