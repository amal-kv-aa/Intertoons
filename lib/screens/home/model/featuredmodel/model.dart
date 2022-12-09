// To parse this JSON data, do
//
//     final featuredModel = featuredModelFromJson(jsonString);

import 'dart:convert';

FeaturedModel featuredModelFromJson(String str) => FeaturedModel.fromJson(json.decode(str));


class FeaturedModel {
    FeaturedModel({
       required this.message,
        required this.data,
    });

    String message;
    List<Datum> data;

    factory FeaturedModel.fromJson(Map<String, dynamic> json) => FeaturedModel(
        message: json["Message"],
        data: json["Data"] = List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    );

}

class Datum {
    Datum({
      this.isLiked ,
        this.venderName,
        this.venderDetails,
        this.vendorUrlKey,
        this.catName,
        this.imageUrl,
        this.catUrlKey,
        this.catId,
        this.cartItemQty,
        this.isWishlisted,
        this.isCarted,
        this.isAvailPincode,
        this.isReviewCount,
        this.reviewstatus,
        this.isReviewAvgrating,
        this.productId,
        this.vendorid,
        this.prDate,
        this.actDate,
        this.prName,
        this.sku,
        this.unitPrice,
        this.description,
        this.shortDescription,
        this.urlKey,
        this.metaTitle,
        this.metaKeywords,
        this.metaDescription,
        this.status,
        this.qoh,
        this.rank,
        this.availableFrom,
        this.availableTo,
        this.suspendedDate,
        this.newDate,
        this.delDate,
        this.maxQtyInOrders,
        this.soldQty,
        this.stockAvailability,
        this.backOrders,
        this.rol,
        this.roq,
        this.parentId,
        this.specialPrice,
        this.attributeSetId,
        this.pincodeSetId,
        this.prWeight,
        this.taxClassId,
        this.cessAmount,
        this.featuredImage,
        this.avgRating,
        this.reviewCount,
        this.dealFrom,
        this.dealTo,
        this.erpRefNo,
        this.productType,
        this.variationJson,
        this.bsl,
        this.prWeightMfactor,
        this.markupPercentage,
        this.productLabel,
        this.backgroundColorCode,
        this.isNew,
        this.costPrice,
        this.erpCat,
        this.prwmf,
        this.cartItems,
        this.keywords,
        this.taxClass,
        this.productCategories,
        this.productImages,
        this.productPincodes,
        this.vendor,
        this.productViews,
        this.reviews,
        this.saveForLaters,
        this.wishLists,
    });
    bool? isLiked;
    dynamic venderName;
    dynamic venderDetails;
    dynamic vendorUrlKey;
    dynamic catName;
    String? imageUrl;
    dynamic catUrlKey;
    int? catId;
    int? cartItemQty;
    bool? isWishlisted;
    bool? isCarted;
    bool? isAvailPincode;
    int? isReviewCount;
    int? reviewstatus;
    double? isReviewAvgrating;
    int? productId;
    int? vendorid;
    DateTime? prDate;
    dynamic actDate;
    String? prName;
    String? sku;
    double? unitPrice;
    dynamic description;
    dynamic shortDescription;
    String? urlKey;
    String?metaTitle;
    String? metaKeywords;
    String? metaDescription;
    bool? status;
    double? qoh;
    int? rank;
    dynamic availableFrom;
    dynamic availableTo;
    dynamic suspendedDate;
    dynamic newDate;
    dynamic delDate;
    double? maxQtyInOrders;
    double? soldQty;
    String? stockAvailability;
    bool? backOrders;
    double? rol;
    double? roq;
    dynamic parentId;
    double? specialPrice;
    dynamic attributeSetId;
    dynamic pincodeSetId;
    String? prWeight;
    dynamic taxClassId;
    dynamic cessAmount;
    dynamic featuredImage;
    dynamic avgRating;
    dynamic reviewCount;
    DateTime? dealFrom;
    DateTime? dealTo;
    dynamic erpRefNo;
    dynamic productType;
    dynamic variationJson;
    dynamic bsl;
    dynamic prWeightMfactor;
    dynamic markupPercentage;
    String? productLabel;
    String? backgroundColorCode;
    dynamic isNew;
    dynamic costPrice;
    dynamic erpCat;
    dynamic prwmf;
    List<dynamic>? cartItems;
    List<dynamic>? keywords;
    dynamic taxClass;
    List<dynamic>? productCategories;
    List<dynamic> ?productImages;
    List<dynamic>? productPincodes;
    dynamic vendor;
    List<dynamic>? productViews;
    List<dynamic> ?reviews;
    List<dynamic> ?saveForLaters;
    List<dynamic>? wishLists;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        venderName: json["venderName"],
        venderDetails: json["venderDetails"],
        vendorUrlKey: json["vendorUrlKey"],
        catName: json["catName"],
        imageUrl: json["imageUrl"],
        catUrlKey: json["catUrlKey"],
        catId: json["catId"],
        cartItemQty: json["CartItemQty"],
        isWishlisted: json["IsWishlisted"],
        isCarted: json["IsCarted"],
        isAvailPincode: json["IsAvailPincode"],
        isReviewCount: json["IsReviewCount"],
        reviewstatus: json["Reviewstatus"],
        isReviewAvgrating: json["IsReviewAvgrating"],
        productId: json["productId"],
        vendorid: json["vendorid"],
        prDate: json["prDate"] == null ? null : DateTime.parse(json["prDate"]),
        actDate: json["actDate"],
        prName: json["prName"],
        sku: json["sku"],
        unitPrice: json["unitPrice"],
        description: json["description"],
        shortDescription: json["shortDescription"],
        urlKey: json["urlKey"],
        metaTitle: json["metaTitle"],
        metaKeywords: json["metaKeywords"],
        metaDescription: json["metaDescription"],
        status: json["status"],
        qoh: json["qoh"],
        rank: json["rank"],
        availableFrom: json["availableFrom"],
        availableTo: json["availableTo"],
        suspendedDate: json["suspendedDate"],
        newDate: json["newDate"],
        delDate: json["delDate"],
        maxQtyInOrders: json["maxQtyInOrders"],
        soldQty: json["soldQty"],
        stockAvailability: json["stockAvailability"],
        backOrders: json["backOrders"],
        rol: json["rol"],
        roq: json["roq"],
        parentId: json["parentId"],
        specialPrice: json["specialPrice"],
        attributeSetId: json["attributeSetId"],
        pincodeSetId: json["pincodeSetId"],
        prWeight: json["prWeight"],
        taxClassId: json["taxClassId"],
        cessAmount: json["cessAmount"],
        featuredImage: json["featuredImage"],
        avgRating: json["avgRating"],
        reviewCount: json["reviewCount"],
        dealFrom: json["dealFrom"] == null ? null : DateTime.parse(json["dealFrom"]),
        dealTo: json["dealTo"] == null ? null : DateTime.parse(json["dealTo"]),
        erpRefNo: json["erpRefNo"],
        productType: json["productType"],
        variationJson: json["variationJson"],
        bsl: json["bsl"],
        prWeightMfactor: json["prWeightMfactor"],
        markupPercentage: json["markupPercentage"],
        productLabel: json["productLabel"],
        backgroundColorCode: json["backgroundColorCode"],
        isNew: json["isNew"],
        costPrice: json["costPrice"],
        erpCat: json["erpCat"],
        prwmf: json["prwmf"],
        cartItems: json["CartItems"] == null ? null : List<dynamic>.from(json["CartItems"].map((x) => x)),
        keywords: json["Keywords"] == null ? null : List<dynamic>.from(json["Keywords"].map((x) => x)),
        taxClass: json["TaxClass"],
        productCategories: json["ProductCategories"] == null ? null : List<dynamic>.from(json["ProductCategories"].map((x) => x)),
        productImages: json["ProductImages"] == null ? null : List<dynamic>.from(json["ProductImages"].map((x) => x)),
        productPincodes: json["ProductPincodes"] == null ? null : List<dynamic>.from(json["ProductPincodes"].map((x) => x)),
        vendor: json["Vendor"],
        productViews: json["ProductViews"] == null ? null : List<dynamic>.from(json["ProductViews"].map((x) => x)),
        reviews: json["Reviews"] == null ? null : List<dynamic>.from(json["Reviews"].map((x) => x)),
        saveForLaters: json["SaveForLaters"] == null ? null : List<dynamic>.from(json["SaveForLaters"].map((x) => x)),
        wishLists: json["WishLists"] == null ? null : List<dynamic>.from(json["WishLists"].map((x) => x)),
    );

}
