import 'dart:convert';
import 'package:http/http.dart' as http;

class MistralAIService {
  static final String apiKey = 'wiJkiDE9kt9c0SkNc6HuBqLaPO0jjRfN';
  static final String baseUrl = 'https://api.mistral.ai/v1/chat/completions';

  static Future<String> askQuestion(String question) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'mistral-tiny',
        'messages': [
          {'role': 'user', 'content': question}
        ],
      }),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Erreur lors de la requête à Mistral AI');
    }
  }
}