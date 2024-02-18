import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final child;
  EventCard({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
          child: child,
      ),
    );
  }
}
