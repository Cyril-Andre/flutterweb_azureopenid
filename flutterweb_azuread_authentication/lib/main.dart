import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterweb_azuread_authentication/helpers/globals.dart';

import 'widget/flutter_authentication_app.dart';

void main() {
  if (Uri.base.toString().contains("access_token=")) {
    var idxStart = Uri.base.toString().indexOf("access_token=") + "access_token=".length;
    var idxEnd = min(Uri.base.toString().length - 1, Uri.base.toString().indexOf("&token_type="));
    var accessToken = Uri.base.toString().substring(idxStart, idxEnd);
    Globals.instance.azureAccessToken = accessToken;
  }

  runApp(const FlutterAuthenticationApp());
}
