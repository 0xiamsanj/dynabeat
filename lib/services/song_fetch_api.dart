import 'package:dynabeat/model/music_data_model.dart';
import 'package:dynabeat/model/result_data_model.dart';
import 'package:http/http.dart' as http;

class SongFetch {
  static var client = http.Client();

  static Future<List<MusicData>> fetchSong(String query) async {
    var uri = "https://dynabeat.up.railway.app/song?query=$query";
    var url = Uri.parse(uri);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var res = response.body;
      return musicDataFromJson(res);
    } else {
      return musicDataFromJson("");
    }
  }

  static Future<List<ResultData>> fetchAlbum(String query) async {
    var uri = "https://dynabeat.up.railway.app/result?query=$query";
    var url = Uri.parse(uri);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var res = response.body;
      return resultDataFromJson(res);
    } else {
      return resultDataFromJson("");
    }
  }
}
