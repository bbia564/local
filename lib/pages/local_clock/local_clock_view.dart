import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:get/get.dart';
import 'package:local_clock/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'local_clock_logic.dart';

class LocalClockPage extends GetView<LocalClockLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: SafeArea(
            child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: GetBuilder<LocalClockLogic>(builder: (_) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                <Widget>[
                  <Widget>[
                    Visibility(
                        visible: controller.weatherIcon.isNotEmpty,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            primaryColor,
                            BlendMode.modulate,
                          ),
                          child:
                              Image.network('http:${controller.weatherIcon}'),
                        )),
                    Text(
                      controller.weatherCondition,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ].toColumn(),
                  <Widget>[
                    Text(
                      '${controller.temperature.toInt()}°C',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 37),
                    ),
                    Text(
                      '${controller.weekDayStr.value} ${controller.monthDayStr}',
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      controller.apmStr.value,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.end)
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                Container(
                  width: 310,
                  height: 310,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/icon${controller.type}.webp')),
                  ),
                  child: const AnalogClock(
                    dialColor: null,
                    centerPointColor: Colors.white,
                    hourNumberColor: null,
                    hourHandColor: Colors.white,
                    minuteHandColor: Colors.white,
                    secondHandColor: Colors.red,
                  ),
                ).marginSymmetric(vertical: 35),
                Text(
                  'Locations',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.city,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 58,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: <Widget>[
                    const Icon(
                      Icons.settings,
                      size: 25,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10,),
                   const Expanded(child: Text(
                      'Setting',
                      style: TextStyle(
                          color: Colors.white),
                    )),
                    const SizedBox(width: 10,),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      size: 25,
                      color: Colors.white,
                    )
                  ].toRow(),
                ).decorated(
                    color: const Color(0xff272727),
                    borderRadius: BorderRadius.circular(15)).gestures(onTap: (){
                      Get.toNamed('/about',arguments: controller.type)?.then((value) {
                        if (value != null) {
                          controller.type = value;
                          controller.update();
                        }
                      });
                })
              ].toColumn(),
            );
          }).marginAll(15),
        )),
      ),
    );
  }
}
