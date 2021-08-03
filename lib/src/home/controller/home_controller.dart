import 'package:get/get.dart';
import 'package:odoo_common_code_latest/common/api_factory/modules/home_api_module.dart';
import 'package:odoo_common_code_latest/common/utils/utils.dart';
import 'package:odoo_common_code_latest/src/home/model/res_agenda_model.dart';

class HomeController extends GetxController {
  var listOfAgenda = <Records>[].obs;

  getAgenda() {
    resAgendaApi(
      onResponse: (response) {
        listOfAgenda.assignAll(response.records!);
        print(response);
      },
    );
  }
}
