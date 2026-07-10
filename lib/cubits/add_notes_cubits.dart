

import "package:chats/notes/constants.dart";
import "package:chats/notes/models/note_models.dart";
import "package:flutter/material.dart";

import "package:flutter_bloc/flutter_bloc.dart";
import "package:hive/hive.dart";

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(NotesInitial());
  Color color = Colors.blue;
  addNote(NoteModels note) async{
    note.color = color.value;
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<NoteModels>(kNoteBox);
    
      await notesBox.add(note);
        emit(AddNotesSuccess()); 
    } catch(e){
      emit(AddNotesFailure(e.toString()));
    }
  }
}