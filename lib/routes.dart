import 'package:get/get.dart';

import 'core/constant/app_routes.dart';
import 'view/screens/category_trips.dart';
import 'view/screens/deleted.dart';
import 'view/screens/filters.dart';
import 'view/screens/home.dart';
import 'view/screens/trip_detail.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: AppRoutes.home, page: () => const Home()),
  GetPage(name: AppRoutes.filters, page: () => const Filters()),
  GetPage(name: AppRoutes.categoryTrips, page: () => const CategoryTrips()),
  GetPage(name: AppRoutes.tripDetail, page: () => const TripDetail()),
  GetPage(name: AppRoutes.deleted, page: () => const Deleted()),
];
