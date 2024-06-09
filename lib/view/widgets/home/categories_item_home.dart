import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_routes.dart';

class CategoriesItemHome extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  selectCategory(context) {
    Get.toNamed(AppRoutes.categoryTrips, arguments: {'id': id, 'title': title});
  }

  const CategoriesItemHome({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          )
        ],
      ),
    );
  }
}
