import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'screens/auth_screen.dart';
import 'services/supabase_service.dart';
import 'theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://lacsaixabptilhoaatdi.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxhY3NhaXhhYnB0aWxob2FhdGRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA1NzUwMTMsImV4cCI6MjA1NjE1MTAxM30.eCI7YKlBLcSuURC4_u9FhItB9QbE2V0o_CuZgawh-Dc',
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Mon App de Foot',
          themeMode: themeProvider.themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: _getLandingPage(),
        );
      },
    );
  }

  Widget _getLandingPage() {
    if (SupabaseService.getCurrentUser() != null) {
      return HomeScreen();
    } else {
      return AuthScreen();
    }
  }
}