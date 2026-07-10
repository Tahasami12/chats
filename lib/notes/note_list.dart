
import 'package:chats/cubits/notes_cubit.dart';
import 'package:chats/notes/models/note_models.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'note_item.dart';
class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
      List<NoteModels> notes =BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount:notes.length,
              padding: EdgeInsets.zero,
            itemBuilder: (context,index){
        return Padding(
          padding:  EdgeInsets.symmetric(vertical: 8),
          child:  NoteItem(
             note :notes[index],
          ),
        );
          }),
      );

  
  },
  );
}
}
