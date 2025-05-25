import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lab_nerd/widgets/constant.dart';
import 'package:lab_nerd/core/helper/cache_helper.dart';
import 'package:lab_nerd/core/helper/componants.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/models/note_model.dart';

class NotesController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  String formattedCurrentDate = DateFormat.yMMMMd().format(DateTime.now());
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  List<NoteModel>? notes;

  @override
  onInit() async {
    await fetchAllNotes();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }

  RxBool isLoading = false.obs;

  Future<void> addNote() async {
    isLoading(true);
    try {
      final CollectionReference notesRef = FirebaseFirestore.instance
          .collection('users')
          .doc(CacheHelper.userBox.get(kuserToken))
          .collection('notes');

      final newNote = NoteModel(
        title: titleController.text.trim(),
        content: contentController.text.trim(),
        createdAt: formattedCurrentDate,
        backgroundColor: selectedColor.toARGB32(),
        id: notesRef.doc().id,
      );

      await notesRef.doc(newNote.id).set(newNote.toJson());
      await fetchAllNotes();
      titleController.clear();
      contentController.clear();
      update();
    } catch (e) {
      appSnackbar(
        title: 'Failed',
        message: 'check your internet connection',
        backgroundColor: ColorsManager.errorColor,
      );
    }
    isLoading(false);
  }

  Color selectedColor = Colors.white;
  void selectNoteColor(Color color) {
    selectedColor = color;
    update();
  }

  Future<void> fetchAllNotes() async {
    final notesRef = FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.userBox.get(kuserToken))
        .collection('notes');

    final QuerySnapshot<Map<String, dynamic>> snapshot = await notesRef.get();
    notes = snapshot.docs.map((doc) => NoteModel.fromJson(doc.data())).toList();
    update();
  }

  Future<void> updateNote(String noteID) async {
    isLoading(true);

    final note = NoteModel(
      title: titleController.text.trim(),
      content: contentController.text.trim(),
      createdAt: formattedCurrentDate,
      backgroundColor: selectedColor.toARGB32(),
      id: noteID,
    );
    try {
      final DocumentReference noteRef = FirebaseFirestore.instance
          .collection('users')
          .doc(CacheHelper.userBox.get(kuserToken))
          .collection('notes')
          .doc(noteID);

      await noteRef.update(note.toJson());
      await fetchAllNotes();
      titleController.clear();
      contentController.clear();
      Get.back();
    } catch (e) {
      appSnackbar(
        title: 'Failed',
        message: 'check your internet connection',
        backgroundColor: ColorsManager.errorColor,
      );
    }
    isLoading(false);
    update();
  }

  Future<void> deleteNote(String noteID) async {
    try {
      final DocumentReference noteRef = FirebaseFirestore.instance
          .collection('users')
          .doc(CacheHelper.userBox.get(kuserToken))
          .collection('notes')
          .doc(noteID);

      await noteRef.delete();
      Get.back();
      await fetchAllNotes();
    } catch (e) {
      appSnackbar(
        title: 'Failed',
        message: 'check your internet connection',
        backgroundColor: ColorsManager.errorColor,
      );
    }
  }
}
