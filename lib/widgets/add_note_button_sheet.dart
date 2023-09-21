import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit_add_note/add_notes_cubit.dart';
import '../cubits/cubit_add_note/add_notes_state.dart';
import '../cubits/cubit_note/notes_cubit.dart';
import 'add-note_form.dart';


class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesFailture) {
            print('failied ${state.messageError}');
          }
          if (state is AddNotesSuccess) {
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).fetchAllNote();
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: 8,
                top: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
   
  }
}
