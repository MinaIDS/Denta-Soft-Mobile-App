class NoteModel {
  NoteModel({
    this.noteId,
    this.patientId,
    this.comments,
    this.createUserId,
    this.updateUserId,
    this.createdBy,
    this.creationDate,
  });

  String? noteId; // Nullable
  String? patientId; // Nullable
  String? comments; // Required
  String? createUserId; // Required
  dynamic updateUserId; // Nullable, as it's not always provided
  String? createdBy; // Required
  DateTime? creationDate; // Required

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        noteId: json["noteId"] as String?,
        patientId: json["patientId"] as String?,
        comments: json["comments"] as String,
        createUserId: json["createUserId"] as String,
        updateUserId: json["updateUserId"],
        createdBy: json["createdBy"] as String,
        creationDate: DateTime.parse(json["creationDate"] as String),
      );

  Map<String, dynamic> toJson() => {
        "noteId": noteId,
        "patientId": patientId,
        "comments": comments,
        "createUserId": createUserId,
        "updateUserId": updateUserId,
        "createdBy": createdBy,
        "creationDate": creationDate!.toIso8601String(),
      };
}
