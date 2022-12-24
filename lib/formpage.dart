import 'package:flutter/material.dart';
import 'databaseHelper.dart';
import 'model.dart';



class FormPage extends StatelessWidget {
  final Note? note;
  const FormPage({
    Key? key,
    this.note
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final name = TextEditingController();
    final description = TextEditingController();


    if(note != null){
      name.text = note!.name;
      title.text = note!.title;
      description.text = note!.description;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text( note == null
            ? 'Add a note'
            : 'Edit note'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: TextFormField(
                controller: name,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'e.x John ',
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        )
                    )
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(bottom: 30.0),
            child: TextFormField(
              controller: title,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'e.x PPG',
                  labelText: 'Title',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )
                  )
              ),
            ),
            ),
            TextFormField(
              controller: description,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: 'e.x PPG',
                  labelText: 'Description',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )
                  )
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final names = name.value.text;
                      final titles = title.value.text;
                      final descriptions = description.value.text;

                      if (names.isEmpty || titles.isEmpty || descriptions.isEmpty) {
                        return;
                      }

                      final Note model = Note(name: names, title: titles, id: note?.id, description: descriptions);
                      if(note == null){
                        await DatabaseHelper.addNote(model);
                      }else{
                        await DatabaseHelper.updateNote(model);
                      }
                       Navigator.pop(context);

                    },
                    child: Text( note == null
                        ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
