import 'package:flutter/material.dart';
import 'package:marshall/screens/home/first_screens/started.dart';
import 'package:marshall/screens/home/newfolder.dart/about.dart';
import 'package:marshall/screens/home/newfolder.dart/privacy.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'asset/images/wallpaperflare.com_wallpaper.jpg'),
                  fit: BoxFit.cover),
              color: Colors.blue,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                'ENJOY YOUR MUSIC',
                style: TextStyle(color: Color.fromARGB(255, 104, 92, 92)),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.attribution_outlined),
            iconColor: Colors.white,
            title: const Text(
              'About Us',
              style: TextStyle(fontSize: 18),
            ),
            textColor: Colors.white,
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const AboutUs()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_rounded),
            iconColor: Colors.white,
            title: const Text(
              'privacy',
              style: TextStyle(fontSize: 18),
            ),
            textColor: Colors.white,
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const Privacy()));
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.settings),
          //   iconColor: Colors.white,
          //   title: const Text(
          //     'Settings',
          //     style: TextStyle(fontSize: 18),
          //   ),
          //   textColor: Colors.white,
          //   onTap: () {},
          // ),
          ListTile(
            leading: const Icon(Icons.logout),
            iconColor: Colors.white,
            title: const Text(
              'Go to first screen',
              style: TextStyle(fontSize: 18),
            ),
            textColor: Colors.white,
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => Screenstarted()));
            },
          ),
        ],
      ),
    );
  }
}
