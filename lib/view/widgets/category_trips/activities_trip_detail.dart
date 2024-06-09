import 'package:flutter/material.dart';

class ActivitiesTripDetail extends StatelessWidget {
  const ActivitiesTripDetail({super.key, required this.activities});

  final List<String> activities;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: List.generate(
          activities.length,
          (index) => Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Text(activities[index]),
            ),
          ),
        ),
      ),
    );
  }
}
