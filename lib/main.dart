import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marshall/model/folder_model.dart';
import 'package:marshall/music_db/songs_model.dart';
import 'package:marshall/provider/song_model_provider.dart';
import 'package:marshall/recent_db/recent_model.dart';
import 'package:marshall/screens/home/first_screens/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(FolderModelAdapter().typeId)) {
    Hive.registerAdapter(FolderModelAdapter());
  }

  if (!Hive.isAdapterRegistered(SongsModelAdapter().typeId)) {
    Hive.registerAdapter(SongsModelAdapter());
  }
  if (!Hive.isAdapterRegistered(RecentDbAdapter().typeId)) {
    Hive.registerAdapter(RecentDbAdapter());
  }

  await Hive.openBox<FolderModel>('folder_db');
  // await Hive.openBox<SongsModel>('songs_db');

  runApp(
    ChangeNotifierProvider(create: (context)=>SongmodelProvider() ,child: const MyApp(),),
    // MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screensplash(),
    );
  }
}
