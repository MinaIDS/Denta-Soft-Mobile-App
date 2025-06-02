class SearchProductModel {
  SearchProductModel({
    this.productEn,
    this.productAr,
    this.productId,
    this.patientId,
    this.pDieseasId,
    this.productIds,
  });

  String? productEn;
  String? productAr;
  int? productId;
  dynamic patientId;
  int? pDieseasId;
  String? productIds;

  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      SearchProductModel(
        productEn: json["productEn"],
        productAr: json["productAr"],
        productId: json["productId"],
        patientId: json["patientId"],
        pDieseasId: json["pDieseasId"],
        productIds: json["productIds"],
      );

  Map<String, dynamic> toJson() => {
        "productEn": productEn,
        "productAr": productAr,
        "productId": productId,
        "patientId": patientId,
        "pDieseasId": pDieseasId,
        "productIds": productIds,
      };
}
