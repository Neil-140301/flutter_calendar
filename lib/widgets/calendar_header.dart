import 'package:flutter/material.dart';

class CalendarHeaderCell extends StatelessWidget {
  const CalendarHeaderCell({Key? key, required this.label, required this.flex})
      : super(key: key);

  final int flex;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade200, width: 0.5)),
        height: 50,
        child: Center(
            child: Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        )),
      ),
    );
  }
}
