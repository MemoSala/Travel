// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/view/widgets/category_trips/trip_item.dart';

import '../../controller/category_trips_controller.dart';
import '../../controller/home_controller.dart';

class CategoryTrips extends StatelessWidget {
  const CategoryTrips({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryTripsController controller = Get.put(CategoryTripsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.categoryTitle),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: controller.displayTrips.length,
          itemBuilder: (context, index) => GetBuilder<HomeController>(
            builder: (homeController) {
              if (!homeController.isDelete(controller.displayTrips[index].id)) {
                return TripItem(id: controller.displayTrips[index].id);
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
