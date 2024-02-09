// import 'package:flutter/material.dart';

// import 'package:marshall/screens/home/drawer.dart';
// // import 'package:marshall/screens/home/newfolder.dart/favr.dart';
// // import 'package:marshall/screens/home/newfolder.dart/recent.dart';
// import 'package:marshall/screens/home/newfolder/RECENT/favr.dart';

// import 'package:marshall/screens/home/slide.dart';

// import '../newfolder/RECENT/recent.dart';

// class ScreenHome extends StatelessWidget {
//   const ScreenHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(13, 13, 14, 0.918),
//         title: const Text(' 𝓜𝓪𝓻𝓼𝓱𝓪𝓵𝓵'),
//         centerTitle: true,
        
//       ),
//       drawer: const DrawerMenu(),
//       body:  Column(
//         children: [
//           //ViewType().listShow,
//           SlideScreen(),

//           // const SizedBox(
//           //   height: 100,
//           // ),
//           FavouriteSongsBillie(),
//           SizedBox(
//             height: 30,
//           ),
//           RecentSongsList(),
//           SizedBox(
//             height: 50,
//           ),
//           // const MalayalamSongs(),
//           // const SizedBox(
//           //   height: 50,
//           // ),
//           // const TopTrendSongs(),

//           // SizedBox(
//           //   height: 5,
//           // ),

//           Padding(
//             padding: EdgeInsets.only(
//               right: 220,
//               top: 10,
//             ),
// //             child: Text(
// //   'Our Singers',
// //   style: TextStyle(color: (Colors.white),
// //     decoration: TextDecoration.underline,
// //     decorationColor: Color.fromARGB(255, 224, 224, 224), // optional

// //   ),
// // )
//           ),

//           // Singersscreen(),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:marshall/screens/home/drawer.dart';
import 'package:marshall/screens/home/newfolder/RECENT/favr.dart';
import 'package:marshall/screens/home/newfolder/RECENT/recent.dart';
import 'package:marshall/screens/home/slide.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 13, 14, 0.918),
        title: const Text(' 𝓜𝓪𝓻𝓼𝓱𝓪𝓵𝓵'),
        centerTitle: true,
      ),
      drawer: const DrawerMenu(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SlideScreen(),
            SizedBox(height: 20),
            FavouriteSongsBillie(),
            SizedBox(height: 20),
            RecentSongsList(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
