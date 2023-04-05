import 'package:flutter/material.dart';
import 'package:my_calendar/data/constants.dart';

class CalendarEventCard extends StatelessWidget {
  const CalendarEventCard({
    Key? key,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.baseColor,
  }) : super(key: key);

  final String title;
  final String startTime;
  final String endTime;
  final MaterialColor baseColor;

  getTop() {
    var hour = double.tryParse(startTime.split(":").first) ?? 0;
    var min = double.tryParse(startTime.split(":").last) ?? 0;
    return hour * CELL_HEIGHT + CELL_HEIGHT / 2 + min;
  }

  getBottom() {
    var hour = double.tryParse(endTime.split(":").first) ?? 0;
    var min = double.tryParse(endTime.split(":").last) ?? 0;
    return (23 - hour) * CELL_HEIGHT + CELL_HEIGHT / 2 - min;
  }

  getHeight() {
    var start =
        (double.tryParse(startTime.split(":").first) ?? 0) * CELL_HEIGHT +
            (double.tryParse(startTime.split(":").last) ?? 0);
    var end = (double.tryParse(endTime.split(":").first) ?? 0) * CELL_HEIGHT +
        (double.tryParse(endTime.split(":").last) ?? 0);
    return end - start;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: getTop(),
      bottom: getBottom(),
      left: 10,
      right: 10,
      child: Container(
        decoration: BoxDecoration(
            color: baseColor, borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 4),
                child: Text(startTime,
                    style: const TextStyle(fontSize: 12, color: Colors.white)),
              ),
              Container(
                width: double.infinity,
                height: getHeight() - 25,
                decoration: BoxDecoration(
                    color: baseColor.shade300,
                    borderRadius: const BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(10),
                        bottomEnd: Radius.circular(10))),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
