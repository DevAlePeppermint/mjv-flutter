import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../entities/afazer_entity.dart';

class AfazerService {
  final _key = 'KEY_AFAZER';
  Future<void> salvar(List<AfazerEntity> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(item);
    await prefs.setString(_key, listJson);
  }

  Future<List<AfazerEntity>> buscar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? listJson = prefs.getString(_key);
    if (listJson != null) {
      return AfazerEntity.fromJsonList(jsonDecode(listJson));
    }
    return [];
  }
}