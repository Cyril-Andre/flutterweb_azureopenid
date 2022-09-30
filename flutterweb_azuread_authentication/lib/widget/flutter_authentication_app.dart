import 'package:flutter/material.dart';
import 'package:flutterweb_azuread_authentication/helpers/globals.dart';

import 'authenticate.dart';
import 'main_app.dart';

class FlutterAuthenticationApp extends StatefulWidget {
  const FlutterAuthenticationApp({super.key});

  @override
  State<FlutterAuthenticationApp> createState() => _FlutterAuthenticationAppState();
}

class _FlutterAuthenticationAppState extends State<FlutterAuthenticationApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: 
      {
        "/":(context)=>Globals.instance.azureAccessToken==""?const Authenticate():const MainApp(),
        }
    )
    ;
  }
}