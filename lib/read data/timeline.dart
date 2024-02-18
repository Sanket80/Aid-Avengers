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
            width: 40,
            color: Colors.black87,
            iconStyle: IconStyle(
              color: Colors.white,
              iconData: Icons.call,
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
