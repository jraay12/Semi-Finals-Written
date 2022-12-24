import 'package:flutter/material.dart';

import 'model.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const NoteWidget(
      {Key? key,
        required this.note,
        required this.onTap,
        required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    note.name,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                ListTile(
                  title: const Text('TITLE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  subtitle: Text(note.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.blue)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                ListTile(
                  title: Text("DESCRIPTION", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  subtitle: Text(note.description,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.blue)),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}