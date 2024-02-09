import 'package:hive_flutter/adapters.dart';
part 'folder_model.g.dart';

@HiveType(typeId: 1)
class FolderModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<int> songId;

  FolderModel({required this.songId, required this.name});

  add(int id) async {
    songId.add(id);
    print('add');
    save();
    print(songId.length);
  }

  deleteData(int id) async {
  print('remove');
  songId.remove(id);
  await save(); // Assuming save is an asynchronous operation
  // await Hive.box<FolderModel>('folder_db').put(key, this);
}


  bool isValueIn(int id) {
    return !songId.contains(id);
  }
}
