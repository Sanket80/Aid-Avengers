import 'package:bluebit1/Widgets/donation_card.dart';
import 'package:bluebit1/auth/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DonationCard(
                title: 'Food',
                icon: Icons.food_bank_outlined,
                description: 'Fill plates, fill hearts: Donate food today!',
                totalDonationAmount: 100.0, // Example total donation amount
              ),
              DonationCard(
                title: 'Medical',
                icon: Icons.medical_services_outlined,
                description: 'Healing begins with your donation. Be the cure.',
                totalDonationAmount: 200.0, // Example total donation amount
              ),
              DonationCard(
                title: 'Rescue',
                icon: Icons.search,
                description: 'Rescue Ready: Providing Tools to Save the Day!',
                totalDonationAmount: 100.0, // Example total donation amount
              ),
              DonationCard(
                title: 'Clothes',
                icon: Icons.accessibility_new_rounded,
                description: 'Dress for Success: Donate Clothes, Empower Lives!',
                totalDonationAmount: 250.0, // Example total donation amount
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
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.settings,text: 'Settings',),
            ],),
        ),
      ),
    );
  }
}
