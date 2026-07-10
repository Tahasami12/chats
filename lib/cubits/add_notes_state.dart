part of 'add_notes_cubits.dart';

abstract class AddNotesState {}

class NotesInitial extends AddNotesState {}
class AddNotesLoading extends AddNotesState {}
class AddNotesSuccess extends AddNotesState {}
class AddNotesFailure extends AddNotesState {
  final String err;

  AddNotesFailure(this.err);
}