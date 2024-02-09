// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class Musicscreen extends StatefulWidget {
//   const Musicscreen(
//       {super.key, required this.songModel, required this.audioPlayer});
//   final SongModel songModel;
//   final AudioPlayer audioPlayer;

//   @override
//   State<Musicscreen> createState() => _MusicscreenState();
// }

// class _MusicscreenState extends State<Musicscreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   Duration _duration = const Duration();
//   Duration _position = const Duration();

//   bool _isplaying = false;

//   @override
//   void initState() {
//     super.initState();
//     playsongs();

//     _controller = AnimationController(vsync: this);
//   }

//   void playsongs() {
//     try {
//       widget.audioPlayer
//           .setAudioSource(AudioSource.uri(Uri.parse(widget.songModel.uri!)));
//       widget.audioPlayer.play();
//       _isplaying = true;
//     } on Exception {
//       print('canot pause song');
//     }
//     widget.audioPlayer.durationStream.listen((d) {
//       setState(() {
//         _duration = d!;
//       });
//     });
//     widget.audioPlayer.positionStream.listen((m) {
//       setState(() {
//         _position = m;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.arrow_back_ios)),
//             const SizedBox(
//               height: 30,
//             ),
//             Center(
//               child: Column(
//                 children: [
//                   const CircleAvatar(
//                     radius: 100.0,
//                     child: Icon(
//                       Icons.music_note,
//                       size: 80.0,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     widget.songModel.displayNameWOExt,
//                     overflow: TextOverflow.fade,
//                     maxLines: 1,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 20.0),
//                   ),
//                   const SizedBox(height: 30),
//                   Text(
//                     widget.songModel.artist.toString() == "<unknown>"
//                         ? "<unknown artist>"
//                         : widget.songModel.artist.toString(),
//                     overflow: TextOverflow.fade,
//                     maxLines: 1,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 10.0),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(_position.toString().split(".")[0]),
//                       Expanded(
//                           child: Slider(
//                         // min: const Duration(microseconds: 0).inSeconds.toDouble(),
//                         value: _position.inSeconds.toDouble(),
//                         max: _duration.inSeconds.toDouble(),
//                         onChanged: (value) {
//                           setState(() {
//                             changeToseconds(value.toInt());
//                             value = value;
//                           });
//                         },
//                       )),
//                       Text(_duration.toString().split(".")[0]),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.skip_previous,
//                             size: 40,
//                           )),
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               if (_isplaying) {
//                                 widget.audioPlayer.pause();
//                               } else {
//                                 widget.audioPlayer.play();
//                               }

//                               _isplaying = !_isplaying;
//                             });
//                           },
//                           icon: Icon(
//                             _isplaying ? Icons.pause : Icons.play_arrow,
//                             size: 40,
//                             color: Colors.orange,
//                           )),
//                       IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.skip_next,
//                             size: 40,
//                           )),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }

//   void changeToseconds(int seconds) {
//     Duration duration = Duration(seconds: seconds);
//     widget.audioPlayer.seek(duration);
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class Musicscreen extends StatefulWidget {
//   const Musicscreen(
//       {super.key, required this.songModel, required this.audioPlayer});
//   final SongModel songModel;
//   final AudioPlayer audioPlayer;

//   @override
//   State<Musicscreen> createState() => _MusicscreenState();
// }

// class _MusicscreenState extends State<Musicscreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   Duration _duration = const Duration();
//   Duration _position = const Duration();
//   bool _isplaying = false;

//   // Example list of songs and their indices
//   List<SongModel> songs = []; // Add your list of songs here
//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     playsongs();
//     _controller = AnimationController(vsync: this);
//   }

//   void playsongs() {
//     try {
//       widget.audioPlayer
//           .setAudioSource(AudioSource.uri(Uri.parse(widget.songModel.uri!)));
//       widget.audioPlayer.play();
//       _isplaying = true;
//     } on Exception {
//       print('cannot play song');
//     }
//     widget.audioPlayer.durationStream.listen((d) {
//       setState(() {
//         _duration = d!;
//       });
//     });
//     widget.audioPlayer.positionStream.listen((m) {
//       setState(() {
//         _position = m;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.arrow_back_ios),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Center(
//                 child: Column(
//                   children: [
//                     const CircleAvatar(
//                       radius: 100.0,
//                       child: Icon(
//                         Icons.music_note,
//                         size: 80.0,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       widget.songModel.displayNameWOExt,
//                       overflow: TextOverflow.fade,
//                       maxLines: 1,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     Text(
//                       widget.songModel.artist.toString() == "<unknown>"
//                           ? "<unknown artist>"
//                           : widget.songModel.artist.toString(),
//                       overflow: TextOverflow.fade,
//                       maxLines: 1,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 10.0,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Text(_position.toString().split(".")[0]),
//                         Expanded(
//                           child: Slider(
//                             value: _position.inSeconds.toDouble(),
//                             max: _duration.inSeconds.toDouble(),
//                             onChanged: (value) {
//                               setState(() {
//                                 changeToseconds(value.toInt());
//                                 value = value;
//                               });
//                             },
//                           ),
//                         ),
//                         Text(_duration.toString().split(".")[0]),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             // Implement logic for skipping to the previous song
//                             if (currentIndex > 0) {
//                               currentIndex--;
//                               playNewSong();
//                             }
//                           },
//                           icon: const Icon(
//                             Icons.skip_previous,
//                             size: 40,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             setState(() {
//                               if (_isplaying) {
//                                 widget.audioPlayer.pause();
//                               } else {
//                                 widget.audioPlayer.play();
//                               }
//                               _isplaying = !_isplaying;
//                             });
//                           },
//                           icon: Icon(
//                             _isplaying ? Icons.pause : Icons.play_arrow,
//                             size: 40,
//                             color: Colors.orange,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             // Implement logic for skipping to the next song
//                             if (currentIndex < songs.length - 1) {
//                               currentIndex++;
//                               playNewSong();
//                             }
//                           },
//                           icon: const Icon(
//                             Icons.skip_next,
//                             size: 40,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void changeToseconds(int seconds) {
//     Duration duration = Duration(seconds: seconds);
//     widget.audioPlayer.seek(duration);
//   }

//   void playNewSong() {
//     widget.audioPlayer.stop();
//     widget.audioPlayer.setAudioSource(
//       AudioSource.uri(Uri.parse(songs[currentIndex].uri!)),
//     );
//     widget.audioPlayer.play();
//     _isplaying = true;
//   }
// }

