

import 'package:chats/cubits/add_notes_cubits.dart';
import 'package:chats/notes/colors_list_view.dart';
import 'package:chats/notes/custom_button.dart';
import 'package:chats/notes/customtext.dart';
import 'package:chats/notes/models/note_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode= AutovalidateMode.disabled;
  String ? title , subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(children: [
        SizedBox(height: 32),
      
      Customtext(
        onSaved:(value){
          title =value;

        } ,
        hint: "title",
      ),SizedBox(height: 16,),
      Customtext(
        onSaved:(value){
          subTitle =value;

        } ,
        hint: "content",
      maxLines: 5,),
      SizedBox(
          height: 32,
        ),
      ColorListView(),
        SizedBox(
            height: 32),
        BlocBuilder<AddNotesCubit, AddNotesState>(
          builder: (context, state) {
            return ContomButton(
              isLoading: state is AddNotesLoading ? true : false,
              onTap: (){
                if(formKey.currentState !.validate()){
                  formKey.currentState!.save();
                  var currenDate = DateTime.now();
                  var formattedDate =DateFormat('dd MMM yyyy').format(currenDate);
                  var note = NoteModels(title: title!, subTitle: subTitle!, date: formattedDate, color: Colors.blue.value);
                BlocProvider.of<AddNotesCubit>(context).addNote(note);
              } else {autovalidateMode=AutovalidateMode.always;
              setState(() {
                
              });
          
                }
              },
            );
          },  
          ),
      
        
        SizedBox(
          height: 18,
        ),
      
      ],
    
      ),
    );
  }
}