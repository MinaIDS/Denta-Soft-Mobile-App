import 'package:flutter/material.dart';
import '../models/NoteModel.dart';
import '../services/NotesServices.dart';

class NoteController extends ChangeNotifier {
  List<NoteModel> notes = [];
  bool isLoading = false;
  TextEditingController noteController = TextEditingController();

  // Fetch the notes for a patient
  Future<List<NoteModel>> getNotes(String patientId) async {
    isLoading = true;
    notifyListeners(); // Notify listeners to update UI with loading state
    List<NoteModel> notes = [];
    try {
      notes = await NotesServices().getNotes(patientId);
    } catch (e) {
      // Handle error
      print("Error fetching notes: $e");
    } finally {
      isLoading = false;
      notifyListeners(); // Notify listeners after loading state changes
    }
    return notes;
  }

  // Save a new note for the patient
  Future<bool> saveNotes({NoteModel? note, String? patientId}) async {
    if (note == null || patientId == null) {
      // Ensure that we have valid data before proceeding
      print("Error: Note or patient ID is null");
      return false;
    }
    bool status = false;
    try {
      status = await NotesServices().saveNote(note: note, patientId: patientId);
    } catch (e) {
      // Handle error
      print("Error saving note: $e");
    }
    return status;
  }
}
