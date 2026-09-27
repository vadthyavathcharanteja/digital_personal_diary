import 'package:flutter/material.dart';
import 'data.dart';
import 'xor_helper.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headingController = TextEditingController();
    final contentController = TextEditingController();
    final keyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('New Entry')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: headingController,
              decoration: const InputDecoration(labelText: 'Heading'),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            TextField(
              controller: keyController,
              decoration: const InputDecoration(labelText: 'Key'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                diaryEntries.add({
                  'heading': headingController.text,
                  'cipherText': xorCrypt(contentController.text, keyController.text),
                  'key': keyController.text,
                });
                await saveEntries();
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}