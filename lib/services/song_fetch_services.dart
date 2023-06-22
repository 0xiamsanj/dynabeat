import 'package:dynabeat/model/music_data_model.dart';
import 'package:http/http.dart' as http;

class SongFetch {
  static var client = http.Client();

  static Future<List<MusicData>> fetchSong(String query) async {
    var uri = "https://music-api-qpr2.onrender.com/song/?query=$query";
    var url = Uri.parse(uri);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var res = response.body;
      return musicDataFromJson(res);
    } else {
      return musicDataFromJson("");
    }
  }
}
