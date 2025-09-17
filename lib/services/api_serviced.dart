import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_app/models/music_model.dart';

class ApiService {
  Future<List<PlayListModel>> getAllPlayList() async {
    List<int> playlistIds = [
      248297032,
      751764391,
      932386265,
      959141815,
      1036183001,
      1126774471,
      1282495565,
      1295010615,
      1311397405,
      1386209585,
      1479458365,
      1601999415,
    ];

    List<PlayListModel> playlists = [];

    for (var id in playlistIds) {
      final response = await http.get(
        Uri.parse('https://api.deezer.com/playlist/$id'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        playlists.add(PlayListModel.fromMap(jsonData));
      }
    }

    return playlists;
  }
}
