import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/views/main/screens/home/my_notes/add_note_bottom_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 4.w,
        left: 4.w,
        bottom: 20.h,
      ),
      child: SingleChildScrollView(
        child: AddNoteBottomSheetForm(),
      ),
    );
  }
}
