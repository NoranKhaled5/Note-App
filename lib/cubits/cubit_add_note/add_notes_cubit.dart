import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/model_note.dart';
import '../../widgets/constWidget.dart';
import 'add_notes_state.dart';


class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color color = kColor;
  addNotes(NoteModel note) async {
    note.color = color.value;
    emit(AddNotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);

      await noteBox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailture(messageError: e.toString()));
    }
  }
}
