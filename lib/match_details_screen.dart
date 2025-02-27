import 'package:flutter/material.dart';
import '../services/mistral_ai_service.dart';

class MatchDetailsScreen extends StatefulWidget {
  @override
  MatchDetailsScreenState createState() => MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  final _questionController = TextEditingController();
  String? _answer;

  Future<void> _askQuestion() async {
    try {
      _answer = await MistralAIService.askQuestion(_questionController.text);
      setState(() {});
    } catch (e) {
      // Gérer les erreurs
    }
  }
}