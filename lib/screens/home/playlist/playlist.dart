// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:marshall/db/functions/db_functions.dart';
// import 'package:marshall/model/folder_model.dart';

// import 'package:marshall/screens/home/playlist/musicadd.dart';

// class Myplaylist extends StatefulWidget {
//   const Myplaylist({super.key});

//   @override
//   State<Myplaylist> createState() => _MyplaylistState();
// }

// class _MyplaylistState extends State<Myplaylist> {
//   TextEditingController _nameController = TextEditingController();
//   @override
//   void initState() {
//     gettallfolder();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // gettallfolder();
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color.fromARGB(157, 44, 184, 184),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(234, 13, 13, 14),
//         title: const Text(' PLAYLIST'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           ValueListenableBuilder(
//             valueListenable: Hive.box<FolderModel>('folder_db').listenable(),
//             builder: (context, value, child) {
//               return Expanded(
//                 child: ListView.separated(
//                     itemBuilder: (ctx, index) {
//                       final data = value.values.toList()[index];
//                       return Card(
//                         child: ListTile(
//                           onTap: () {
//                             print(index);
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (ctx) => Mymusic(
//                                       folderModel: data,
//                                       index: index,
//                                     )));
//                           },
//                           title: Text(
//                             data.name,
//                             style: const TextStyle(
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                           ),
//                           leading: const Icon(
//                             Icons.folder,
//                             color: Colors.black,
//                           ),
//                           trailing: IconButton(
//                               onPressed: () {
//                                 deletefolder(index);

//                               },
//                               icon: const Icon(
//                                 Icons.delete,
//                                 color: Color.fromARGB(255, 243, 3, 3),
//                               )),
//                         ),
//                       );
//                     },
//                     separatorBuilder: (ctx, index) {
//                       return const SizedBox(
//                         height: 1,
//                       );
//                     },
//                     itemCount: value.length),
//               );
//             },
//           ),

//           //   // Container(
//           //   //   child: ListTile(
//           //   //     leading: Text('data'),
//           //   //     title:Text('.') ,
//           //   //     trailing:Icon(Icons.delete) ,
//           //   //   ),
//           //   // ),
//           //     // child: Padding(
//           //     //   padding: EdgeInsets.only(top: 300),
//           //     //   child: Text(
//           //     //     'Add your playlist',
//           //     //     style: TextStyle(
//           //     //       color: Color.fromRGBO(210, 210, 210, 0.97),
//           //     //     ),
//           //     //   ),
//           //     // ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.add),
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 _nameController.text = '';
//                 return AlertDialog(
//                   title: const Text('Add List'),
//                   content: TextField(
//                     controller: _nameController,
//                     decoration: const InputDecoration(
//                       hintText: 'Add Playlist',
//                     ),
//                   ),
//                   actions: <Widget>[
//                     TextButton(
//                       child: const Text('Cancel'),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                     TextButton(
//                       child: const Text('Add'),
//                       onPressed: () {
//                         onplaylistbuttonclicked();
//                         Navigator.of(context).pop();
//                         // You can access
//                         // String enteredText = textController.text;
//                         // // Do something with the entered text, e.g., add it to a list.
//                         // print('Entered text: $enteredText');
//                         // Navigator.of(context).pop(); // Close the dialog
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//           }),
//     );
//   }

//   Future<void> onplaylistbuttonclicked() async {
//     final _name = _nameController.text.trim();
//     if (_name.isEmpty) {
//       return;
//     }

//     final music = FolderModel(songId: [], name: _name);
//     final datas = folderdb.values.map((e) => e.name.trim()).toList();
//     if (_name.isEmpty) {
//       return;
//     } else if (datas.contains(music.name)) {
//       print("Alread exist");
//     } else {
//       addfolder(music);
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:marshall/db/functions/db_functions.dart';
import 'package:marshall/model/folder_model.dart';

import 'package:marshall/screens/home/playlist/musicadd.dart';

class Myplaylist extends StatefulWidget {
  const Myplaylist({super.key});

  @override
  State<Myplaylist> createState() => _MyplaylistState();
}

class _MyplaylistState extends State<Myplaylist> {
  TextEditingController _nameController = TextEditingController();
  @override
  void initState() {
    gettallfolder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // gettallfolder();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(157, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(234, 13, 13, 14),
        title: const Text(' PLAYLIST'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: Hive.box<FolderModel>('folder_db').listenable(),
            builder: (context, value, child) {
              return Expanded(
                child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      final data = value.values.toList()[index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            print(index);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => Mymusic(
                                      folderModel: data,
                                      index: index,
                                    )));
                          },
                          title: Text(
                            data.name,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          leading: const Icon(
                            Icons.folder,
                            color: Colors.black,
                          ),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          _nameController.text = data.name;
                                          return AlertDialog(
                                            title: const Text('Edit name'),
                                            content: TextField(
                                              controller: _nameController,
                                              decoration: const InputDecoration(
                                                hintText: 'Edit name',
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('Edit'),
                                                onPressed: () {
                                                  updateFolderName(data,
                                                      _nameController.text);
                                                  // onplaylistbuttonclicked();
                                                  Navigator.of(context).pop();
                                                  // You can access
                                                  // String enteredText = textController.text;
                                                  // // Do something with the entered text, e.g., add it to a list.
                                                  // print('Entered text: $enteredText');
                                                  // Navigator.of(context).pop(); // Close the dialog
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon:
                                        Icon(Icons.edit, color: Colors.black)),
                                IconButton(
                                  onPressed: () async {
                                    // Show confirmation dialog
                                    bool confirmDelete =
                                        await _showDeleteConfirmationDialog(
                                            context);

                                    // Check the user's choice
                                    if (confirmDelete) {
                                      // Delete the folder
                                      deletefolder(index);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 243, 3, 3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const SizedBox(
                        height: 1,
                      );
                    },
                    itemCount: value.length),
              );
            },
          ),

          //   // Container(
          //   //   child: ListTile(
          //   //     leading: Text('data'),
          //   //     title:Text('.') ,
          //   //     trailing:Icon(Icons.delete) ,
          //   //   ),
          //   // ),
          //     // child: Padding(
          //     //   padding: EdgeInsets.only(top: 300),
          //     //   child: Text(
          //     //     'Add your playlist',
          //     //     style: TextStyle(
          //     //       color: Color.fromRGBO(210, 210, 210, 0.97),
          //     //     ),
          //     //   ),
          //     // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                _nameController.text = '';
                return AlertDialog(
                  title: const Text('Add List'),
                  content: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Add Playlist',
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Add'),
                      onPressed: () {
                        onplaylistbuttonclicked();
                        Navigator.of(context).pop();
                        // You can access
                        // String enteredText = textController.text;
                        // // Do something with the entered text, e.g., add it to a list.
                        // print('Entered text: $enteredText');
                        // Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ],
                );
              },
            );
          }),
    );
  }

  Future<void> onplaylistbuttonclicked() async {
    final _name = _nameController.text.trim();
    if (_name.isEmpty) {
      return;
    }

    final music = FolderModel(songId: [], name: _name);
    final datas = folderdb.values.map((e) => e.name.trim()).toList();
    if (_name.isEmpty) {
      return;
    } else if (datas.contains(music.name)) {
      print("Alread exist");
    } else {
      addfolder(music);
    }
  }
}

Future<bool> _showDeleteConfirmationDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Delete Playlist"),
            content:
                const Text("Are you sure you want to delete this Playlist?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // User clicked Cancel
                  Navigator.of(context).pop(false);
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  // User clicked Delete
                  Navigator.of(context).pop(true);
                },
                child: const Text("Delete"),
              ),
            ],
          );
        },
      ) ??
      false; // Return false if the user dismisses the dialog without choosing an option
}
