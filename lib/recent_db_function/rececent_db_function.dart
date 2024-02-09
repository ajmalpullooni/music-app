
import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../music_db/songs_model.dart';

class RecentDbFunction {
  Future<void> addToRecentDb({required SongsModel songs}) async {
    final recentDb = await Hive.openBox('recent_db');

    // Check if the song is already in the recentDb
    final existingSong = recentDb.values.firstWhereOrNull(
      (s) => s.title == songs.title,
    );

    if (existingSong != null) {
      // Delete the existing song if found
      recentDb.delete(existingSong.key);
    }
    int id = 0;
    // Add the new song to the recentDb
    recentDb.add(SongsModel(
      title: songs.title,
      id: id,
      songid: songs.songid,
      subtitle: songs.title.toString(),
      uri: songs.uri.toString(),
      albm: songs.albm,
      isLiked: false,
    ));
    id++;

    GetRecent();
  }

  // ignore: non_constant_identifier_names
  Future<List<SongsModel>> GetRecent() async {
    final recentDb = await Hive.openBox('recent_db');
    List<SongsModel> songs = [];

    for (SongsModel s in recentDb.values) {
      // print('this is from recent ${s.title}');
      songs.add(s);
    }
    return songs;
  }
  // int _getNextId(Box recentDb) {
  //   // Calculate the next id based on the number of existing items in the recentDb
  //   return recentDb.values.isEmpty
  //       ? 0
  //       : recentDb.values.map<int>((item) => item.id).reduce(max) + 1;
  // }
}
