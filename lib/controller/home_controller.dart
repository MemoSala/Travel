import 'package:get/get.dart';

import '../core/constant/app_routes.dart';
import '../data/data source/sql_db.dart';
import '../data/data source/table.dart';

class HomeController extends GetxController {
  late List<String> _favoriteTrips;
  late List<String> _deletedTrips;
  final SqlDB sqlDB = SqlDB();
  @override
  void onInit() async {
    _favoriteTrips = (await sqlDB.readData(from: TABLE.favorite))
        .map((e) => e["id"] as String)
        .toList();
    _deletedTrips = (await sqlDB.readData(from: TABLE.deleted))
        .map((e) => e["id"] as String)
        .toList();
    super.onInit();
  }

  void addFavorite(String id) async {
    if (_favoriteTrips.any((element) => element == id)) {
      int isGood = await sqlDB.deleteData(value: id, from: TABLE.favorite);
      if (isGood != 0) {
        _favoriteTrips.remove(id);
        update();
      }
    } else {
      int isGood = await sqlDB.insertData(value: id, from: TABLE.favorite);
      if (isGood != 0) {
        _favoriteTrips.add(id);
        update();
      }
    }
  }

  void addDeleted(String id) async {
    int isGood = await sqlDB.insertData(value: id, from: TABLE.deleted);
    if (isGood != 0) {
      _deletedTrips.add(id);
      Get.back();
      update();
    }
  }

  void removeDeleted(String id) async {
    int isGood = await sqlDB.deleteData(value: id, from: TABLE.deleted);
    if (isGood != 0) {
      _deletedTrips.remove(id);
      update();
    }
  }

  bool isFovarite(String id) => _favoriteTrips.any((element) => element == id);
  bool isDelete(String id) => _deletedTrips.any((element) => element == id);

  List<String> get favorite => _favoriteTrips
      .where((fav) => !_deletedTrips.any((ele) => fav == ele))
      .toList();

  List<String> get deleted => _deletedTrips;

  void goToFilters() => Get.toNamed(AppRoutes.filters);
  void goToDeleted() => Get.toNamed(AppRoutes.deleted);
}
