import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_calendar/widgets/calendar_column.dart';
import 'package:my_calendar/widgets/calendar_header.dart';

import 'data/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white54,
          child: Column(
            children: [
              //header
              Row(
                children: headings
                    .asMap()
                    .entries
                    .map((e) => CalendarHeaderCell(
                          label: e.value,
                          flex: e.key == 0 ? 1 : 2,
                        ))
                    .toList(),
              ),

              //body
              SizedBox(
                height: MediaQuery.of(context).size.height - CELL_HEIGHT,
                child: SingleChildScrollView(
                  child: Row(
                    children: headings.asMap().entries.map((e) {
                      var eventsOfDay = List.of(events);
                      eventsOfDay.shuffle();
                      var rnd = Random();
                      var start = rnd.nextInt(events.length);
                      return CalendarColumn(
                          index: e.key, events: eventsOfDay.sublist(start));
                    }).toList(),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
