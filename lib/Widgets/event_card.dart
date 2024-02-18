import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final child;
  EventCard({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
          child: child,
      ),
    );
  }
}
