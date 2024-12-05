import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'about_logic.dart';

class AboutPage extends GetView<AboutLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Clock style', 'Version'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(
          titles[index],
          style: const TextStyle(color: Colors.white),
        ),
        <Widget>[
          Visibility(
            visible: index == 0,
            child: Obx(() {
              return Text(
                controller.styles[controller.style.value],
                style: const TextStyle(color: Colors.white, fontSize: 14),
              );
            }),
          ),
          index == 0 ? const Icon(
            Icons.keyboard_arrow_right,
            size: 20,
            color: Colors.grey,
          ) : const Text('1.0.0',style: TextStyle(color: Colors.white)).paddingOnly(right: 8)
        ].toRow(mainAxisAlignment: MainAxisAlignment.end)
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.showStyleSelect(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ).gestures(onTap: () {
          Get.back(result: controller.style.value);
        }),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                _item(0, context),
                _item(1, context),
              ].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(
                color: const Color(0xff272727),
                borderRadius: BorderRadius.circular(12))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
