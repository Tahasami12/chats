 import 'package:chats/cubits/notes_cubit.dart';
import 'package:chats/notes/colors_list_view.dart';
import 'package:chats/notes/constants.dart';
import 'package:chats/notes/customtext.dart';
import 'package:chats/notes/models/note_models.dart';
import 'package:chats/notes/note_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditView extends StatefulWidget {
  const EditView({super.key, required this.note});
  final NoteModels note;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
 String? title , content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            NoteBar(
              onPressed: () {
            widget.note.title = title??widget.note.title;
            widget.note.subTitle = content??widget.note.subTitle;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
              },
              title: "Edit Note",
              icon: Icons.check,
            ),
            SizedBox(
              height: 50,
            ),
            Customtext(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title,),
            SizedBox(
              height: 16,
            ),
            Customtext(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.subTitle,maxLines: 5,),
              SizedBox(
              height: 16,
            ),

             EditNoteColorsListView(
              note: widget.note,
             ),
          ],
        ),
      ),
    );
  }
}
class EditNoteColorsListView extends StatefulWidget {
  const EditNoteColorsListView({super.key, required this.note});
final NoteModels note;
  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {
  late int currentIndex ;
  @override
  void initState() {
    super.initState();
   currentIndex = KColors.indexWhere(
  (color) => color.value == widget.note.color,
);
    
  }
    @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.builder(
        itemCount: KColors.length,
        scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
            widget.note.color = KColors[index].value;
            setState(() {
                
              }); 
            
              
            },
            child: ColorItem( isActive : currentIndex == index, color: KColors[index])),
        );
      })
    );
  }
}
