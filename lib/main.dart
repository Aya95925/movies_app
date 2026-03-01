import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movies/ui/utils/app_routes.dart';

void main() {
  // وظيفته تجهيز محرك فلاتر والاتصال بنظام التشغيل قبل بدء التطبيق.
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // وظيفته تجميد شاشة  (Splash) ومنعها من الاختفاء تلقائياً.
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,

      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
