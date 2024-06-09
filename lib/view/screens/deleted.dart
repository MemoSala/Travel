import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/class/trip.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_data.dart';

class Deleted extends StatelessWidget {
  const Deleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المحذوفات"),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        if (controller.deleted.isEmpty) {
          return const Center(
            child: Text("ليس لديك اى رحلة فى قائمة المحذوفات"),
          );
        } else {
          return ListView(
            children: controller.deleted.map((id) {
              Trip trip = trips_data.firstWhere((element) => element.id == id);
              return DeleredTile(
                trip: trip,
                onPressed: () => controller.removeDeleted(id),
              );
            }).toList(),
          );
        }
      }),
    );
  }
}

class DeleredTile extends StatelessWidget {
  const DeleredTile({super.key, required this.trip, required this.onPressed});

  final Trip trip;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        tileColor: AppColors.primary.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(trip.title),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.restore),
        ),
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(15),
            ),
            image: DecorationImage(
              image: NetworkImage(trip.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
