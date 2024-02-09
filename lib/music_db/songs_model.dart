import 'package:hive/hive.dart';
part 'songs_model.g.dart';

@HiveType(typeId: 2)
class SongsModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  int songid;
  @HiveField(3)
  String uri;
  @HiveField(4)
  int id;
  @HiveField(5)
  String albm;
  @HiveField(6)
  bool isLiked;
  SongsModel(
      {required this.title,
      required this.id,
      required this.songid,
      required this.subtitle,
      required this.uri,
      required this.albm,
      required this.isLiked
      });
}
