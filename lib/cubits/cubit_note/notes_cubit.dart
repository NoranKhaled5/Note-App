import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../models/model_note.dart';
import '../../widgets/constWidget.dart';
import 'notes_state.dart';


class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? note;
  fetchAllNote() {
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    note = noteBox.values.toList();
    emit(NotesSuccess());
  }
}
