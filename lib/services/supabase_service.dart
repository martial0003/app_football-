import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final _supabase = Supabase.instance.client;

  static Future<AuthResponse> signUp(String email, String password) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  static Future<AuthResponse> signIn(String email, String password) async {
    return await _supabase.auth.signInWithPassword(email: email, password: password);
  }

  static Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  static User? getCurrentUser() {
    return _supabase.auth.currentUser;
  }

  static Future<bool> signInWithGoogle() async {
    final googleRedirectUrl = 'YOUR_REDIRECT_URL'; // mettre votre URL de redirection
    return await _supabase.auth.signInWithOAuth(
      Provider.google,
      redirectTo: googleRedirectUrl,
    );
  }
}