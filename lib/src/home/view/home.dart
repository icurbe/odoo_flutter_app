import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odoo_common_code_latest/common/utils/utils.dart';
import 'package:odoo_common_code_latest/common/widgets/main_container.dart';
import 'package:odoo_common_code_latest/src/home/controller/home_controller.dart';
import 'package:odoo_common_code_latest/common/config/localization/localize.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _homeController = Get.put(HomeController());
  String txt='';

  @override
  void initState() {
    super.initState();
    _homeController.getAgenda();
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
      ],
      child:
      Obx(
        () {
          return ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: _homeController.listOfAgenda.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0.1,
                margin: EdgeInsets.all(1),
                child: ListTile(
                  contentPadding: EdgeInsets.all(7),
                  leading: CircleAvatar(
                    child: Image.asset(
                      'assets/images/icon_1.png',
                      width: 58,
                      fit: BoxFit.cover,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  title: Text(_homeController.listOfAgenda[index].code!.toString()),
                  trailing: Icon(Icons.arrow_forward_ios),
                  subtitle: Text(_homeController.listOfAgenda[index].date!+"\n"+_homeController.listOfAgenda[index].plan!),
                )
              );
            },
          );
        },
      ),
    );
  }
}
