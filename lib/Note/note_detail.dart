import 'package:flutter/material.dart';

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteDetail(),
    );
  }
}

class NoteDetail extends StatelessWidget {
  final TextEditingController _noteController = TextEditingController();

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
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Option 1"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Option 2"),
                value: 2,
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _noteController,
          maxLines: null,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration.collapsed(
            hintText: 'Do homework',
          ),
        ),
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
              onPressed: () {
                // Add camera functionality
              },
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
