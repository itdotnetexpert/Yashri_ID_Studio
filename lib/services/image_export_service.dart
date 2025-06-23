import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageExportService {
  static Future<String?> exportWidgetAsImage(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final dir = await getTemporaryDirectory();
      final filename = const Uuid().v4() + '.png';
      final path = '${dir.path}/$filename';
      final file = File(path);
      await file.writeAsBytes(pngBytes);

      return file.path;
    } catch (e) {
      print('Error exporting image: $e');
      return null;
    }
  }
}