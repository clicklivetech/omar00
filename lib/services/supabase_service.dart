import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static const String supabaseUrl = 'https://vvjgjuvcbqnrzbjkcloa.supabase.co';
  static const String supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ2amdqdXZjYnFucnpiamtjbG9hIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxMjM0MjMsImV4cCI6MjA0ODY5OTQyM30.dAu01n_o4KOZ9L8W42U8Qd6XER4bH2SuXzwWZt09t7Q';
  
  static final SupabaseClient client = SupabaseClient(supabaseUrl, supabaseKey);
  
  // Authentication methods
  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    return await client.auth.signUp(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }

  // Database methods
  Future<List<Map<String, dynamic>>> getData(String tableName) async {
    final response = await client
        .from(tableName)
        .select();
    
    return response;
  }

  Future<void> insertData(String tableName, Map<String, dynamic> data) async {
    await client
        .from(tableName)
        .insert(data);
  }

  Future<void> updateData(
    String tableName,
    Map<String, dynamic> data,
    String columnId,
    dynamic value,
  ) async {
    await client
        .from(tableName)
        .update(data)
        .eq(columnId, value);
  }

  Future<void> deleteData(
    String tableName,
    String columnId,
    dynamic value,
  ) async {
    await client
        .from(tableName)
        .delete()
        .eq(columnId, value);
  }
}
