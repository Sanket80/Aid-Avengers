import 'package:flutter/material.dart';
import '../pages/user/payment_screen.dart';

class DonationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double totalDonationAmount; // Add total donation amount property

  DonationCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.totalDonationAmount,
  }) : super(key: key);

  // Manually add names and donation amounts for demonstration
  final List<String> donorNames = ['Sanket Kadam', 'Mithilesh Rajput', 'Swapnil Kapale'];
  final List<double> donationAmounts = [500.0, 1000.0, 750.0];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        margin: EdgeInsets.all(8),
        color: Color.fromRGBO(255, 255, 238, 1.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Icon(
                      icon,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\₹${totalDonationAmount.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      Text(
                        'Total Donation',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showDonationsDialog(context);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${donationAmounts.length}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        Text(
                          'No. of Donations',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 52),
                ),
                child: Text(
                  'Donate Now',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to show donations dialog
  void _showDonationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Donations'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              donorNames.length,
                  (index) => ListTile(
                title: Text('${donorNames[index]}'),
                subtitle: Text('Amount: \$${donationAmounts[index].toStringAsFixed(2)}'),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
