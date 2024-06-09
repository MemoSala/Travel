import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/filters_controller.dart';
import '../../controller/home_controller.dart';
import '../../core/constant/app_data.dart';
import '../../core/constant/app_colors.dart';
import '../widgets/home/categories_item_home.dart';
import '../widgets/category_trips/trip_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    Get.put(FiltersController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('دليل سياحي'),
          bottom: const TabBar(
            indicatorColor: AppColors.golden,
            labelColor: AppColors.golden,
            tabs: [
              Tab(icon: Icon(Icons.dashboard), text: 'التصنيفات'),
              Tab(icon: Icon(Icons.star), text: 'المفضلة'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: controller.goToFilters,
              icon: const Icon(Icons.filter_list),
            ),
            IconButton(
              onPressed: controller.goToDeleted,
              icon: const Icon(Icons.delete_sweep_outlined),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: TabBarView(
          children: [
            GridView(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: categories_data
                  .map(
                    (categorieData) => CategoriesItemHome(
                      title: categorieData.title,
                      imageUrl: categorieData.imageUrl,
                      id: categorieData.id,
                    ),
                  )
                  .toList(),
            ),
            GetBuilder<HomeController>(
              builder: (controller) {
                if (controller.favorite.isEmpty) {
                  return const Center(
                    child: Text("ليس لديك اى رحلة فى قائمة المفضلات"),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.favorite.length,
                    itemBuilder: (context, index) {
                      return TripItem(id: controller.favorite[index]);
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
