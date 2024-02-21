import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  final String title;
  final String description;
  final String city;
  final String state;
  final String time;

  const AlertCard({
    required this.title,
    required this.description,
    required this.city,
    required this.state,
    required this.time,
  });

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '$city, $state',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                'Time: $time',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // Set text color to black
                      side: BorderSide(color: Colors.black), // Add black border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 36),
                    ),
                    child: Text(
                      'Reject',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 36),
                    ),
                    child: Text(
                      'Approve',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
