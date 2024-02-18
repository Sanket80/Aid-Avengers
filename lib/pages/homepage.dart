import 'package:bluebit1/auth/mainpage.dart';
import 'package:bluebit1/pages/Awarness.dart';
import 'package:bluebit1/pages/donation_screen.dart';
import 'package:bluebit1/read%20data/get_user_name.dart';
import 'package:bluebit1/read%20data/timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  List<String> docIds = [];
  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
      docIds.add(document.reference.id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            user!.email!,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              TimeLine(isFirst: true, isLast: false, isPast: true),
              TimeLine(isFirst: false, isLast: false, isPast: true),
              TimeLine(isFirst: false, isLast: true, isPast: false),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            backgroundColor: Colors.black,
            activeColor: Colors.white,
            color: Colors.white,
            tabBackgroundColor: Colors.grey.shade900,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(icon: Icons.home, text: 'Home',onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
              },),
              GButton(icon: Icons.monetization_on_outlined, text: 'Donate',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DonationScreen()));
                },),
              GButton(icon: Icons.search, text: 'Search',onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AwarnessScreen()));
              },),
              GButton(icon: Icons.settings,text: 'Settings',),
            ],),
        ),
      ),
    );
  }
}
