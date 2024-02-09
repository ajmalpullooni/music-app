import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import '../music_db/songs_model.dart';

class GetAllSongController {
  static AudioPlayer audioPlayer = AudioPlayer();
  static List<SongsModel> songscopy = [];
  static List<SongsModel> playingSong = [];
  static int currentIndexes = -1;
  static ConcatenatingAudioSource createSongList(List<SongsModel> elements) {
    List<AudioSource> songList = [];
    playingSong = elements;
    for (var element in elements) {
      songList.add(
        AudioSource.uri(
          Uri.parse(element.uri),
          tag: MediaItem(
            id: element.id.toString(),
            album: element.albm,
            title: element.title,
            artist: element.subtitle,
            artUri: Uri.parse(element.id.toString()),
          ),
        ),
      );
    }
    return ConcatenatingAudioSource(children: songList);
  }
}
