import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odoo_common_code_latest/common/api_factory/modules/authentication_module.dart';
import 'package:odoo_common_code_latest/common/utils/utils.dart';
import 'package:odoo_common_code_latest/common/widgets/main_container.dart';
import 'package:odoo_common_code_latest/common/config/localization/localize.dart';

var api_info = "";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    getVersionInfoAPI();
  }


  @override
  Widget build(BuildContext context) {
    return MainContainer(
      isAppBar: true,
      appBarTitle: Localize.home.tr,
      padding: 15.0,
      actions: [
        IconButton(
          onPressed: () {
            showLogoutDialog();
          },
          icon: Icon(Icons.exit_to_app),
        )
      ], child: Column(
      children: [
        Text('Te has autenticado en Odoo, ya puede comenzar a crear tu propia app.'),
      ],
    ),
    );
  }
}
