import 'package:flutter/material.dart';
import 'package:marshall/screens/home/newfolder/RECENT/favorite_songs.dart';
// import 'package:marshall/screens/home/newfolder.dart/favorite_songs.dart';

class FavouriteSongsBillie extends StatelessWidget {
  const FavouriteSongsBillie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Favoritesong()));
              },
              child: Container(
                height: 180,
                width: 325,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('asset/images/receent2.jpg'),
                  ),
                ),
              ),
            ),
            const Text(
              'Favorite Songs',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
