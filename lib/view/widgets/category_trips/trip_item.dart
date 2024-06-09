import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/core/class/trip.dart';

import '../../../core/constant/app_data.dart';
import '../../../core/constant/app_routes.dart';

class TripItem extends StatelessWidget {
  final String id;

  const TripItem({super.key, required this.id});
  Trip get _trip => trips_data.firstWhere((element) => element.id == id);

  String get seasonText {
    switch (_trip.season) {
      case Season.Winter:
        return "شتاء";
      case Season.Spring:
        return "ربيع";
      case Season.Summer:
        return "صيف";
      case Season.Autumn:
        return "خريف";
    }
  }

  String get tripTypeText {
    switch (_trip.tripType) {
      case TripType.Exploration:
        return "أستكشاف";
      case TripType.Recovery:
        return "نقاهة";
      case TripType.Activities:
        return "أنشطة";
      case TripType.Therapy:
        return "معالجه";
    }
  }

  @override
  Widget build(BuildContext context) {
    selectTrip(context) {
      Get.toNamed(AppRoutes.tripDetail, arguments: id);
    }

    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.network(
                    _trip.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.9),
                      ],
                      stops: const [0.6, 1],
                    ),
                  ),
                  child: Text(
                    _trip.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ist(context, Icons.today, '${_trip.duration} أيام'),
                  ist(context, Icons.wb_sunny, seasonText),
                  ist(context, Icons.family_restroom, tripTypeText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row ist(context, icon, text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}
