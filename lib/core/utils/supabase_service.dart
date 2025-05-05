import 'dart:developer';

import 'package:ev_charging/core/utils/supabase_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initSupabase() async {
    await Supabase.initialize(
      url: SupabaseKeys.supabaseUrl,
      anonKey: SupabaseKeys.supabaseAnonKey,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(
      {required String tableName}) async {
    var supabase = Supabase.instance.client;
    var response = await supabase.from(tableName).select('*');
    log('response: $response');
    return response;
  }

  static Future<void> addData(
      {required String tableName, required Map<String, dynamic> data}) async {
    var supabase = Supabase.instance.client;
    await supabase.from(tableName).insert(data);
  }

  static Future<void> updateData(
      {required String tableName,
      required Map<String, dynamic> data,
      required String id}) async {
    var supabase = Supabase.instance.client;
    await supabase.from(tableName).update(data).eq('Id', id);
  }

  static Future<void> deleteData(
      {required String tableName, required String id}) async {
    var supabase = Supabase.instance.client;
    await supabase.from(tableName).delete().match({'Id': id});
  }
}
