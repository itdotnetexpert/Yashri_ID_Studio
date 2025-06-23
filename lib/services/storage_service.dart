import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  static Future<String> saveImage(File imageFile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = const Uuid().v4() + '.jpg';
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    return savedImage.path;
  }

  static Future<List<File>> listSavedImages() async {
    final appDir = await getApplicationDocumentsDirectory();
    final files = Directory(appDir.path)
        .listSync()
        .whereType<File>()
        .where((file) => file.path.endsWith('.jpg'))
        .toList();
    return files;
  }

  static Future<void> deleteImage(String path) async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }
}