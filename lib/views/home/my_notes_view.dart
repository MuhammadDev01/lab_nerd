import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/utils/app_images.dart';
import 'package:lab_nerd/widgets/arrow_back_widget.dart';
import 'package:lab_nerd/widgets/default_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyNotesView extends StatefulWidget {
  const MyNotesView({super.key});

  @override
  State<MyNotesView> createState() => _MyNotesViewState();
}

class _MyNotesViewState extends State<MyNotesView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  List<Note> _notes = [];
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? notesStringList = prefs.getStringList('notes');
    if (notesStringList != null) {
      setState(() {
        _notes = notesStringList
            .map((noteString) => Note.fromJson(noteString))
            .toList();
      });
    }
  }

  Future<void> _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> notesStringList =
        _notes.map((note) => note.toJson()).toList();
    prefs.setStringList('notes', notesStringList);
  }

  void _addNote() {
    final String title = _titleController.text;
    final String content = _contentController.text;
    if (title.isNotEmpty && content.isNotEmpty) {
      setState(() {
        _notes.add(Note(
          title: title,
          content: content,
        ));
      });
      _titleController.clear();
      _contentController.clear();
      _saveNotes();
    }
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
    _saveNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              Assets.background_2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  DefaultTextFormField(
                    controller: _titleController,
                    hintText: 'Enter title',
                    textInputType: TextInputType.text,
                    helperText: 'Title',
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    flex: 10,
                    child: DefaultTextFormField(
                        controller: _contentController,
                        minLines: 8,
                        contentPadding: const EdgeInsets.all(8),
                        maxLines: null,
                        hintText: 'Enter content',
                        textInputType: TextInputType.text,
                        helperText: 'Content'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _addNote();
                      }
                    },
                    child: Text(
                      'Add Note',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 16,
                            fontFamily: fontInter,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                        itemCount: _notes.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(_notes[index].title),
                              subtitle: Text(_notes[index].content),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red[700],
                                ),
                                onPressed: () => _deleteNote(index),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 8),
            child: ArrowbackWidget(
              background: Colors.transparent,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class Note {
  String title;
  String content;

  Note({
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  static Note fromJson(String source) => fromMap(json.decode(source));
}
