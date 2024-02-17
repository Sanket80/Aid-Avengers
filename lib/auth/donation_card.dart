import 'package:flutter/material.dart';

class DonationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onPressed;
  final double totalDonationAmount; // Add total donation amount property

  const DonationCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.totalDonationAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // Adjust width for two cards in a row
      child: Card(
        margin: EdgeInsets.all(8),
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 50,
                    color: Colors.grey[800],
                  ),
                  SizedBox(width: 12),
                  Text(
                    title,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                'Total Donation: \$${totalDonationAmount.toStringAsFixed(2)}', // Show total donation amount
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              SizedBox(height: 12),
              Center(
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[700], // Background color of the button
                    onPrimary: Colors.white, // Text color of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // Border radius of the button
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32), // Adjust button padding
                  ),
                  child: Text(
                    'Donate Now',
                    style: TextStyle(fontSize: 18), // Adjust button text size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
