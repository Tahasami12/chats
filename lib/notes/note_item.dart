
import 'package:chats/cubits/notes_cubit.dart';
import 'package:chats/notes/edit_view.dart';
import 'package:chats/notes/models/note_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NoteItem extends StatelessWidget {
  const NoteItem(  {super.key, required this.note});

final NoteModels note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return  EditView(
          note: note,
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24,bottom: 24),
        decoration: BoxDecoration(color: Color(note.color),
        borderRadius:BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:
        [
          ListTile(
            title:  Text(note.title,style: TextStyle(color: Colors.black,
            fontSize: 26),),
            subtitle:  Padding(
              padding:  EdgeInsets.only(top: 16),
              child: Text(note.subTitle,style: TextStyle(color: Colors.black.withValues(alpha: .4),fontSize: 25),),
            ),
            trailing: IconButton(onPressed: (){
              note.delete();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            }, icon: Icon(Icons.delete,color: Colors.black,)),
      
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(note.date,style: TextStyle(color:Colors.black),),
          ),
        ]
          ,),
      ),
    );
  }
}
