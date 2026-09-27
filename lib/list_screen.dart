import 'package:flutter/material.dart';
import 'data.dart';
import 'add_screen.dart';
import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  void openAddScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddScreen()))
        .then((_) => setState(() {}));
  }

  void openEntry(Map<String, String> entry) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(entry: entry)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Diary')),
      body: ListView.builder(
        itemCount: diaryEntries.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(diaryEntries[index]['heading']!),
          onTap: () => openEntry(diaryEntries[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddScreen,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}