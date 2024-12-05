import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutLogic extends GetxController {
  List<String> styles = ['One', 'Two', 'Three', 'Four', 'Five'];

  int type = Get.arguments;

  RxInt style = 0.obs;

  void showStyleSelect(BuildContext context) {
    BottomPicker(
      pickerTitle: const Text(
        'Clock style select',
        textAlign: TextAlign.center,
      ),
      items: styles.map((e) => Text(e)).toList(),
      displayCloseIcon: false,
      displaySubmitButton: false,
      dismissable: true,
      onChange: (index) {
        style.value = index;
      },
    ).show(context);
  }

  aboutLocalPrivacy(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Privacy Policy"),
          ),
          body: const Markdown(data: """
#### Data Collection
Our apps do not collect any personal information or user data. All event logs are executed locally on the device and are not transmitted to any external server.

#### Cookie Usage
Our app does not use any form of cookies or similar technologies to track user behavior or personal information.

#### Data Security
User input data is only used for calculations on the user's device and is not stored or transmitted. We are committed to ensuring the security of user data.

#### Contact Information
If you have any questions or concerns about our privacy policy, please contact us via email.
          """),
        );
      },
    );
  }

  aboutLocalUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 79,
        height: 79,
      ),
      children: [
        const Text(
            """We can provide you with the current city time and weather"""),
      ],
      context: context,
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    style.value = type;
    super.onInit();
  }
}
