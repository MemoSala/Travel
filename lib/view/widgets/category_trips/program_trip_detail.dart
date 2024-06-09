import 'package:flutter/material.dart';

class ProgramTripDetail extends StatelessWidget {
  const ProgramTripDetail({super.key, required this.program});

  final List<String> program;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: List.generate(
          program.length,
          (index) => ListTile(
            leading: CircleAvatar(
              child: Text(
                "اليوم ${index + 1}",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            title: Text(program[index]),
          ),
        ),
      ),
    );
  }
}
