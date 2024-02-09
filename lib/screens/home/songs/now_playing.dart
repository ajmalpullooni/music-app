import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:marshall/controller/song_controller.dart';
import 'package:marshall/model/folder_model.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import '../../../db/functions/db_functions.dart';
import '../../../music_db/songs_model.dart';
import '../../../provider/song_model_provider.dart';
import '../../../recent_db_function/rececent_db_function.dart';

class Musicscreen extends StatefulWidget {
  Musicscreen(
      {super.key,
      required this.songModel,
      required this.audioPlayer,
      required this.index});
  final List<SongsModel> songModel;
  int index;
  final AudioPlayer audioPlayer;

  @override
  State<Musicscreen> createState() => _MusicscreenState();
}

Color shuffelColor = Colors.black;
TextEditingController _nameController = TextEditingController();
bool _isShuffeling = false;
Random _random = Random();

class _MusicscreenState extends State<Musicscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool _isplaying = false;
  RecentDbFunction _recentDb = RecentDbFunction();

  @override
  void initState() {
    GetAllSongController.audioPlayer.currentIndexStream.listen((index) {
      if (index != null) {
        GetAllSongController.currentIndexes = index;

        setState(() {});
      }
    });
    super.initState();
    playsongs();

    _controller = AnimationController(vsync: this);
  }

  void playsongs() {
    _recentDb.addToRecentDb(songs: widget.songModel[widget.index]);
    try {
      widget.audioPlayer.setAudioSource(
          AudioSource.uri(Uri.parse(widget.songModel[widget.index].uri!)));
      widget.audioPlayer.play();
      _isplaying = true;
    } on Exception {
      print('canot pause song');
    }
    widget.audioPlayer.durationStream.listen((d) {
      setState(() {
        _duration = d!;
      });
    });
    widget.audioPlayer.positionStream.listen((m) {
      setState(() {
        _position = m;
      });
    });
  }

  // void playsongs() {
  //   try {
  //     widget.audioPlayer
  //         .setAudioSource(AudioSource.uri(Uri.parse(widget.songModel.uri!)));
  //     widget.audioPlayer.play();
  //     _isplaying = true;
  //   } on Exception {
  //     print('canot pause song');
  //   }
  //   widget.audioPlayer.durationStream.listen((d) {
  //     setState(() {
  //       _duration = d!;
  //     });
  //   });
  //   widget.audioPlayer.positionStream.listen((m) {
  //     setState(() {
  //       _position = m;
  //     });
  //   });
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 112, 112),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  const Center(
                    child: const ArtWorkWidget(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.songModel[widget.index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 250,
                        child: Center(
                          child: Text(
                            widget.songModel[widget.index].title.toString() ==
                                    "<unknown>"
                                ? "<unknown artist>"
                                : widget.songModel[widget.index].subtitle
                                    .toString(),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10.0),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
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
                                            id: widget.songModel[widget.index]
                                                .songid);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.playlist_add,
                            size: 30,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(_position.toString().split(".")[0]),
                      Expanded(
                          child: Slider(
                        // min: const Duration(microseconds: 0).inSeconds.toDouble(),
                        value: _position.inSeconds.toDouble(),
                        max: _duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            changeToseconds(value.toInt());
                            value = value;
                          });
                        },
                      )),
                      Text(_duration.toString().split(".")[0]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _isShuffeling = !_isplaying;
                              if (_isShuffeling == true) {
                                shuffelColor = Colors.green;
                              } else {
                                shuffelColor =
                                    const Color.fromARGB(255, 221, 111, 7);
                              }
                            });
                          },
                          icon: Icon(
                            Icons.shuffle_sharp,
                            size: 30,
                            color: shuffelColor,
                          )),
                      IconButton(
                          onPressed: () {
                            if (widget.index < 1) {
                              setState(() {
                                widget.index =
                                    widget.index + widget.songModel.length;
                              });
                            }
                            setState(() {
                              widget.index--;
                              playsongs();
                            });
                          },
                          icon: const Icon(
                            Icons.skip_previous,
                            size: 40,
                            color: Color.fromARGB(255, 0, 213, 255),
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isplaying) {
                                widget.audioPlayer.pause();
                              } else {
                                widget.audioPlayer.play();
                              }

                              _isplaying = !_isplaying;
                            });
                          },
                          icon: Icon(
                            _isplaying ? Icons.pause : Icons.play_arrow,
                            size: 40,
                            color: Colors.orange,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isShuffeling == false) {
                                if (widget.index ==
                                    widget.songModel.length - 1) {
                                  widget.index =
                                      widget.index - (widget.songModel.length);
                                }
                                widget.index++;
                              } else {
                                widget.index =
                                    _random.nextInt(widget.songModel.length);
                              }

                              playsongs();
                            });
                            // _isplaying = !_isplaying;
                          },
                          icon: const Icon(
                            Icons.skip_next,
                            size: 40,
                            color: Color.fromARGB(255, 0, 221, 255),
                          )),
                      IconButton(
                        onPressed: () async {
                          likeDbFuction(widget.songModel[widget.index]);
                        },
                        icon: Icon(
                          widget.songModel[widget.index].isLiked
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: widget.songModel[widget.index].isLiked
                              ? Colors.red
                              : Colors.black,
                          size: 40,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  void changeToseconds(int seconds) {
    Duration duration = Duration(seconds: seconds);
    widget.audioPlayer.seek(duration);
  }

  void likeDbFuction(SongsModel a) async {
    final songDb = await Hive.openBox('songs_db');

    SongsModel song =
        songDb.values.firstWhere((song) => song.songid == a.songid);

    song.isLiked = !song.isLiked;

    songDb.put(song.key, song);
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
}

class ArtWorkWidget extends StatelessWidget {
  const ArtWorkWidget({
    super.key,
    // required this.widget,
  });

  // final Musicscreen widget;

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      // id:context.watch<SongmodelProvider>().id,
      id: context.watch<SongmodelProvider>().id,
      type: ArtworkType.AUDIO, artworkHeight: 200, artworkWidth: 200,
      artworkFit: BoxFit.cover,
      nullArtworkWidget: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 8, 152, 218),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          height: 200,
          width: 200,
          child: const Icon(
            Icons.music_note,
            size: 150,
          )),
    );
  }
}
