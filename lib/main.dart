import 'package:client/core/core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'app_module.dart';

void main() {

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context){
        return ModularApp(module: AppModule(),);
      },
    ));

}

class App extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      // builder: DevicePreview.appBuilder,
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Color(0xFFF5F5F5)));
          },
          theme: AppTheme.getTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: Modular.initialRoute,
          navigatorKey: Modular.navigatorKey,
          onGenerateRoute: Modular.generateRoute,
      
    );
  }
}
