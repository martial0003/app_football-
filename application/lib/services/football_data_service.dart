import 'dart:convert';
import 'package:http/http.dart' as http;

class FootballDataService {
  static final String apiKey = '//api.football-data.org/v4/matches';
  static final String baseUrl = 'https://api.football-data.org/v2';

  static Future<Map<String, dynamic>> getMatches(String teamName, String date) async {
    final response = await http.get(
      Uri.parse('$baseUrl/matches?dateFrom=$date&dateTo=$date'),
      headers: {'X-Auth-Token': apiKey},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur lors de la récupération des matchs');
    }
  }
}