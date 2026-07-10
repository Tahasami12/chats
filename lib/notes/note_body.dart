import 'package:chats/notes/note_bar.dart';
import 'package:chats/notes/note_list.dart';
import 'package:flutter/material.dart';



class NoteBody extends StatelessWidget {
  const NoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(

      children: [SizedBox(height: 50),
        NoteBar(
          title: "Note",
          icon: Icons.search,
        ),
       Expanded(
         child:
           NoteList(),

       ),
      ],
      ),
    );
  }
}
