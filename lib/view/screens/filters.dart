// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/filters_controller.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    FiltersController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلترة'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: controller.saveFilters,
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(height: 50),
        Expanded(
          child: GetBuilder<FiltersController>(builder: (controller) {
            return ListView(children: [
              buildSwitchListTile(
                "الرحلات الصيفية",
                "إظهر الرحلات فى فصل الصيف",
                controller.summer,
                controller.summerUpdata,
              ),
              buildSwitchListTile(
                "الرحلات فصل الربيع",
                "إظهر الرحلات فى فصل الربيع",
                controller.spring,
                controller.springUpdata,
              ),
              buildSwitchListTile(
                "الرحلات الشتوية",
                "إظهر الرحلات فى فصل الشتاء",
                controller.winter,
                controller.winterUpdata,
              ),
              buildSwitchListTile(
                "الرحلات فصل الخريف",
                "إظهر الرحلات فى فصل الخريف",
                controller.autumn,
                controller.autumnUpdata,
              ),
              buildSwitchListTile(
                "للعائلات",
                "إظهر الرحلات المخصصه للعائلات",
                controller.family,
                controller.familyUpdata,
              ),
            ]);
          }),
        ),
      ]),
    );
  }

  SwitchListTile buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    void Function(bool) updeteValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updeteValue,
    );
  }
}
