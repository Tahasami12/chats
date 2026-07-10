import 'package:chats/notes/constants.dart';
import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  const Customtext({super.key, required this.hint, this.maxLines = 1, this.onSaved, this.onChanged});

  final String hint;
  final int maxLines;
final void Function(String?)? onSaved;
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged, 
      onSaved:onSaved ,
      validator: (value){
        if(value?.isEmpty ?? true){
          return"field is re";
        } else{
          return null;
        }
      },

      cursorColor: kprimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              color: kprimaryColor
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kprimaryColor)


      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8,
      ),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}


