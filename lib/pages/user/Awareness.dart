import 'package:bluebit1/pages/Bot/mybot.dart';
import 'package:bluebit1/pages/admin/admin_login.dart';
import 'package:bluebit1/pages/user/articles.dart';
import 'package:bluebit1/pages/user/donation_screen.dart';
import 'package:bluebit1/pages/user/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AwarnessScreen extends StatefulWidget {
  const AwarnessScreen({super.key});

  @override
  State<AwarnessScreen> createState() => _AwarnessScreenState();
}

class _AwarnessScreenState extends State<AwarnessScreen> {

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Awareness', style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // Handle the button tap for 'List of Help'
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white, // Adjusted color here
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Multi-Media',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:
                    (context) => ArticlesPage()) );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Articles',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("Stay Safe: Disaster Awareness Saves Lives!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: 'TN_HSDSdxGw',
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: 'Qp1f7rTJ2M4',
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: 'KwAKjtkpdP4',
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: '9WIwlljva_s',
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70, // Adjust width as needed
        height: 70, // Adjust height as needed
        child: FloatingActionButton(
          onPressed: () {
            // route to the add event page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatBot(),),
            );
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 4,
          heroTag: 'alertButton', // Specify a unique heroTag to avoid conflicts
          child: Icon(Icons.chat, size: 34),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            selectedIndex: _selectedIndex,
            backgroundColor: Colors.black,
            activeColor: Colors.white,
            color: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: EdgeInsets.all(12),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              GButton(
                icon: Icons.monetization_on_outlined,
                text: 'Donate',
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonationScreen()),
                  );
                },
              ),
              GButton(
                icon: Icons.add_chart_rounded,
                text: 'Awareness',
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AwarnessScreen()),
                  );
                },
              ),
              GButton(
                icon: Icons.home_work_outlined,
                text: 'Admin',
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminLogin()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
