import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageService {
  static Future<void> saveMatches(List<Map<String, dynamic>> matches) async {
    final prefs = await SharedPreferences.getInstance();
    final matchesJson = matches.map((match) => jsonEncode(match)).toList();
    await prefs.setStringList('matches', matchesJson);
  }

  static Future<List<Map<String, dynamic>>> getSavedMatches() async {
    final prefs = await SharedPreferences.getInstance();
    final matchesJson = prefs.getStringList('matches') ?? [];
    return matchesJson.map((matchJson) => jsonDecode(matchJson)).toList();
  }

  static Future<void> deleteSavedMatches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('matches');
  }
}