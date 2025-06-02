class DiseaseModel {
  DiseaseModel({
    this.id,
    this.value,
    this.groupName,
    this.active,
    this.parentId,
  });

  int? id; // Make nullable if ID can be null
  String? value; // Make nullable if value can be null
  String? groupName; // Make nullable if groupName can be null
  bool? active; // Make nullable to handle missing data
  dynamic
      parentId; // `parentId` is left dynamic since it may vary, but it's nullable

  factory DiseaseModel.fromJson(Map<String, dynamic> json) => DiseaseModel(
        id: json["id"], // Can be null, but non-nullable if you use `?`
        value: json["value"], // Can be null
        groupName: json["groupName"], // Can be null
        active: json["active"], // Can be null, adjust accordingly
        parentId: json["parentId"], // Can be null, or it could be another type
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "groupName": groupName,
        "active": active,
        "parentId": parentId,
      };
}
