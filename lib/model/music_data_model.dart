// To parse this JSON data, do
//
//     final musicData = musicDataFromJson(jsonString);

import 'dart:convert';

List<MusicData> musicDataFromJson(String str) =>
    List<MusicData>.from(json.decode(str).map((x) => MusicData.fromJson(x)));

String musicDataToJson(List<MusicData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MusicData {
  MusicData(
    String res, {
    this.the320Kbps,
    this.album,
    this.albumid,
    this.cacheState,
    this.copyrightText,
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
    this.label,
    this.labelUrl,
    this.language,
    this.lyrics,
    this.lyricsSnippet,
    this.mediaPreviewUrl,
    this.mediaUrl,
    this.origin,
    this.playCount,
    this.primaryArtists,
    this.releaseDate,
    this.singers,
    this.music,
    this.song,
    this.starred,
    this.starring,
    this.trillerAvailable,
    this.type,
    this.vcode,
    this.webp,
    this.year,
  });

  String? music;
  String? the320Kbps;
  String? album;
  String? albumid;
  String? cacheState;
  String? copyrightText;
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
  String? label;
  String? labelUrl;
  String? language;
  String? lyrics;
  String? lyricsSnippet;
  String? mediaPreviewUrl;
  String? mediaUrl;
  String? origin;
  int? playCount;
  String? primaryArtists;
  DateTime? releaseDate;
  String? singers;
  String? song;
  String? starred;
  String? starring;
  bool? trillerAvailable;
  String? type;
  String? vcode;
  bool? webp;
  String? year;

  MusicData.fromJson(Map<String, dynamic> json) {
    the320Kbps = json["320kbps"];
    album = json["album"];
    albumid = json["albumid"];
    cacheState = json["cache_state"];
    copyrightText = json["copyright_text"];
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
    label = json["label"];
    labelUrl = json["label_url"];
    language = json["language"];
    lyrics = json["lyrics"];
    lyricsSnippet = json["lyrics_snippet"];
    mediaPreviewUrl = json["media_preview_url"];
    mediaUrl = json["media_url"];
    origin = json["origin"];
    music = json["music"];
    playCount = json["play_count"];
    primaryArtists = json["primary_artists"];
    releaseDate = DateTime.parse(json["release_date"]);
    singers = json["singers"];
    song = json["song"];
    starred = json["starred"];
    starring = json["starring"];
    trillerAvailable = json["triller_available"];
    type = json["type"];
    vcode = json["vcode"];
    webp = json["webp"];
    year = json["year"];
  }

  Map<String, dynamic> toJson() => {
        "320kbps": the320Kbps,
        "album": album,
        "albumid": albumid,
        "cache_state": cacheState,
        "copyright_text": copyrightText,
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
        "label": label,
        "music": music,
        "label_url": labelUrl,
        "language": language,
        "lyrics": lyrics,
        "lyrics_snippet": lyricsSnippet,
        "media_preview_url": mediaPreviewUrl,
        "media_url": mediaUrl,
        "origin": origin,
        "play_count": playCount,
        "primary_artists": primaryArtists,
        "release_date":
            "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "singers": singers,
        "song": song,
        "starred": starred,
        "starring": starring,
        "triller_available": trillerAvailable,
        "type": type,
        "vcode": vcode,
        "webp": webp,
        "year": year,
      };
}
