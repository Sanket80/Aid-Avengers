import 'package:bluebit1/Widgets/event_card.dart';
import 'package:bluebit1/auth/mainpage.dart';
import 'package:bluebit1/pages/Awarness.dart';
import 'package:bluebit1/pages/donation_screen.dart';
import 'package:bluebit1/read%20data/get_user_name.dart';
import 'package:bluebit1/read%20data/timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../read data/event_data.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  List<EventData> events = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEventsData();
  }

  Future<void> fetchEventsData() async {
    final eventsCollection = FirebaseFirestore.instance.collection('Events');
    final snapshot = await eventsCollection.get();
    final List<EventData> loadedEvents = [];

    snapshot.docs.forEach((doc) {
      final eventData = EventData(
        state: doc['state'],
        city: doc['city'],
        emergencyNo: doc['emergency_no'],
        time: DateTime.parse(doc['time']),
        news: doc['news'],
        title: doc['title'],
      );
      loadedEvents.add(eventData);
    });

    loadedEvents.sort((a, b) => a.time.compareTo(b.time));

    setState(() {
      events = loadedEvents;
      isLoading = false;
    });
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return TimeLine(
            isFirst: index == 0,
            isLast: index == events.length - 1,
            isPast: DateTime.now().isAfter(events[index].time),
            eventCard: EventCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      '${events[index].title}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'News: ${events[index].news}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ), emergencyNo: events[index].emergencyNo,
          );
        },
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
              GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
              ),
              GButton(
                icon: Icons.monetization_on_outlined,
                text: 'Donate',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonationScreen()),
                  );
                },
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AwarnessScreen()),
                  );
                },
              ),
              GButton(icon: Icons.settings, text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}

