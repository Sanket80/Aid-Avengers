import 'package:bluebit1/Widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;

  const TimeLine({super.key,required this.isFirst,required this.isLast,required this.isPast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,

        beforeLineStyle: const LineStyle(
          color: Colors.grey,
        ),
        indicatorStyle: IndicatorStyle(
          width:40,
          color: Colors.black87,
          iconStyle: IconStyle(
            color: Colors.white,
            iconData: Icons.check,
          ),
        ),
        endChild: EventCard(),
      ),
    );
  }
}
