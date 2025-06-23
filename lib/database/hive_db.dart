import 'package:hive/hive.dart';
import '../models/card_entry.dart';

class HiveDB {
  static const String boxName = 'card_entries';

  static Future<void> init() async {
    Hive.registerAdapter(CardEntryAdapter());
    await Hive.openBox<CardEntry>(boxName);
  }

  static Future<void> addEntry(CardEntry entry) async {
    final box = Hive.box<CardEntry>(boxName);
    await box.add(entry);
  }

  static List<CardEntry> getEntries() {
    final box = Hive.box<CardEntry>(boxName);
    return box.values.toList();
  }

  static Future<void> deleteEntry(int index) async {
    final box = Hive.box<CardEntry>(boxName);
    await box.deleteAt(index);
  }
}