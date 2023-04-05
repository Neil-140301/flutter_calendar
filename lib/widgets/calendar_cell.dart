import 'package:flutter/material.dart';
import 'package:my_calendar/data/constants.dart';

class CalendarCell extends StatelessWidget {
  const CalendarCell({Key? key, this.isTimeCell = false, this.time = ''})
      : super(key: key);

  final bool isTimeCell;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: CELL_HEIGHT,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200, width: 0.5)),
        child: isTimeCell
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  time,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
              )
            : Container(
                width: double.infinity,
                height: 0.5,
                color: Colors.grey.shade200,
              ));
  }
}
