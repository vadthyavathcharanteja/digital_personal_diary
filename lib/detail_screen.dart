import 'package:flutter/material.dart';
import 'xor_helper.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, String> entry;
  DetailScreen({super.key, required this.entry});

  final keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(entry['heading']!)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Encrypted:\n\n${entry['cipherText']}'),
            const SizedBox(height: 20),
            TextField(
              controller: keyController,
              decoration: const InputDecoration(labelText: 'Enter key to decrypt'),
            ),
            ElevatedButton(
              onPressed: () {
                String result = xorCrypt(entry['cipherText']!, keyController.text);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Decrypted content'),
                    content: Text(result),
                  ),
                );
              },
              child: const Text('Decrypt'),
            ),
          ],
        ),
      ),
    );
  }
}