import 'package:chats/notes/note_icon.dart';
import 'package:flutter/material.dart';

class NoteBar extends StatelessWidget {
  const NoteBar({super.key, required this.title, required this.icon, this.onPressed});
final String title;
final IconData icon;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title ,style: TextStyle(fontSize: 18),),
        Spacer(),
        NoteIcon(
          onPressed: onPressed,
          icon: icon,
        )
      ],
    );
  }
}