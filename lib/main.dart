import 'package:flutter/material.dart';
import 'package:odoo_common_code_latest/common/app.dart';
import 'package:odoo_common_code_latest/common/config/prefs/pref_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await PrefUtils.getIsLoggedIn();
  runApp(App(isLoggedIn));
}