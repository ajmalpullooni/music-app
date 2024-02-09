// import 'package:flutter/material.dart';

// class FavoriteSongs extends StatelessWidget {
//   const FavoriteSongs({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 100),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(
//                 width: 1.0,
//                 color: const Color.fromARGB(255, 117, 9, 136),
//               ),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(11), //                 <--- border radius here
//               ),

//               // border: Border.all(
//               //   color: const Color.fromARGB(255, 89, 10, 142),

//               // )
//               color: const Color.fromARGB(255, 215, 205, 7),
//             ),
//             height: 160,
//             width: 250,
//             child: ListTile(
//               leading: Padding(
//                 padding: const EdgeInsets.only(right: 80),
//                 child: Container(
//                   height: 100,
//                   width: 80,
//                   decoration: BoxDecoration(
//                       image: const DecorationImage(
//                           image: AssetImage('asset/images/peakpx (5).jpg'),
//                           fit: BoxFit.cover),
//                       borderRadius: BorderRadius.circular(11),
//                       border: Border.all(
//                           color: const Color.fromARGB(255, 89, 10, 142),
//                           width: 3)),
//                 ),
//               ),
//               trailing: const Text(
//                 '    Favorites          ',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
