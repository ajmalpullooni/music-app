import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_audio/just_audio.dart';
import 'package:marshall/controller/song_controller.dart';
import 'package:marshall/model/folder_model.dart';
import 'package:marshall/music_db_function/music_db_function.dart';
import 'package:marshall/screens/home/songs/now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../../db/functions/db_functions.dart';
import '../../../music_db/songs_model.dart';
import '../../../provider/song_model_provider.dart';

final _audioQuery = OnAudioQuery();
final AudioPlayer audioPlayer = AudioPlayer();

class Allsongs extends StatefulWidget {
  const Allsongs({super.key});

  @override
  State<Allsongs> createState() => _AllsongsState();
}

class _AllsongsState extends State<Allsongs> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    requestpermission();

    // print(songsList);
  }

  Future<List<SongModel>> GetAudio() async {
    Future<List<SongModel>> songs = _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true);
    List<SongModel> song = await songs;
    // for (SongModel s in song) {
    //   songsList.add(s);
    // }

    return songs;
  }

  void requestpermission() async {
    Future.delayed(Duration(seconds: 4));
    var status = await Permission.storage.request();
    if (status.isGranted) {
      List<SongModel> songsList = [];
      songsList = await GetAudio();
      addToDb(songs: songsList);
      setState(() {});
    }
  }

  // playsong(String? uri) {
  //   try {
  //     audioPlayer.setAudioSource(AudioSource.uri(
  //       Uri.parse(uri!),
  //     ));

  //     audioPlayer.play();
  //   } on Exception {
  //     print('error ');
  //   }
  // }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
  }

  Future<List<SongsModel>> setAudioSearch(String query) async {
    if (query.isEmpty) {
      return getSongs(); // Return all songs if the query is empty
    } else {
      List<SongsModel> fetchedSongs = await getSongs();
      List<SongsModel> searchedSongs = fetchedSongs.where((song) {
        return song.title.toLowerCase().trim().contains(query.toLowerCase());
      }).toList();
      setState(() {
        searchedSongs;
      });
      return searchedSongs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: _isSearching
            ? TextField(
                style: const TextStyle(color: Colors.white),
                controller: _searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              )
            : const Text('All Songs'),
        actions: [
          _isSearching
              ? IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    _stopSearch();
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _startSearch();
                  },
                ),
        ],
      ),
      body: FutureBuilder(
        future: setAudioSearch(_searchController.text),
        builder: (context, item) {
          if (item.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (item.data!.isEmpty) {
            return const Center(
              child: Center(
                child: Text('no songs found'),
              ),
            );
          }
          GetAllSongController.songscopy = item.data!;

          return ListView.builder(
            itemBuilder: (context, index) {
              final songData = item.data![index];

              return ListTile(
                title: Text(
                  "${item.data![index].title}",
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
                subtitle: Text(
                  "${item.data![index].subtitle}",
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
                trailing: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              _nameController.text = '';
                              return AlertDialog(
                                title: const Text('Add List'),
                                content: TextField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Add Playlist',
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Add'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      onplaylistbuttonclicked(
                                          id: item.data![index].songid);
                                    },
                                  ),
                                ],
                              );
                            },
                          ).then((value) {
                            Navigator.pop(context);
                          });
                        },
                        child: ListTile(
                          title: Text('Add to Playlist'),
                          leading: Icon(Icons.playlist_add),
                        ),
                      )),
                      PopupMenuItem(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          likeDbFuction(item.data![index]);
                        },
                        child: ListTile(
                          title: Text('Add to favorite'),
                          leading: Icon(Icons.favorite),
                        ),
                      )),
                    ];
                  },
                ),
                leading: QueryArtworkWidget(
                  id: songData.songid,
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: const CircleAvatar(
                    child: Icon(
                      Icons.music_note,
                    ),
                  ),
                ),
                onTap: () {
                  // context.read<SongmodelProvider>().setId(item.data![index].songid);
                  // playsong(item.data![index].uri);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => Musicscreen(
                        index: index,
                        songModel: item.data!,
                        audioPlayer: audioPlayer,
                      ),
                    ),
                  );
                },
              );
            },
            itemCount: item.data!.length,
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.play_arrow),
      // ),
    );
  }

  Future<void> onplaylistbuttonclicked({required int id}) async {
    final _name = _nameController.text.trim();
    List<int> s = [];
    s.add(id);
    if (_name.isEmpty) {
      return;
    }

    final music = FolderModel(songId: s, name: _name);
    final datas = folderdb.values.map((e) => e.name.trim()).toList();
    if (_name.isEmpty) {
      return;
    } else if (datas.contains(music.name)) {
      print("Alread exist");
    } else {
      addfolder(music);
    }
  }

  void likeDbFuction(SongsModel a) async {
    final songDb = await Hive.openBox('songs_db');

    SongsModel song =
        songDb.values.firstWhere((song) => song.songid == a.songid);

    song.isLiked = !song.isLiked;

    songDb.put(song.key, song);
  }
}
