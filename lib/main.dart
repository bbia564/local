import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_clock/pages/about/about_binding.dart';
import 'package:local_clock/pages/about/about_view.dart';
import 'package:local_clock/pages/about/monent.dart';
import 'package:local_clock/pages/local_clock/local_clock_binding.dart';
import 'package:local_clock/pages/local_clock/local_clock_view.dart';
import 'package:local_clock/pages/local_tools/local_tool_binding.dart';
import 'package:local_clock/pages/local_tools/local_tool_view.dart';

Color primaryColor = const Color(0xffe2ff00);
Color bgColor = const Color(0xfff8f8f8);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Clock,
      initialRoute: '/main',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Clock = [
  GetPage(name: '/main', page: () => const LocalToolView(), binding: LocalToolBinding()),
  GetPage(name: '/localClock', page: () => LocalClockPage(), binding: LocalClockBinding()),
  GetPage(name: '/monent', page: () => const Monent()),
  GetPage(name: '/about', page: () => AboutPage(), binding: AboutBinding())
];