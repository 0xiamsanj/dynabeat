// To parse this JSON data, do
//
//     final resultData = resultDataFromJson(jsonString);

import 'dart:convert';

List<ResultData> resultDataFromJson(String str) =>
    List<ResultData>.from(json.decode(str).map((x) => ResultData.fromJson(x)));
String resultDataToJson(ResultData data) => json.encode(data.toJson());

class ResultData {
  ResultData({
    this.the320Kbps,
    this.album,
    this.albumUrl,
    this.albumid,
    this.cacheState,
    this.copyrightText,
    this.disabled,
    this.disabledText,
    this.duration,
    this.encryptedMediaPath,
    this.encryptedMediaUrl,
    this.explicitContent,
    this.featuredArtists,
    this.featuredArtistsId,
    this.hasLyrics,
    this.id,
    this.image,
    this.isDolbyContent,
    this.isRingtoneAvailable,
    this.label,
    this.labelUrl,
    this.language,
    this.lyrics,
    this.lyricsSnippet,
    this.mediaPreviewUrl,
    this.mediaUrl,
    this.music,
    this.musicId,
    this.origin,
    this.permaUrl,
    this.playCount,
    this.primaryArtists,
    this.primaryArtistsId,
    this.releaseDate,
    this.singers,
    this.song,
    this.starred,
    this.starring,
    this.trillerAvailable,
    this.vcode,
    this.vlink,
    this.webp,
    this.year,
  });

  String? the320Kbps;
  String? album;
  String? albumUrl;
  String? albumid;
  String? cacheState;
  String? copyrightText;
  String? disabled;
  String? disabledText;
  String? duration;
  String? encryptedMediaPath;
  String? encryptedMediaUrl;
  int? explicitContent;
  String? featuredArtists;
  String? featuredArtistsId;
  String? hasLyrics;
  String? id;
  String? image;
  bool? isDolbyContent;
  bool? isRingtoneAvailable;
  String? label;
  String? labelUrl;
  String? language;
  String? lyrics;
  String? lyricsSnippet;
  String? mediaPreviewUrl;
  String? mediaUrl;
  String? music;
  String? musicId;
  String? origin;
  String? permaUrl;
  int? playCount;
  String? primaryArtists;
  String? primaryArtistsId;
  DateTime? releaseDate;
  String? singers;
  String? song;
  String? starred;
  String? starring;
  bool? trillerAvailable;
  String? vcode;
  String? vlink;
  bool? webp;
  String? year;

  ResultData.fromJson(Map<String, dynamic> json) {
    the320Kbps = json["320kbps"];
    album = json["album"];
    albumUrl = json["album_url"];
    albumid = json["albumid"];
    cacheState = json["cache_state"];
    copyrightText = json["copyright_text"];
    disabled = json["disabled"];
    disabledText = json["disabled_text"];
    duration = json["duration"];
    encryptedMediaPath = json["encrypted_media_path"];
    encryptedMediaUrl = json["encrypted_media_url"];
    explicitContent = json["explicit_content"];
    featuredArtists = json["featured_artists"];
    featuredArtistsId = json["featured_artists_id"];
    hasLyrics = json["has_lyrics"];
    id = json["id"];
    image = json["image"];
    isDolbyContent = json["is_dolby_content"];
    isRingtoneAvailable = json["is_ringtone_available"];
    label = json["label"];
    labelUrl = json["label_url"];
    language = json["language"];
    lyrics = json["lyrics"];
    lyricsSnippet = json["lyrics_snippet"];
    mediaPreviewUrl = json["media_preview_url"];
    mediaUrl = json["media_url"];
    music = json["music"];
    musicId = json["music_id"];
    origin = json["origin"];
    permaUrl = json["perma_url"];
    playCount = json["play_count"];
    primaryArtists = json["primary_artists"];
    primaryArtistsId = json["primary_artists_id"];
    releaseDate = DateTime.parse(json["release_date"]);
    singers = json["singers"];
    song = json["song"];
    starred = json["starred"];
    starring = json["starring"];
    trillerAvailable = json["triller_available"];
    vcode = json["vcode"];
    vlink = json["vlink"];
    webp = json["webp"];
    year = json["year"];
  }

  Map<String, dynamic> toJson() => {
        "320kbps": the320Kbps,
        "album": album,
        "album_url": albumUrl,
        "albumid": albumid,
        "cache_state": cacheState,
        "copyright_text": copyrightText,
        "disabled": disabled,
        "disabled_text": disabledText,
        "duration": duration,
        "encrypted_media_path": encryptedMediaPath,
        "encrypted_media_url": encryptedMediaUrl,
        "explicit_content": explicitContent,
        "featured_artists": featuredArtists,
        "featured_artists_id": featuredArtistsId,
        "has_lyrics": hasLyrics,
        "id": id,
        "image": image,
        "is_dolby_content": isDolbyContent,
        "is_ringtone_available": isRingtoneAvailable,
        "label": label,
        "label_url": labelUrl,
        "language": language,
        "lyrics": lyrics,
        "lyrics_snippet": lyricsSnippet,
        "media_preview_url": mediaPreviewUrl,
        "media_url": mediaUrl,
        "music": music,
        "music_id": musicId,
        "origin": origin,
        "perma_url": permaUrl,
        "play_count": playCount,
        "primary_artists": primaryArtists,
        "primary_artists_id": primaryArtistsId,
        "release_date":
            "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "singers": singers,
        "song": song,
        "starred": starred,
        "starring": starring,
        "triller_available": trillerAvailable,
        "vcode": vcode,
        "vlink": vlink,
        "webp": webp,
        "year": year,
      };
}
