import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marshall/music_db/songs_model.dart';
import 'package:marshall/music_db_function/music_db_function.dart';
import 'package:marshall/screens/home/songs/allsongs.dart';
import 'package:marshall/screens/home/songs/now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Favoritesong extends StatefulWidget {
  const Favoritesong({super.key});

  @override
  State<Favoritesong> createState() => _FavoritesongState();
}

class _FavoritesongState extends State<Favoritesong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(157, 186, 224, 226),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(234, 13, 13, 14),
          title: const Text('Favorite'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: favList(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => Musicscreen(
                                songModel: snapshot.data!,
                                audioPlayer: audioPlayer,
                                index: index)));
                      },
                      child: ListTile(
                          trailing: IconButton(
                              onPressed: () {
                                likeDbDeleteFuction(snapshot.data![index]);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          title: Text(
                            '${snapshot.data![index].title}',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                          leading: QueryArtworkWidget(
                            id: snapshot.data![index].songid,
                            type: ArtworkType.AUDIO,
                            nullArtworkWidget:  const CircleAvatar(
                              child: Icon(
                                Icons.music_note,
                              ),
                            ),
                          )),
                    );
                  },
                );
              }
            },
          ),
        ));
  }

  Future<List<SongsModel>> favList() async {
    List<SongsModel> songs = await getSongs();
    List<SongsModel> favSongs = songs.where((song) {
      return song.isLiked == true;
    }).toList();
    return favSongs;
  }

  void likeDbDeleteFuction(SongsModel a) async {
    final songDb = await Hive.openBox('songs_db');

    SongsModel song =
        songDb.values.firstWhere((song) => song.songid == a.songid);

    song.isLiked = false;

    songDb.put(song.key, song);
  }
}
