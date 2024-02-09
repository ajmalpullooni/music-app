// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:marshall/controller/song_controller.dart';
// import 'package:marshall/model/folder_model.dart';
// import 'package:marshall/music_db_function/music_db_function.dart';
// import 'package:marshall/screens/home/add.dart';

// import 'package:marshall/screens/home/songs/now_playing.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// import '../../../music_db/songs_model.dart';

// class Mymusic extends StatefulWidget {
//   Mymusic({super.key, required this.folderModel, required this.index});
//   final FolderModel folderModel;
//   final int index;

//   @override
//   State<Mymusic> createState() => _MymusicState();
// }

// class _MymusicState extends State<Mymusic> {
//   final _audioQuery = new OnAudioQuery();
//   late List<SongsModel> folderPlaylist = [];

//   final AudioPlayer _audioPlayer = AudioPlayer();

//   playsong(String? uri) {
//     try {
//       _audioPlayer.setAudioSource(AudioSource.uri(
//         Uri.parse(uri!),
//       ));
//       _audioPlayer.play();
//     } on Exception {
//       print('error ');
//     }
//   }

//   List<SongModel> plyalist = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     listPlaylist(widget.folderModel.songId);
//     print(widget.folderModel.songId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     late List<SongsModel> songs = [];
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color.fromARGB(157, 39, 40, 36),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(234, 13, 13, 14),
//         title: Text(widget.folderModel.name),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ValueListenableBuilder(
//               valueListenable: Hive.box<FolderModel>('folder_db').listenable(),
//               builder: (context, value, child) {

//                 // folderPlaylist = listPlaylist(widget.folderModel.songId);
//             songs=    listPlaylist(value.values.toList()[widget.index].songId);
//                 print("${folderPlaylist.length} hello");
//                 return SizedBox(
//                   height: 400,
//                   child: folderPlaylist.isEmpty
//                       ? const Center(
//                           child: Text("no datta"),
//                         )
//                       : ListView.builder(
//                           itemCount: songs.length,
//                           itemBuilder: (context, index) {
//                             final data = folderPlaylist[index];
//                             return ListTile(
//                               leading: QueryArtworkWidget(
//                                   id: data.id, type: ArtworkType.AUDIO),
//                               title: Text(
//                                 data.title,
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                               trailing: IconButton(
//                                 onPressed: () async {
//                                   setState(() {
//                                     widget.folderModel.deleteData(data.id);
//                                     folderPlaylist.remove(data);
//                                   });
//                                 },
//                                 icon: const Icon(
//                                   Icons.delete,
//                                   color: Color.fromARGB(255, 240, 0, 0),
//                                 ),
//                               ),
//                               onTap: () {
//                                 playsong(data.uri);
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (ctx) => Musicscreen(
//                                           index: index,
//                                           songModel: folderPlaylist,
//                                           audioPlayer: _audioPlayer,
//                                         )));
//                               },
//                             );
//                           },
//                         ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(
//               builder: (ctx) => Addscreen(
//                     folderModel: widget.folderModel,
//                   )));
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   List<SongsModel> listPlaylist(List<int> data) {
//     List<SongsModel> playSongs = [];
//     // List<SongsModel> tempsongs = await getSongs();

//     for (int i = 0; i < GetAllSongController.songscopy.length; i++) {
//       for (int j = 0; j < data.length; j++) {
//         if (GetAllSongController.songscopy[i].id == data[j]) {
//           playSongs.add(GetAllSongController.songscopy[i]);
//         }
//       }
//       //   playSongs.addAll(tempsongs.where((element) {
//       //     return element.songid == data[i];
//       //   }).toList());
//     }

//     // folderPlaylist = playSongs;
//     // setState(() {});
//     return playSongs;
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_audio/just_audio.dart';
import 'package:marshall/controller/song_controller.dart';
import 'package:marshall/model/folder_model.dart';
import 'package:marshall/music_db_function/music_db_function.dart';
import 'package:marshall/screens/home/add.dart';

import 'package:marshall/screens/home/songs/now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../music_db/songs_model.dart';

class Mymusic extends StatefulWidget {
  const Mymusic({super.key, required this.folderModel, required this.index});
  final FolderModel folderModel;
  final int index;

  @override
  State<Mymusic> createState() => _MymusicState();
}

class _MymusicState extends State<Mymusic> {
  final _audioQuery = OnAudioQuery();
  late List<SongsModel> folderPlaylist = [];

  final AudioPlayer _audioPlayer = AudioPlayer();

  playsong(String? uri) {
    try {
      _audioPlayer.setAudioSource(AudioSource.uri(
        Uri.parse(uri!),
      ));
      _audioPlayer.play();
    } on Exception {
      print('error ');
    }
  }

  List<SongsModel> plyalist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listPlaylist(widget.folderModel.songId);
    print(widget.folderModel.songId);
    helow();
  }

  void helow() async {
    GetAllSongController.songscopy = await getSongs();
  }

  @override
  Widget build(BuildContext context) {
    // late List<SongsModel> songs = [];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(157, 39, 40, 36),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(234, 13, 13, 14),
        title: Text(widget.folderModel.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box<FolderModel>('folder_db').listenable(),
              builder: (context, value, child) {
                // folderPlaylist = listPlaylist(widget.folderModel.songId);
                plyalist = listPlaylist(widget.folderModel.songId);

                print("${GetAllSongController.songscopy.length} justin");
                print(plyalist.length);
                return SizedBox(
                  height: 400,
                  child: plyalist.isEmpty
                      ? const Center(
                          child: Text(
                            "no datta",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          itemCount: plyalist.length,
                          itemBuilder: (context, index) {
                            final data = plyalist[index];
                            return ListTile(
                              leading: QueryArtworkWidget(
                                id: data.songid,
                                type: ArtworkType.AUDIO,
                                nullArtworkWidget: const CircleAvatar(
                                  
                                  child: Icon(
                                    Icons.music_note,
                                  ),
                                ),
                              ),
                              title: Text(
                                data.title,
                                style: const TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis),
                              ),
                              trailing: IconButton(
                                onPressed: () async {
                                  setState(() {
                                    widget.folderModel.deleteData(data.songid);
                                    folderPlaylist.remove(data);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 240, 0, 0),
                                ),
                              ),
                              onTap: () {
                                playsong(data.uri);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => Musicscreen(
                                          index: index,
                                          songModel: plyalist,
                                          audioPlayer: _audioPlayer,
                                        )));
                              },
                            );
                          },
                        ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => Addscreen(
                    folderModel: widget.folderModel,
                  )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  List<SongsModel> listPlaylist(List<int> data) {
    List<SongsModel> plsongs = [];
    for (int i = 0; i < GetAllSongController.songscopy.length; i++) {
      for (int j = 0; j < data.length; j++) {
        if (GetAllSongController.songscopy[i].songid == data[j]) {
          plsongs.add(GetAllSongController.songscopy[i]);
        }
      }
    }
    return plsongs;

    //   List<SongsModel> playSongs = [];
    //   // List<SongsModel> tempsongs = await getSongs();

    //   for (int i = 0; i < GetAllSongController.songscopy.length; i++) {
    //     for (int j = 0; j < data.length; j++) {
    //       if (GetAllSongController.songscopy[i].id == data[j]) {
    //         playSongs.add(GetAllSongController.songscopy[i]);
    //       }
    //     }
    //     //   playSongs.addAll(tempsongs.where((element) {
    //     //     return element.songid == data[i];
    //     //   }).toList());
    //   }

    //   // folderPlaylist = playSongs;
    //   // setState(() {});
    //   return playSongs;
  }
}
