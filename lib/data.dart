import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

List<Map<String, String>> diaryEntries = [];

Future<File> getFile() async {
  final dir = await getApplicationDocumentsDirectory();
  return File('${dir.path}/entries.txt');
}

Future<void> loadEntries() async {
  final file = await getFile();
  if (!await file.exists()) return;
  final lines = (await file.readAsString()).split('\n');
  diaryEntries = lines.where((line) => line.isNotEmpty).map((line) {
    final parts = line.split('|||');
    final cipherBytes = base64Decode(parts[1]);
    return {
      'heading': parts[0],
      'cipherText': String.fromCharCodes(cipherBytes),
      'key': parts[2],
    };
  }).toList();
}

Future<void> saveEntries() async {
  final file = await getFile();
  final lines = diaryEntries.map((e) {
    final cipherBase64 = base64Encode(e['cipherText']!.codeUnits);
    return '${e['heading']}|||$cipherBase64|||${e['key']}';
  }).join('\n');
  await file.writeAsString(lines);
}