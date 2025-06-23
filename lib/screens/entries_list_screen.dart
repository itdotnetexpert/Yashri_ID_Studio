import 'package:flutter/material.dart';
import '../models/card_entry.dart';

class EntriesListScreen extends StatelessWidget {
  final List<CardEntry> mockEntries = [
    CardEntry(name: 'राम शर्मा', role: 'कार्यकर्ता', number: '001', imagePath: ''),
    CardEntry(name: 'सीमा देवी', role: 'सदस्य', number: '002', imagePath: ''),
    // Add more mock data or load from DB
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saved Entries')),
      body: mockEntries.isEmpty
          ? Center(child: Text('No entries found.'))
          : ListView.builder(
              itemCount: mockEntries.length,
              itemBuilder: (context, index) {
                final entry = mockEntries[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(entry.name[0])),
                  title: Text(entry.name),
                  subtitle: Text('${entry.role} • ${entry.number}'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('View/edit not yet implemented')),
                    );
                  },
                );
              },
            ),
    );
  }
}