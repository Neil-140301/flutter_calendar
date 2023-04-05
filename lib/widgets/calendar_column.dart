import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_calendar/widgets/calendar_cell.dart';
import 'package:my_calendar/widgets/calendar_event.dart';

class CalendarColumn extends StatelessWidget {
  const CalendarColumn({
    Key? key,
    required this.index,
    required this.events,
  }) : super(key: key);

  final int index;
  final List<Map<String, String>> events;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: index == 0 ? 1 : 2,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200, width: 0.5)),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                    children: List.generate(
                            24,
                            (index) =>
                                '${index % 12} ${index < 12 ? 'AM' : 'PM'}')
                        .map((e) => CalendarCell(
                              isTimeCell: index == 0,
                              time: e,
                            ))
                        .toList()),
                ...events
                    .map((e) => Visibility(
                          visible: index > 0,
                          child: CalendarEventCard(
                            title: e['title'] ?? '',
                            startTime: e['start_time'] ?? '',
                            endTime: e['end_time'] ?? '',
                            baseColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                          ),
                        ))
                    .toList()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
