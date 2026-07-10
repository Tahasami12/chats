import 'package:chats/notes/edit_view.dart';
import 'package:chats/notes/models/note_models.dart';
import 'package:flutter/material.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key, required this.note});
final NoteModels note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: EditView(
        note: note,
      ),
    );
  }
}
