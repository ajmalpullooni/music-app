import 'package:flutter/material.dart';
import 'package:marshall/screens/home/songs/allsongs.dart';
import 'package:marshall/screens/home/playlist/playlist.dart';

class SlideScreen extends StatelessWidget {
  const SlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: SizedBox(
        height: 180,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const Allsongs(),),);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('asset/images/music_192.gif'),
                                fit: BoxFit.cover,),
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(
                                color: const Color.fromARGB(255, 89, 10, 142),
                                width: 3),
                          ),
                          width: 160,
                        ),
                      ),
                    ),
                    const Text(
                      'All SONGS',
                      style:
                          TextStyle(color: Color.fromARGB(255, 226, 222, 228)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const Myplaylist()));
                    },
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                  'asset/images/616e938268c8f02b2db2c3ca_add music to video pink headphones.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(
                              color: const Color.fromARGB(255, 89, 10, 142),
                              width: 3)),
                    ),
                  ),
                ),
                const Text(
                  'Play List',
                  style: TextStyle(color: Color.fromARGB(255, 232, 229, 233)),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            // Column(
            //   children: [
            //     Expanded(
            //       child: Container(
            //         width: 160,
            //         decoration: BoxDecoration(
            //             image: const DecorationImage(
            //                 image: AssetImage(
            //                     'asset/images/getty_626660256_2000108620009280158_388846.jpg'),
            //                 fit: BoxFit.cover),
            //             borderRadius: BorderRadius.circular(11),
            //             border: Border.all(
            //                 color: const Color.fromARGB(255, 89, 10, 142),
            //                 width: 3)),
            //       ),
            //     ),
            //     //     const Text(
            //     //       'CLASSIC',
            //     //       style: TextStyle(color: Color.fromARGB(255, 232, 230, 233)),
            //     //     ),
            //     //   ],
            //     // ),
            //     // const SizedBox(
            //     //   width: 10,
            //     // ),
            //     // Column(
            //     //   children: [
            //     //     Expanded(
            //     //       child: GestureDetector(
            //     //         onTap: () {
            //     //           Navigator.of(context).push(MaterialPageRoute(
            //     //               builder: (ctx) => const Allsongs()));
            //     //         },
            //     //         child: Container(
            //     //           width: 160,
            //     //           decoration: BoxDecoration(
            //     //               image: const DecorationImage(
            //     //                   image: AssetImage(
            //     //                       'asset/images/ai-music-hits-neurosciencenews-1170x585.webp'),
            //     //                   fit: BoxFit.cover),
            //     //               borderRadius: BorderRadius.circular(11),
            //     //               border: Border.all(
            //     //                   color: const Color.fromARGB(255, 89, 10, 142),
            //     //                   width: 3)),
            //     //         ),
            //     //       ),
            //     //     ),
            //     //     const Text(
            //     //       'POP',
            //     //       style: TextStyle(color: Color.fromARGB(255, 236, 233, 238)),
            //     //     ),
            //     //   ],
            //     // ),
            //     // const SizedBox(
            //     //   width: 10,
            //     // ),
            //     // Column(
            //     //   children: [
            //     //     Expanded(
            //     //       child: Container(
            //     //         width: 160,
            //     //         decoration: BoxDecoration(
            //     //             image: const DecorationImage(
            //     //                 image: AssetImage(
            //     //                     'asset/images/top-view-set-gadgets-purple-neon-light-pink_155003-19112.avif'),
            //     //                 fit: BoxFit.cover),
            //     //             borderRadius: BorderRadius.circular(11),
            //     //             border: Border.all(
            //     //                 color: const Color.fromARGB(255, 89, 10, 142),
            //     //                 width: 3)),
            //     //       ),
            //     //     ),
            //     //     const Text(
            //     //       'WESTERN',
            //     //       style: TextStyle(color: Color.fromARGB(255, 232, 229, 234)),
            //     //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
