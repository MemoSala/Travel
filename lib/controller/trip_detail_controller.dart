import 'package:get/get.dart';
import 'package:travel/controller/home_controller.dart';

import '../core/class/trip.dart';
import '../core/constant/app_data.dart';

class TripDetailController extends GetxController {
  final HomeController homeController = Get.find();
  double valueAnimation = 0;
  late Trip selectedTrip;
  late String id;
  @override
  void onInit() {
    id = Get.arguments as String;
    selectedTrip = trips_data.firstWhere((element) => element.id == id);
    super.onInit();
  }

  void animation() {
    if (valueAnimation == 0) {
      valueAnimation = 1;
    } else {
      valueAnimation = 0;
    }
    update();
  }

  void addFavorite() => homeController.addFavorite(id);
  void addDeleted() => homeController.addDeleted(id);
}
