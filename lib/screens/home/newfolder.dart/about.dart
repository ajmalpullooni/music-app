import 'package:flutter/material.dart';



class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 230, 230, 230),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    const Text(
                      'About Us',
                   
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
               
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  '''      Welcome to Marshall, your number one source for music . We're dedicated to providing  you the very bestquality of sound and the music varient, with an emphasis on new features,playlists and favourites, and a richuser experience.


Founded in 2023 by Harikrishnan, Marshall is our first major project with a basic performance of music hub and creates a better version in future. Marshall gives you the best music experience that you never had. It includes attractive mode of UI’s and good practices.


It gives good quality and had increased the settings to power up the system as well as  to provide better  music rythms.


We hope you enjoy our music as much as we enjoy offering them to you. If you have any questions or comments, please don't hesitate to contact us.


Sincerely,


HARIKRISHNAN .P
               ''',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
