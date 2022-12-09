// To parse this JSON data, do
//
//     final allProductModel = allProductModelFromJson(jsonString);

import 'dart:convert';

AllProductModel allProductModelFromJson(String str) => AllProductModel.fromJson(json.decode(str));


class AllProductModel {
    AllProductModel({
       required this.data,
    });

    Data data;

    factory AllProductModel.fromJson(Map<String, dynamic> json) => AllProductModel(
        data: json["Data"] = Data.fromJson(json["Data"]),
    );

}

class Data {
    Data({
       required this.mainBanners,
       required this.mobileMainBanners,
       required this.topCategories,
       required this.mobilePromoFull,
        required this.category4In1X2,
       required this.mobileOfferZoneBanners,
    });

    List<dynamic> mainBanners;
    List<Mobile> mobileMainBanners;
    List<TopCategory> topCategories;
    List<Mobile> mobilePromoFull;
    List<Category4In1X2> category4In1X2;
    List<Mobile> mobileOfferZoneBanners;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        mainBanners: json["MainBanners"] = List<dynamic>.from(json["MainBanners"].map((x) => x)),
        mobileMainBanners: json["MobileMainBanners"] = List<Mobile>.from(json["MobileMainBanners"].map((x) => Mobile.fromJson(x))),
        topCategories: json["TopCategories"]= List<TopCategory>.from(json["TopCategories"].map((x) => TopCategory.fromJson(x))),
        mobilePromoFull: json["MobilePromoFull"] = List<Mobile>.from(json["MobilePromoFull"].map((x) => Mobile.fromJson(x))),
        category4In1X2: json["Category4in1x2"] = List<Category4In1X2>.from(json["Category4in1x2"].map((x) => Category4In1X2.fromJson(x))),
        mobileOfferZoneBanners: json["MobileOfferZoneBanners"] = List<Mobile>.from(json["MobileOfferZoneBanners"].map((x) => Mobile.fromJson(x))),
    );

}

class Category4In1X2 {
    Category4In1X2({
        this.elementId,
        this.elementName,
        this.catname,
        this.catUrlKey,
        this.imageUrl,
        this.catid,
        this.main,
        this.position,
        this.status,
        this.catOfferImg,
    });

    int? elementId;
    String? elementName;
    String? catname;
    String?catUrlKey;
    String? imageUrl;
    int? catid;
    int? main;
    int? position;
    dynamic status;
    String? catOfferImg;

    factory Category4In1X2.fromJson(Map<String, dynamic> json) => Category4In1X2(
        elementId: json["elementId"],
        elementName: json["elementName"],
        catname: json["catname"],
        catUrlKey: json["catUrlKey"],
        imageUrl: json["imageUrl"],
        catid: json["catid"],
        main: json["main"],
        position: json["position"],
        status: json["status"],
        catOfferImg: json["catOfferImg"],
    );

    Map<String, dynamic> toJson() => {
        "elementId": elementId,
        "elementName": elementName,
        "catname": catname,
        "catUrlKey": catUrlKey,
        "imageUrl": imageUrl,
        "catid": catid,
        "main": main,
        "position": position,
        "status": status,
        "catOfferImg": catOfferImg,
    };
}

class Mobile {
    Mobile({
        this.teId,
        this.elementName,
        this.imageUrl,
        this.position,
        this.status,
        this.delDate,
        this.link,
        this.mobUrlKey,
        this.mobType,
    });

    int? teId;
    String? elementName;
    String? imageUrl;
    int? position;
    bool? status;
    dynamic delDate;
    String? link;
    String? mobUrlKey;
    String? mobType;

    factory Mobile.fromJson(Map<String, dynamic> json) => Mobile(
        teId: json["teId"],
        elementName: json["elementName"],
        imageUrl: json["imageUrl"],
        position: json["position"],
        status: json["status"],
        delDate: json["delDate"],
        link: json["Link"],
        mobUrlKey: json["mob_urlKey"],
        mobType: json["mob_type"],
    );

    Map<String, dynamic> toJson() => {
        "teId": teId,
        "elementName": elementName,
        "imageUrl": imageUrl,
        "position": position,
        "status": status,
        "delDate": delDate,
        "Link": link,
        "mob_urlKey": mobUrlKey,
        "mob_type": mobType,
    };
}

class TopCategory {
    TopCategory({
        this.catId,
        this.catName,
        this.image,
        this.parentId,
        this.code,
        this.description,
        this.urlKey,
        this.metaTitle,
        this.metaKeywords,
        this.metaDescription,
        this.delDate,
        this.status,
        this.catUrlKey,
        this.imageUrl,
        this.position,
        this.bannerImgUrl,
        this.showinofferZone,
        this.mobBannerImgUrl,
        this.tag,
        this.catOfferImg,
        this.categoryCommissionSlabs,
        this.productCategories,
    });

    int? catId;
    String? catName;
    String? image;
    int? parentId;
    String? code;
    dynamic description;
    dynamic urlKey;
    dynamic metaTitle;
    dynamic metaKeywords;
    dynamic metaDescription;
    dynamic delDate;
    dynamic status;
    String? catUrlKey;
    String? imageUrl;
    int? position;
    String? bannerImgUrl;
    bool? showinofferZone;
    dynamic mobBannerImgUrl;
    dynamic tag;
    String? catOfferImg;
    List<dynamic>? categoryCommissionSlabs;
    List<dynamic>? productCategories;

    factory TopCategory.fromJson(Map<String, dynamic> json) => TopCategory(
        catId: json["catId"],
        catName: json["catName"],
        image: json["image"],
        parentId: json["parentId"],
        code: json["code"],
        description: json["description"],
        urlKey: json["urlKey"],
        metaTitle: json["metaTitle"],
        metaKeywords: json["metaKeywords"],
        metaDescription: json["metaDescription"],
        delDate: json["delDate"],
        status: json["status"],
        catUrlKey: json["catUrlKey"],
        imageUrl: json["imageUrl"],
        position: json["position"],
        bannerImgUrl: json["bannerImgUrl"],
        showinofferZone: json["showinofferZone"],
        mobBannerImgUrl: json["MobBannerImgUrl"],
        tag: json["tag"],
        catOfferImg: json["catOfferImg"],
        categoryCommissionSlabs: json["CategoryCommissionSlabs"] == null ? null : List<dynamic>.from(json["CategoryCommissionSlabs"].map((x) => x)),
        productCategories: json["ProductCategories"] == null ? null : List<dynamic>.from(json["ProductCategories"].map((x) => x)),
    );
}
