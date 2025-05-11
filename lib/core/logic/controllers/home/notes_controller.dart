import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/models/note_model.dart';

class NotesController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  String formattedCurrentDate = DateFormat.yMMMMd().format(DateTime.now());
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  List<NoteModel> notes = [];

  @override
  onInit() async {
    if (notes.isEmpty) notes = await fetchAllNotes();
    super.onInit();
  }

  Future<void> addNote(NoteModel note) async {
    try {
      final CollectionReference notesRef = FirebaseFirestore.instance
          .collection('users')
          .doc(CacheHelper.userBox.get(kuserToken))
          .collection('notes');
      //**Create Note ID**\\
      DocumentReference newNoteRef = notesRef.doc();
      note.id = newNoteRef.id;

      await notesRef.doc(note.id).set(note.toJson());
    } catch (e) {
      appSnackbar(
        title: 'Failed',
        message: 'check your internet connection',
        backgroundColor: ColorsManager.errorColor,
      );
    }
  }

  Color selectedColor = Colors.white;
  void selectNoteColor(Color color) {
    selectedColor = color;
    // emit(AddNoteColorSelected());
  }

  Future<List<NoteModel>> fetchAllNotes() async {
    final CollectionReference notesRef = FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.userBox.get(kuserToken))
        .collection('notes');

    QuerySnapshot snapshot = await notesRef.get();
    update();
    return snapshot.docs
        .map((doc) => NoteModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

//  late Color selectedColor;

  void editNoteColor(Color color) {
    selectedColor = color;
    //  emit(ChangeColorNoteState());
  }
}
