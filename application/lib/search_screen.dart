import 'package:flutter/material.dart';
import '../services/football_data_service.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _teamController = TextEditingController();
  final _dateController = TextEditingController();
  Map<String, dynamic>? _matches;

  Future<void> _searchMatches() async {
    try {
      _matches = await FootballDataService.getMatches(
          _teamController.text, _dateController.text);
      setState(() {});
    } catch (e) {
      // Gérer les erreurs
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rechercher un match')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _teamController, decoration: InputDecoration(labelText: 'Équipe')),
            TextField(controller: _dateController, decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)')),
            ElevatedButton(onPressed: _searchMatches, child: Text('Rechercher')),
            if (_matches != null) Text(_matches.toString()), // Afficher les résultats
          ],
        ),
      ),
    );
  }
}