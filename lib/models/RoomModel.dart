class RoomModel {
  String roomId;
  bool active;
  String createUserId;
  String updateUserId;
  String roomName;
  String branchId;
  String clinicId;
  String roomColor;
  String workingHours;
  String workingDays;
  String doctorId;
  String doctorColor;
  String branchName;
  String doctorName;

  // Constructor with default values for all fields
  RoomModel({
    required this.roomId,
    required this.active,
    required this.createUserId,
    required this.updateUserId,
    required this.roomName,
    required this.branchId,
    required this.clinicId,
    required this.roomColor,
    required this.workingHours,
    required this.workingDays,
    required this.doctorId,
    required this.doctorColor,
    required this.branchName,
    required this.doctorName,
  });

  // Constructor for parsing from JSON
  RoomModel.fromJson(Map<String, dynamic> json)
      : roomId = json['roomId'] ?? '',
        active = json['active'] ?? false,
        createUserId = json['createUserId'] ?? '',
        updateUserId = json['updateUserId'] ?? '',
        roomName = json['roomName'] ?? '',
        branchId = json['branchId'] ?? '',
        clinicId = json['clinicId'] ?? '',
        roomColor = json['roomColor'] ?? '',
        workingHours = json['workingHours'] ?? '',
        workingDays = json['workingDays'] ?? '',
        doctorId = json['doctorId'] ?? '',
        doctorColor = json['doctorColor'] ?? '',
        branchName = json['branchName'] ?? '',
        doctorName = json['doctorName'] ?? '';

  // Method to convert the object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'active': active,
      'createUserId': createUserId,
      'updateUserId': updateUserId,
      'roomName': roomName,
      'branchId': branchId,
      'clinicId': clinicId,
      'roomColor': roomColor,
      'workingHours': workingHours,
      'workingDays': workingDays,
      'doctorId': doctorId,
      'doctorColor': doctorColor,
      'branchName': branchName,
      'doctorName': doctorName,
    };
  }
}
