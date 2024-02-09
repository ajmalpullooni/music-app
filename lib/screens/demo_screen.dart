// import 'package:flutter/material.dart';
// import 'package:marshall/music_db_function/music_db_function.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// import '../controller/song_controller.dart';
// import '../music_db/songs_model.dart';

// // final OnAudioQuery _audioQuery = OnAudioQuery();
// bool sizedBoxSpacing = false;
// List<SongsModel> allSongs = [];

// bool gridopt = false;

// class ViewType {
//   FutureBuilder listShow = FutureBuilder<List<SongsModel>>(
//     future: getSongs(),
//     builder: ((context, items) {
//       if (items.data == null) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//       if (items.data!.isEmpty) {
//         return const Center(
//           child: Text(
//             'No Songs found',
//             style: TextStyle(color: Colors.white),
//           ),
//         );
//       }
//       // startSong = items.data!;

//       GetAllSongController.songscopy = items.data!;

//       return ListView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemBuilder: ((context, index) {
//           allSongs.addAll(items.data!);
//           return const SizedBox();
//         }),
//         itemCount: items.data!.length,
//       );
//     }),
//   );
// }
