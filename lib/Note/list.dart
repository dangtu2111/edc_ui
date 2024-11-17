import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(NoteListApp());
}

class NoteListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteListPage(),
    );
  }
}

class NoteListPage extends StatefulWidget {
  @override
  _NoteListPageState createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  List<Map<String, dynamic>> notes = [
    {'title': 'Do homework', 'isChecked': true},
    {'title': 'Take note of the formula', 'isChecked': false},
  ];
  List<File> images = []; // List to store selected images
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images.add(File(pickedFile.path)); // Add selected image to the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add back button functionality
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () {
              // Add undo functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.redo),
            onPressed: () {
              // Add redo functionality
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ...notes.map((note) {
            return ListTile(
              leading: Checkbox(
                value: note['isChecked'],
                onChanged: (bool? value) {
                  setState(() {
                    note['isChecked'] = value!;
                  });
                },
              ),
              title: Text(
                note['title'],
                style: TextStyle(
                  decoration: note['isChecked']
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: note['isChecked'] ? Colors.grey : Colors.black,
                ),
              ),
            );
          }).toList(),
          ...images.map((image) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(image),
            );
          }).toList(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.checklist),
              onPressed: () {
                // Add checklist functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: _pickImage, // Add image picking functionality here
            ),
            IconButton(
              icon: Icon(Icons.text_fields),
              onPressed: () {
                // Add text formatting functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Add edit functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
