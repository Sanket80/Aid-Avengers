import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget eventCard;
  final String emergencyNo;

  const TimeLine({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCard,
    required this.emergencyNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle: const LineStyle(
            color: Colors.black87,
          ),
          indicatorStyle: IndicatorStyle(
            width: 18, // Adjust the width of the circle
            height: 18, // Adjust the height of the circle
            indicator: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, // Set the color of the circle
              ),
            ),
          ),
          endChild: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Emergency Number'),
                  content: Text('Call: $emergencyNo'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
            child: eventCard,
          ),
        ),
      ),
    );
  }
}
