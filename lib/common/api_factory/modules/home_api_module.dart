import 'package:odoo_common_code_latest/common/api_factory/api.dart';
import 'package:odoo_common_code_latest/common/api_factory/dio_factory.dart';
import 'package:odoo_common_code_latest/common/utils/utils.dart';
import 'package:odoo_common_code_latest/src/home/model/res_agenda_model.dart';

resAgendaApi(
    {
      required OnResponse<ResAgendaModel> onResponse,
    }
  ) {
  Api.callKW(
      model: 'commercial.water.mobile.api',
      method: 'get_generation_agenda',
      args: [],
      onResponse: (response){
        switch(response){
          case null:
            handleApiError('Respuesta nula del Servidor');
          break;
          default:
            if(response['state']=='ok'){
              onResponse(ResAgendaModel.fromJson(response));
            } else {
              showWarning(response['message']);
            }
          break;
        }
      },
      onError: (error, data){
        handleApiError(error);
      }
  );
}
