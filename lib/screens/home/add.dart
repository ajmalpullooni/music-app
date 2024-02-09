import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:marshall/model/folder_model.dart';
import 'package:marshall/music_db/songs_model.dart';
import 'package:marshall/music_db_function/music_db_function.dart';
import 'package:marshall/screens/home/songs/now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({super.key, required this.folderModel});
  final FolderModel folderModel;

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  // ignore: unused_field
  final _audioQuery = OnAudioQuery();

  final AudioPlayer _audioPlayer = AudioPlayer();

  // playsong(String? uri) {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(157, 186, 224, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(234, 13, 13, 14),
        title: const Text(' ALL SONGS'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getSongs(),
          builder: (context, item) {
            if (item.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (item.data!.isEmpty) {
              return const Center(
                child: Center(
                    child: Text(
                  'no songs fount',
                  style: TextStyle(color: Colors.white),
                )),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                final songData = item.data![index];

                return ListTile(
                  title: Text(
                    songData.title,
                  ),
                  subtitle: Text(
                    item.data![index].subtitle,
                  ),
                  trailing: Wrap(
                    children: [
                      widget.folderModel.isValueIn(songData.songid)
                          ? IconButton(
                              onPressed: () {
                                addSongs(item.data![index]);
                                setState(() {});
                              },
                              icon: const Icon(Icons.add))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.folderModel
                                      .deleteData(songData.songid);
                                });
                              },
                              icon: const Icon(Icons.minimize)),
                    ],
                  ),
                  leading: QueryArtworkWidget(
                    id: songData.id,
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: const CircleAvatar(
                      child: Icon(
                        Icons.music_note,
                      ),
                    ),
                  ),
                  onTap: () {
                    //   playsong(item.data![index].uri);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Musicscreen(
                              index: index,
                              songModel: item.data!,
                              audioPlayer: _audioPlayer,
                            )));
                  },
                );
              },
              itemCount: item.data!.length,
            );
          }),
    );
  }

  void addSongs(SongsModel data) {
    widget.folderModel.add(data.songid);
  }
}
