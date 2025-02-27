import 'package:flutter/material.dart';
import "../services/supabase_service.dart";
import 'home_screen.dart'; // Importation de l'écran d'accueil

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false; // Ajout de l'indicateur de chargement

  Future<void> _signUp() async {
    setState(() => _isLoading = true); // Début du chargement
    try {
      await SupabaseService.signUp(
          _emailController.text, _passwordController.text);
      // Rediriger vers l'écran principal
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      // Gérer les erreurs
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'inscription : $e')),
      );
    } finally {
      setState(() => _isLoading = false); // Fin du chargement
    }
  }

  Future<void> _signIn() async {
    setState(() => _isLoading = true); // Début du chargement
    try {
      await SupabaseService.signIn(
          _emailController.text, _passwordController.text);
      // Rediriger vers l'écran principal
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      // Gérer les erreurs
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la connexion : $e')),
      );
    } finally {
      setState(() => _isLoading = false); // Fin du chargement
    }
  }

  Future<void> _signInWithGoogle() async {
    setState(() => _isLoading = true); // Début du chargement
    try {
      await SupabaseService.signInWithGoogle();
      // Rediriger vers l'écran principal
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      // Gérer les erreurs
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la connexion avec Google : $e')),
      );
    } finally {
      setState(() => _isLoading = false); // Fin du chargement
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Authentification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email')),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscuringCharacter: '*',
            ),
            ElevatedButton(
                onPressed: _isLoading ? null : _signUp, // Désactiver pendant le chargement
                child: Text('Inscription')),
            ElevatedButton(
                onPressed: _isLoading ? null : _signIn, // Désactiver pendant le chargement
                child: Text('Connexion')),
            ElevatedButton(
                onPressed: _isLoading ? null : _signInWithGoogle, // Désactiver pendant le chargement
                child: Text('Connexion avec Google')),
            if (_isLoading) CircularProgressIndicator(), // Afficher l'indicateur de chargement
          ],
        ),
      ),
    );
  }
}
