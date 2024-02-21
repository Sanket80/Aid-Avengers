import 'package:bluebit1/Widgets/alert_card.dart';
import 'package:bluebit1/auth/mainpage.dart';
import 'package:bluebit1/pages/admin/add_event.dart';
import 'package:bluebit1/pages/admin/admin_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  int _selectedIndex = 0;
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to sign out. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 16,
                  top: 8,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'Aid Avengers',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // logout button
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              logout();
                            },
                            icon: Icon(Icons.logout),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Alerts Generated',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    // Add StreamBuilder here
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Alerts')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(); // Placeholder widget while loading
                        }
                        if (snapshot.hasError) {
                          return Text(
                              'Error: ${snapshot.error}'); // Error handling
                        }
                        // If data is available
                        final alerts = snapshot.data!.docs;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: alerts.length,
                          itemBuilder: (context, index) {
                            final alertData =
                                alerts[index].data() as Map<String, dynamic>;
                            return AlertCard(
                              title: alertData['title'] ?? '',
                              description: alertData['description'] ?? '',
                              city: alertData['city'] ?? '',
                              state: alertData['state'] ?? '',
                              time: alertData['time'] ?? '',
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
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
              MaterialPageRoute(builder: (context) => AddEvent()),
            );
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 4,
          heroTag: 'alertButton', // Specify a unique heroTag to avoid conflicts
          child: Icon(Icons.add_alert, size: 34),
        ),
      ),
    );
  }
}
