import 'package:bluebit1/Widgets/event_card.dart';
import 'package:bluebit1/auth/mainpage.dart';
import 'package:bluebit1/pages/user/Awareness.dart';
import 'package:bluebit1/pages/admin/admin_login.dart';
import 'package:bluebit1/pages/user/donation_screen.dart';
import 'package:bluebit1/pages/ground_worker/user_event.dart';
import 'package:bluebit1/read%20data/get_user_name.dart';
import 'package:bluebit1/Widgets/timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../read data/event_data.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  List<EventData> events = [];
  List<EventData> filteredEvents = [];
  bool isLoading = true;
  TextEditingController _searchController = TextEditingController();

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
      filteredEvents = events; // Initialize filtered events with all events
      isLoading = false;
    });
  }

  void _filterEvents(String query) {
    setState(() {
      filteredEvents = events.where((event) => event.city.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            user!.email!,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
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
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 28.0,
              bottom: 12.0,
            ),
            child: TextField(
              controller: _searchController,
              onChanged: _filterEvents,
              decoration: InputDecoration(
                labelText: 'Search',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 8.0,
                  ),

                  child: Icon(Icons.search, color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  borderSide: BorderSide(
                    color: Colors.white, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                labelStyle: TextStyle(color: Colors.white), // Label text color
                fillColor: Colors.black, // Background color
                filled: true,
              ),
              style: TextStyle(color: Colors.white), // Text color
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                final eventIndex = filteredEvents.length - 1 - index; // Calculate the event index without reversing the entire list
                return TimeLine(
                  isFirst: index == 0, // Check if it's the first event
                  isLast: index == filteredEvents.length - 1, // Check if it's the last event
                  isPast: DateTime.now().isAfter(filteredEvents[eventIndex].time),
                  eventCard: EventCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${filteredEvents[eventIndex].title}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(right: 14.0),
                          child: Text(
                            'News: ${filteredEvents[eventIndex].news}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  emergencyNo: filteredEvents[eventIndex].emergencyNo,
                );
              },
            ),
          ),



          // want to add floating action button
          // FloatingActionButton(
          //   onPressed: () {
          //     AwesomeNotifications().createNotification(
          //       content: NotificationContent(
          //         id: 1,
          //         channelKey: 'basic_channel',
          //         title: 'Bluebit',
          //         body: 'New Event has been added',
          //         icon: 'resource://drawable/logo.png',
          //
          //         // Specify the name of your small icon file
          //       ),
          //     );
          //   },
          // )

        ],
      ),
      floatingActionButton: SizedBox(
        width: 70, // Adjust width as needed
        height: 70, // Adjust height as needed
        child: FloatingActionButton(
          onPressed: () {
            // route to the add event page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserEvents()),
            );
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 4,
          heroTag: 'alertButton', // Specify a unique heroTag to avoid conflicts
          child: Icon(Icons.add_alert, size: 34),
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
                  // Add any other logic you need
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
                text: 'Search',
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

