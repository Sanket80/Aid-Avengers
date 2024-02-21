import 'package:bluebit1/Widgets/donation_card.dart';
import 'package:bluebit1/auth/mainpage.dart';
import 'package:bluebit1/pages/user/homepage.dart';
import 'package:bluebit1/pages/user/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Awareness.dart';
import '../admin/admin_login.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  int _selectedIndex = 1;

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
                totalDonationAmount: 10000.0, // Example total donation amount
              ),
              DonationCard(
                title: 'Medical',
                icon: Icons.medical_services_outlined,
                description: 'Healing begins with your donation. Be the cure.',
                totalDonationAmount: 15000.0, // Example total donation amount
              ),
              DonationCard(
                title: 'Rescue',
                icon: Icons.search,
                description: 'Rescue Ready: Providing Tools to Save the Day!',
                totalDonationAmount: 18000.0, // Example total donation amount
              ),
              DonationCard(
                title: 'Clothes',
                icon: Icons.accessibility_new_rounded,
                description: 'Dress for Success: Donate Clothes, Empower Lives!',
                totalDonationAmount: 2500.0, // Example total donation amount
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
