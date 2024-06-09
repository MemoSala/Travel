import 'package:get/get.dart';

import '../core/class/trip.dart';
import 'filters_controller.dart';

class CategoryTripsController extends GetxController {
  late String categoryTitle;
  List<Trip> displayTrips = [];

  @override
  void onInit() {
    final FiltersController filtersController = Get.find();
    final String categoryId = Get.arguments['id'];
    categoryTitle = Get.arguments['title']!;
    displayTrips = filtersController.chengeFilters
        .where((element) => element.categories.contains(categoryId))
        .toList();
    super.onInit();
  }
}
