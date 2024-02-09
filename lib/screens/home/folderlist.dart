// import 'package:flutter/material.dart';
// import 'package:marshall/db/functions/db_functions.dart';
// import 'package:marshall/screens/home/musicadd.dart';

// import '../../model/folder_model.dart';

// class FolderList extends StatefulWidget {
//   const FolderList({super.key});

//   @override
//   State<FolderList> createState() => _FolderListState();
// }

// class _FolderListState extends State<FolderList> {
//   @override
//   void initState() {
//     super.initState();
//     gettallfolder();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: folderlistNotifier,
//       builder: (BuildContext ctx, List<FolderModel> folderlist, Widget? child) {
//         return Expanded(
//           child: ListView.separated(
//               itemBuilder: (ctx, index) {
//                 final data = folderlist[index];
//                 return Card(
//                   child: ListTile(
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (ctx) => const Mymusic()));
//                     },
//                     title: Text(
//                       data.name,
//                       style:
//                           const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//                     ),
//                     leading: const Icon(
//                       Icons.folder,
//                       color: Colors.black,
//                     ),
//                     trailing: IconButton(
//                         onPressed: () {
//                           // ignore: unnecessary_null_comparison
//                           if (data.id != null) {
//                             deletefolder(data.id);
//                           } else {
//                             print('folder id is null.unablle to delete');
//                           }
//                         },
//                         icon: const Icon(
//                           Icons.delete,
//                           color: Color.fromARGB(255, 243, 3, 3),
//                         )),
//                   ),
//                 );
//               },
//               separatorBuilder: (ctx, index) {
//                 return const SizedBox(
//                   height: 1,
//                 );
//               },
//               itemCount: folderlist.length),
//         );
//       },
//     );
//   }
// }
