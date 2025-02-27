import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../screens/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'VOTRE_URL_SUPABASE',
    anonKey: 'VOTRE_CLE_API_SUPABASE',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon App de Foot',
      home: AuthScreen(), // Écran d'authentification
    );
  }
}