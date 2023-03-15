
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../utils/utils.dart';

class KTimeline extends StatelessWidget {
  const KTimeline({super.key, required this.status});
  final int status;

  applicationStatusTitle(status) {
    switch (status) {
      case "confirmed":
        return KStrings.confirmed;
      case "picked":
        return KStrings.picked;
      case "outForDelivery":
        return KStrings.outForDelivery;
      case "delivered":
        return KStrings.delivered;

      default:
        return KStrings.picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    const data = _TimelineStatus.values;

    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        direction: Axis.horizontal,
        connectorTheme: const ConnectorThemeData(
          thickness: 3.0,
          color: Color(0xffd3d3d3),
        ),
        indicatorTheme: const IndicatorThemeData(
          size: 15.0,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        contentsBuilder: (_, index) {
          return Text(
            applicationStatusTitle(data[index].toString().split('.').last),
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: context.color.onSurface,
            ),
            textAlign: TextAlign.center,
          );
        },
        connectorBuilder: (_, index, __) {
          if (index <= status - 2) {
            return SolidLineConnector(
              color: context.color.primary,
            );
          } else {
            return const SolidLineConnector();
          }
        },
        indicatorBuilder: (_, index) {
          if (index <= status - 1) {
            return DotIndicator(
              size: 30,
              color: context.color.primary,
              child: Icon(
                Icons.check,
                color: context.color.surface,
                size: 20.0,
              ),
            );
          } else {
            return const OutlinedDotIndicator(
              size: 30,
              color: Color(0xffbabdc0),
              backgroundColor: Color(0xffe6e7e9),
              child: Icon(
                Icons.sync,
                color: Colors.green,
                size: 20.0,
              ),
            );
          }
        },
        itemExtentBuilder: (_, __) => 100.0,
        itemCount: data.length,
      ),
    );
  }
}

enum _TimelineStatus {
  confirmed,
  picked,
  outForDelivery,
  delivered,
}

// extension on _TimelineStatus {
//   bool get isInProgress => this == _TimelineStatus.delivered;
// }
