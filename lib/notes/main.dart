
import 'package:chats/cubits/notes_cubit.dart';
import 'package:chats/notes/constants.dart';
import 'package:chats/notes/models/note_models.dart';
import 'package:chats/notes/note.dart';
import 'package:chats/notes/simpie_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
void main() async{
  await Hive.initFlutter();
  Bloc.observer =SimpieBloc();
 Hive.registerAdapter(NoteModelsAdapter());
  await Hive.openBox<NoteModels>(kNoteBox);
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => NotesCubit()..fetchAllNotes(),
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
      
        home:const Note(),
      ),
    );
  }
}

