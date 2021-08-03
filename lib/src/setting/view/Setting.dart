
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:odoo_common_code_latest/common/api_factory/dio_factory.dart';
import 'package:odoo_common_code_latest/common/config/prefs/pref_utils.dart';
import 'package:odoo_common_code_latest/common/utils/utils.dart';
import 'package:odoo_common_code_latest/common/widgets/main_container.dart';
import 'package:odoo_common_code_latest/src/setting/controller/StoreServer.dart';

class SettingView extends StatefulWidget {

  // Defined Constructor
  @override
  _SettingState createState()  => _SettingState();
}

class _SettingState extends State<SettingView> {
  final TextEditingController _urlController  = TextEditingController();
  final TextEditingController _portController = TextEditingController();
  final TextEditingController _baseController = TextEditingController();
  final LocalStorage storage      = new LocalStorage('old');
  final StoreServer  settings     = new StoreServer();

  @override
  void initState() {
    super.initState();
    _urlController.text = settings.getUrlA();
    _portController.text = settings.getPort();
    _baseController.text = settings.getBd();
  }

  _inin() async {
    if(storage.getItem('old')!=null){
      DioFactory.dio!.close();
      DioFactory.dio!.clear();
    }
    DioFactory.initialiseHeaders(await PrefUtils.getToken());
    initState(){
      storage.setItem('old', true);
    }
  }


  @override
  Widget build(BuildContext context) {
    return MainContainer(
        isAppBar: true,
        appBarTitle: 'Configuración',
        padding: 10.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
            hideLoading()
          }
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(
          height: 4,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 20,
          color: Colors.grey[200],
          child: Text(
            "Configuracion de la Conexión",
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextFormField(
          controller:_urlController,
          decoration: const InputDecoration(
            icon: Icon(Icons.web),
            labelText:  'Dirección del Servidor',
          ),
        ),
          TextFormField(
            controller:_portController,
            decoration: const InputDecoration(
              icon: Icon(Icons.settings_ethernet_outlined),
              labelText:  'Puerto',
            ),
          ),
          TextFormField(
            controller:_baseController,
            decoration: const InputDecoration(
              icon: Icon(Icons.cloud),
              labelText:  'Base de Datos',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return 16;
                    return 1;
                  }),
            ),
            onPressed: () {
              if(_urlController.text.isNotEmpty){
                if(_portController.text.isNotEmpty){
                  if(_baseController.text.isNotEmpty){
                    settings.save(_urlController.text+','+_portController.text+','+_baseController.text);
                    _inin();
                    final snackBar = SnackBar(
                      content: Text(
                        'Se guardó la configuración',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{
                    showWarning("La Base de Datos es requerida");
                  }
                }else{
                  showWarning("El puerto es requerida");
                }
              }else{
                showWarning("La url es requerida");
              }
            },
            child: Text('Guardar Configuración',
              style: TextStyle(
                color: Colors.white)
            ),
          )
      ]
    ));
  }
}