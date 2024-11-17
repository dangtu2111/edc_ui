import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<NoteItem> notes = [
    NoteItem(title: "Educhain's Note", description: "Lorem ipsum is placeholder text commonly used in the graphic...", selected: false),
    NoteItem(title: "TODOLIST", description: "Lorem ipsum is placeholder text commonly used in the graphic...", selected: false),
    NoteItem(title: "Tasks", description: "Lorem ipsum is placeholder text commonly used in the graphic...", selected: false),
    NoteItem(title: "Schedule", description: "Lorem ipsum is placeholder text commonly used in the graphic...", selected: false),
    NoteItem(title: "Note", description: "Lorem ipsum is placeholder text commonly used in the graphic...", selected: false),
    NoteItem(title: "TODOLIST", description: "Lorem ipsum is placeholder text commonly used in the graphic...", selected: false),
  ];

  bool selectionMode = false;

  void toggleSelectionMode() {
    setState(() {
      selectionMode = !selectionMode;
      if (!selectionMode) {
        for (var note in notes) {
          note.selected = false;
        }
      }
    });
  }

  void toggleNoteSelection(NoteItem note) {
    setState(() {
      note.selected = !note.selected;
    });
  }

  void deleteSelectedNotes() {
    setState(() {
      notes.removeWhere((note) => note.selected);
      if (notes.where((note) => note.selected).isEmpty) {
        selectionMode = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = notes.where((note) => note.selected).length;

    return Scaffold(
      appBar: AppBar(
        leading: selectionMode
            ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: toggleSelectionMode,
        )
            : null,
        title: selectionMode
            ? Text('Selected $selectedCount')
            : Text('Take Note'),
        actions: [
          if (selectionMode)
            TextButton(
              onPressed: toggleSelectionMode,
              child: Text('Done', style: TextStyle(color: Colors.black)),
            ),
          if (!selectionMode)
            IconButton(
              icon: Icon(Icons.more_horiz), // used to selection
              onPressed: toggleSelectionMode,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Note list with selection mode
            Expanded(
              child: ListView(
                children: [
                  NoteSection(
                    title: 'This month',
                    notes: notes.take(2).toList(),
                    selectionMode: selectionMode,
                    onNoteSelected: toggleNoteSelection,
                  ),
                  NoteSection(
                    title: 'July',
                    notes: notes.skip(2).toList(),
                    selectionMode: selectionMode,
                    onNoteSelected: toggleNoteSelection,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${notes.length} notes',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.black),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteSection extends StatelessWidget {
  final String title;
  final List<NoteItem> notes;
  final bool selectionMode;
  final Function(NoteItem) onNoteSelected;

  NoteSection({
    required this.title,
    required this.notes,
    required this.selectionMode,
    required this.onNoteSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 20,
              color: Colors.green,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Column(
          children: notes
              .map((note) => GestureDetector(
            onTap: () {
              if (selectionMode) {
                onNoteSelected(note);
              }
            },
            child: NoteTile(
              note: note,
              selectionMode: selectionMode,
            ),
          ))
              .toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class NoteTile extends StatelessWidget {
  final NoteItem note;
  final bool selectionMode;

  NoteTile({required this.note, required this.selectionMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: selectionMode
              ? Icon(
            note.selected ? Icons.check_circle : Icons.radio_button_unchecked,
            color: note.selected ? Colors.blue : Colors.grey,
          )
              : null,
          title: Text(
            note.title,
            style: TextStyle(
              color: note.selected ? Colors.blue : Colors.black,
            ),
          ),
          subtitle: Text(
            note.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Divider(),
      ],
    );
  }
}

class NoteItem {
  final String title;
  final String description;
  bool selected;

  NoteItem({required this.title, required this.description, this.selected = false});
}