import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intertoons/screens/cart/provider/cart_provider.dart';
import 'package:intertoons/screens/fullview/provider/details.dart';
import 'package:intertoons/screens/home/provider/home_provider.dart';
import 'package:intertoons/screens/mainhome/provider/main_provider.dart';
import 'package:intertoons/screens/mainhome/view/mainhome.dart';
import 'package:intertoons/utils/theme/them.dart';
import 'package:provider/provider.dart';

void main() {
   //=======landscap rotation lock=========//
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(
    providers:  [
      ChangeNotifierProvider(create: (_)=>HomeProvider()),
      ChangeNotifierProvider(create: (_) => MainHomeProvider()),
      ChangeNotifierProvider(create: (_)=>DeatilsProvider()),
      ChangeNotifierProvider(create: (_)=>CartProvder())
    ],
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,index) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.theme,
          home:  MainHome(),
        );
      }
      ,designSize: const Size(375, 812),
    );
  }
}
