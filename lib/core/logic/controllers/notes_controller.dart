import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/models/note_model.dart';

class NotesController extends GetxController {
  List<NoteModel> notes = [];

  @override
  void onInit() async {
    await fetchNotes();
    super.onInit();
  }

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  Future<void> fetchNotes() async {
    // Box<NoteModel> noteBox = Hive.box<NoteModel>(kNoteBox);
    // notes = noteBox.values.toList();
    update();
  }

  void editNoteColor(Color color) {
    // selectedColor = color;
    update();
  }

  // final GlobalKey<FormState> formKey = GlobalKey();
  // String formattedCurrentDate = DateFormat.yMMMMd().format(DateTime.now());
  // TextEditingController titleController = TextEditingController();
  // TextEditingController subTitleController = TextEditingController();
  // AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  void addNote(NoteModel noteModel) async {
    try {
      //  Box<NoteModel> noteBox = Hive.box<NoteModel>(kNoteBox);
      //  await noteBox.add(noteModel);
      update();
    } catch (e) {
      update();
    }
  }

  // deleteNote(int index) {
  //   notes.removeAt(index);
  //   update();
  //   saveNotes();
  // }

  // Future<void> saveNotes() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final List<String> notesStringList =
  //       notes.map((note) => note.toJson()).toList();
  //   prefs.setStringList('notes', notesStringList);
  // }
}
