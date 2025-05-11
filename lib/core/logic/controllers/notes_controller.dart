import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lab_nerd/models/note_model.dart';

class NotesController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  String formattedCurrentDate = DateFormat.yMMMMd().format(DateTime.now());
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  void addNote(NoteModel noteModel) async {
    try {
      // Box<NoteModel> noteBox = Hive.box<NoteModel>(kNoteBox);
      //await noteBox.add(noteModel);
      //emit(AddNoteSuccess());
    } catch (e) {
      // emit(AddNoteFailure(errMessage: e.toString()));
    }
  }

  Color selectedColor = Colors.white;
  void selectNoteColor(Color color) {
    selectedColor = color;
    // emit(AddNoteColorSelected());
  }

  List<NoteModel> notes = [];

  void fetchNotes() {
    // Box<NoteModel> noteBox = Hive.box<NoteModel>(kNoteBox);
    //notes = noteBox.values.toList();
    //emit(ChangeColorNoteState());
  }

//  late Color selectedColor;

  void editNoteColor(Color color) {
    selectedColor = color;
    //  emit(ChangeColorNoteState());
  }
}
