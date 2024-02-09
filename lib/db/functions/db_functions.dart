import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:marshall/model/folder_model.dart';

List<FolderModel> modelNotofier = [];
ValueNotifier<List<FolderModel>> Notofier = ValueNotifier([]);
final folderdb = Hive.box<FolderModel>('folder_db');
Future<void> addfolder(FolderModel value) async {
  final folderdb = Hive.box<FolderModel>('folder_db');
  await folderdb.add(value);
  log(folderdb.values.toString());
  modelNotofier.add(value);

  gettallfolder();
}

Future<void> gettallfolder() async {
  final folderdb = Hive.box<FolderModel>('folder_db');
  modelNotofier.clear();
  modelNotofier.addAll(folderdb.values);
  // folderlistNotifier.value.clear();
  // folderlistNotifier.value.addAll(folderdb.values);
  // folderlistNotifier.notifyListeners();
}

Future<void> deletefolder(int id) async {
  final folderdb = Hive.box<FolderModel>('folder_db');
  await folderdb.deleteAt(id);
  gettallfolder();
}

Future<void> updateFolderName(FolderModel f, String cname) async {
  final folderdb = await Hive.box<FolderModel>('folder_db');
  FolderModel? s = folderdb.get(f.key);

  s?.name = cname;
  folderdb.put(s?.key, s!);
  gettallfolder();
}
