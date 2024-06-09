import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../controller/trip_detail_controller.dart';
import '../../core/constant/app_colors.dart';
import '../../core/functions/animation_color.dart';
import '../widgets/category_trips/activities_trip_detail.dart';
import '../widgets/category_trips/image_trip_detail.dart';
import '../widgets/category_trips/program_trip_detail.dart';
import '../widgets/category_trips/title_trip_detail.dart';
import '../widgets/trip_detail/action_button_trip_detail.dart';

class TripDetail extends StatelessWidget {
  const TripDetail({super.key});
  @override
  Widget build(BuildContext context) {
    TripDetailController controller = Get.put(TripDetailController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.selectedTrip.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ImageTripDetail(imageUrl: controller.selectedTrip.imageUrl),
          const SizedBox(height: 10),
          const TitleTripDetail('الانشطة'),
          ActivitiesTripDetail(activities: controller.selectedTrip.activities),
          const TitleTripDetail('البرنامج اليومى'),
          ProgramTripDetail(program: controller.selectedTrip.program),
          const SizedBox(height: 20),
        ]),
      ),
      floatingActionButton: GetBuilder<TripDetailController>(
        builder: (controller) => TweenAnimationBuilder(
          duration: const Duration(milliseconds: 300),
          curve: const Interval(0.0, 0.75, curve: Curves.easeOut),
          tween: Tween<double>(begin: 0.0, end: controller.valueAnimation),
          builder: (context, value, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ActionButtonTripDetail(
                name: "Like",
                index: 2,
                valueAnimation: value,
                onPressed: controller.addFavorite,
                icon: GetBuilder<HomeController>(
                  builder: (homeController) => Icon(
                    homeController.isFovarite(controller.id)
                        ? Icons.star
                        : Icons.star_border,
                  ),
                ),
              ),
              ActionButtonTripDetail(
                name: "Delete",
                index: 1,
                valueAnimation: value,
                onPressed: controller.addDeleted,
                icon: const Icon(Icons.delete),
              ),
              ActionButtonTripDetail(
                name: "Toggle",
                index: 0,
                onPressed: controller.animation,
                backgroundColor: animationColor(
                  value,
                  AppColors.red,
                  AppColors.primary,
                ),
                borderRadius: 16 + 16 * (1 - value),
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: AlwaysStoppedAnimation<double>(value),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
