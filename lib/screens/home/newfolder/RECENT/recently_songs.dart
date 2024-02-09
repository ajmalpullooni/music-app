import 'package:flutter/material.dart';
import 'package:marshall/music_db/songs_model.dart';
import 'package:marshall/screens/home/songs/allsongs.dart';
import 'package:marshall/screens/home/songs/now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../recent_db_function/rececent_db_function.dart';

class Recentlysong extends StatefulWidget {
  const Recentlysong({Key? key}) : super(key: key);

  @override
  State<Recentlysong> createState() => _RecentlysongState();
}

class _RecentlysongState extends State<Recentlysong> {
  // ignore: non_constant_identifier_names
  final RecentDbFunction _recent_db = RecentDbFunction();
  List<SongsModel> songs = [];
  List<SongsModel> recentSongs = [];
  Future<List<SongsModel>> getSongs() async {
    songs = await _recent_db.GetRecent();
    recentSongs = songs.reversed.toList();
    return recentSongs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(234, 13, 13, 14),
        title: const Text(' RECENTLY'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getSongs(),
        builder: (ctx, item) {
          return ListView.builder(
            itemCount: item.data!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Musicscreen(songModel: item.data!, audioPlayer:audioPlayer , index: index)));
                },
                child: ListTile(
                  title: Text(item.data![index].title ,style: const TextStyle(overflow: TextOverflow.ellipsis),),
                  leading: QueryArtworkWidget(
                    artworkBorder: const BorderRadius.all(Radius.circular(30)),
                    id: item.data![index].songid,
                    type: ArtworkType.AUDIO,
                      nullArtworkWidget: const CircleAvatar(
                        child: Icon(
                                          Icons.music_note,
                                        ),
                      ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
