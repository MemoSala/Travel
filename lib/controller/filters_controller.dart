import 'package:get/get.dart';

import '../core/class/trip.dart';
import '../core/constant/app_data.dart';

class FiltersController extends GetxController {
  bool summer = true,
      winter = true,
      autumn = true,
      spring = true,
      family = false,
      summerActive = true,
      winterActive = true,
      autumnActive = true,
      springActive = true,
      familyActive = false;

  List<Trip> get chengeFilters {
    return trips_data
        .where((trip) =>
            ((summerActive && trip.isInSummer) ||
                (winterActive && trip.isInWinter) ||
                (autumnActive && trip.isInAutumn) ||
                (springActive && trip.isInSpring)) &&
            ((familyActive && trip.isForFamilies) || !familyActive))
        .toList();
  }

  void saveFilters() {
    summerActive = summer;
    winterActive = winter;
    autumnActive = autumn;
    springActive = spring;
    familyActive = family;
  }

  void summerUpdata(bool newValue) {
    summer = newValue;
    update();
  }

  void winterUpdata(bool newValue) {
    winter = newValue;
    update();
  }

  void autumnUpdata(bool newValue) {
    autumn = newValue;
    update();
  }

  void springUpdata(bool newValue) {
    spring = newValue;
    update();
  }

  void familyUpdata(bool newValue) {
    family = newValue;
    update();
  }
}
