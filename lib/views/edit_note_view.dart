import 'package:flutter/material.dart';

import '../models/model_note.dart';
import '../widgets/body_edit_note_view.dart';


class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BodyEditNote(note: note),
    );
  }
}
