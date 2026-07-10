import 'package:chats/cubits/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_note.dart';
import 'note_body.dart';

class Note extends StatelessWidget {
  const Note({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FilledButton(onPressed: (){showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context, builder: (context)
      {
        return AddNote();
      });
        },
          child:Icon(Icons.add)),
      body: NoteBody(),
    
    
    
    );
  }
}




