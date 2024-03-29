import 'package:bluebit1/auth/mainpage.dart';
import 'package:bluebit1/pages/user/Awareness.dart';
import 'package:bluebit1/pages/admin/admin_login.dart';
import 'package:bluebit1/pages/user/donation_screen.dart';
import 'package:bluebit1/pages/user/homepage.dart';
import 'package:bluebit1/pages/ground_worker/requests.dart';
import 'package:bluebit1/pages/ground_worker/user_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _emergencyNoController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String? _selectedDisaster;

  int _selectedIndex = 3;

  Future<void> addEvent() async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Adding Event'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Please wait...'),
                ],
              ),
            ),
          );
        },
      );

      // Format the current time as desired
      String formattedTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now());

      // Extract the selected type of disaster from the dropdown
      String selectedDisaster = _selectedDisaster ?? 'Other';

      await FirebaseFirestore.instance.collection('Events').add({
        'title': _titleController.text,
        'state': _stateController.text,
        'city': _cityController.text,
        'emergency_no': _emergencyNoController.text,
        'news': _descriptionController.text,
        'time': formattedTime, // Use the formatted time
        'type_of_disaster': selectedDisaster, // Add type of disaster to Firestore
      });

      Navigator.of(context).pop(); // Close the dialog
    } catch (error) {
      // Close the dialog
      Navigator.of(context).pop();

      // Display error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to add event. Please try again.'),
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

  // Want to Logout admin
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } catch (error) {
      // Display error message
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
                          // back button
                          Padding(
                            padding: const EdgeInsets.only(right: 58),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RequestPage()),
                                );
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Event Generation',
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
                    Row(
                      children: [
                        Flexible(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Please fill out the form below to report an incident or emergency. Your input will help us respond promptly',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black87,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Title',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: _stateController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black87,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              hintText: 'State',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: _cityController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black87,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              hintText: 'City',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black87,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Type of Disaster',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            items: <String>[
                              'Earthquake',
                              'Flood',
                              'Fire',
                              'Tsunami',
                              'Cyclone',
                              'Landslide',
                              'Drought',
                              'Pandemic',
                              'Other'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              _selectedDisaster = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _emergencyNoController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black87,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Emergency Number',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black87,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Description of Disaster',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: addEvent,
                              child: Text(
                                'Create Event',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
