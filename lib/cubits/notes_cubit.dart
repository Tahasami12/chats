import 'package:chats/notes/constants.dart';
import 'package:chats/notes/models/note_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModels> ?notes = [];

  fetchAllNotes() {
 
      var notesBox = Hive.box<NoteModels>(kNoteBox);
    
     notes = notesBox.values.toList();
     emit(NotesSuccess());
    
        
  }
}