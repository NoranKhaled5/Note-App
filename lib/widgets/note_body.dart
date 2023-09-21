import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit_note/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'custom_list_view.dart';


class CustomBody extends StatefulWidget {
  const CustomBody({super.key});

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          CustomAppBar(
            text: 'Notes',
            icon: Icons.search,
          ),
          Expanded(child: CustomListView()),
        ]),
      ),
    );
  }
}
