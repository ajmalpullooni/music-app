import 'package:flutter/material.dart';
import 'package:marshall/screens/home/newfolder/RECENT/recently_songs.dart';

class RecentSongsList extends StatelessWidget {
  const RecentSongsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Recentlysong()));
          },
          child: Container(
            height: 180,
            width: 325,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    'asset/images/ai-music-hits-neurosciencenews-1170x585.webp'),
              ),
            ),
          ),
        ),
        const Text(
          'Recent Songs',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
