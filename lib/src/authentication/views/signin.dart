import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:odoo_common_code_latest/common/api_factory/modules/authentication_module.dart';
import 'package:odoo_common_code_latest/common/config/app_colors.dart';
import 'package:odoo_common_code_latest/common/config/localization/localize.dart';
import 'package:odoo_common_code_latest/common/utils/utils.dart';
import 'package:odoo_common_code_latest/common/widgets/custom_button.dart';
import 'package:odoo_common_code_latest/common/widgets/main_container.dart';
import 'package:odoo_common_code_latest/common/widgets/text_input.dart';
import 'package:odoo_common_code_latest/src/setting/controller/StoreServer.dart';
import 'package:odoo_common_code_latest/src/setting/view/Setting.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  final StoreServer settings = new StoreServer();
  final LocalStorage storage = new LocalStorage('settings');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      isAppBar: true,
      appBarTitle: Localize.signin.tr,
      padding: 20.0,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingView()),
            );
          },
          icon: Icon(Icons.settings),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          TextInput(
            textInputAction: TextInputAction.next,
            borderRadius: BorderRadius.circular(10.0),
            controller: _emailController,
            textInputType: TextInputType.text,
            hintText: Localize.email.tr,
          ),
          SizedBox(
            height: 12,
          ),
          TextInput(
            borderRadius: BorderRadius.circular(10.0),
            controller: _passCtrl,
            isPassword: true,
            hintText: Localize.password.tr,
          ),
          SizedBox(
            height: 17,
          ),
          SizedBox(
            height: 55,
            child: CustomButton(
              color: AppColors.orangeThemeColor,
              onPress: () {
                FocusManager.instance.primaryFocus!.unfocus();
                if (_emailController.text.isEmpty) {
                  showWarning("Usurio requerido");
                } else if (_passCtrl.text.isEmpty) {
                  showWarning("Contraseña requerida");
                } else {
                  if(settings.getUrl()!=""){
                    authenticationAPI(_emailController.text, _passCtrl.text);
                  }else{
                    final snackBar = SnackBar(
                      content: Text(
                        'Debe configurar los parámetros de conexión',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.deepOrange,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              child: Text(
                Localize.login.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
