import 'package:hive_flutter/hive_flutter.dart';
import 'package:marshall/music_db/songs_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

void addToDb({required List<SongModel> songs}) async {
  final musicDb = await Hive.openBox('songs_db');
  int id = 0;

  if(musicDb.length<1){
     for (SongModel s in songs) {

    
    musicDb.add(SongsModel(
        title: s.title,
        id: id,
        songid: s.id,
        subtitle: s.artist.toString(),
        uri: s.uri.toString(),
        albm: s.album!,
        isLiked: false,
        ));
        
  }
  id++;

  }
 

  getSongs();
}

Future<List<SongsModel>> getSongs() async {
  final musicDb = await Hive.openBox('songs_db');
  List<SongsModel> songs = [];
  if(songs.length<1){
      for (SongsModel s in musicDb.values) {
    // print('this is form db ${s.title}');
    songs.add(s);
  }

  }


  // for (SongsModel s in songs) {
  //   print('this is form songs${s.title}');
  // }
  return songs;
}
