import 'package:flutter/material.dart';
import '../../services/football_data_service.dart';
import '../../models/match.dart'; // Créez ce modèle
import '../../services/supabase_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Match> _matches = [];

  @override
  void initState() {
    super.initState();
    _loadMatches();
  }

  Future<void> _loadMatches() async {
    try {
      // Récupérer les matchs récents de Ligue 1
      final matchesData = await FootballDataService.getMatches('Ligue 1', '2023-01-01'); // Exemple
      setState(() {
        _matches = (matchesData['matches'] as List).map((match) => Match.fromJson(match)).toList();
      });
    } catch (e) {
      // Gérer les erreurs
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Matchs de Ligue 1')),
      body: ListView.builder(
        itemCount: _matches.length,
        itemBuilder: (context, index) {
          final match = _matches[index];
          return ListTile(
            title: Text('${match.homeTeam} vs ${match.awayTeam}'),
            subtitle: Text(match.date),
            // Ajouter d'autres détails
          );
        },
      ),
    );
  }
}