import 'dart:convert';

import '../models/NoteModel.dart';
import '../utils/GlobalData.dart';
import '../utils/api_routes.dart';
import 'GlobalHttp.dart';

class NotesServices {
  Future<List<NoteModel>> getNotes(String patientId) async {
    List<NoteModel> notes = [];
    try {
      GlobalHttpResponse response = await GlobalHttp.get(
        "${ApiRoutes.getNotes}?PatientId=$patientId",
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      print("noteResponse::${response.body!}");

      // OK 200
      if (response.statusCode == 200) {
        List<dynamic> object = jsonDecode(response.body!);
        for (var value in object) {
          notes.add((NoteModel.fromJson(value)));
        }
      }
      print("notesLength::${notes.length}");

      return notes;
    } catch (e) {
      print(e.toString());
      return notes;
    }
  }

  Future<bool> saveNote({
    required NoteModel note,
    required String patientId,
  }) async {
    Map<String, dynamic> jsonValues = <String, dynamic>{};

    jsonValues.addAll({
      "noteId": note.noteId ?? "",
      "patientId": patientId,
      "comments": note.comments ?? "",
      "createUserId": GlobalData.accountData!.objectData.userId,
      "updateUserId": GlobalData.accountData!.objectData.userId,
      "createdBy": note.createdBy ?? "",
      "creationDate": note.creationDate ?? "",
    });
    var body = jsonEncode(jsonValues);
    print("note request body::$body");
    try {
      GlobalHttpResponse response = await GlobalHttp.post(
        ApiRoutes.saveNotes,
        body: body,
        contentTypeHeader: "application/json",
        authorizationHeader: GlobalData.accountData!.token,
      );

      // OK 200
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
