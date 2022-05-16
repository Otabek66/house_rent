import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travelrent/screens/home/view/home_page.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await EasyLocalization.ensureInitialized();

runApp(EasyLocalization(child: MyApp(),
 supportedLocales: const[
   Locale('en', 'US'),
   Locale('uz', 'UZ'),
 ], 
 saveLocale: true,
 fallbackLocale: Locale('en', "US"),
 path: 'assets/lang'),

 );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale:  context.locale,
      home:  HomePage(),
    );
  }
}