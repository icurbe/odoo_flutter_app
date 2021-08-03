import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart';
import 'package:odoo_common_code_latest/src/setting/controller/StoreServer.dart';
StoreServer settings = new StoreServer();
class Config {
  Config._();

  ///Odoo URLs
  static  String OdooDevURL  = "";
  //static String OdooProdURL =  settings.getUrl();//"http://erp.emsaba.gob.ec:8069/";
  static  String OdooUATURL  = "";
  //static const String OdooProdURL = "http://186.33.164.198:8069/";

  /// SelfSignedCert:
  static const selfSignedCert = false;

  /// API Config
  static const timeout = 500000;
  static const logNetworkRequest = true;
  static const logNetworkRequestHeader = true;
  static const logNetworkRequestBody = true;
  static const logNetworkResponseHeader = false;
  static const logNetworkResponseBody = true;
  static const logNetworkError = true;

  /// Localization Config
  static const supportedLocales = <Locale>[Locale('en', ''), Locale('pt', '')];

  /// Common Const
  static const actionLocale = 'locale';
  static const int SIGNUP = 0;
  static const int SIGNIN = 1;
  static const String CURRENCY_SYMBOL = "€";
  static String FCM_TOKEN = "";

  static getUrlConfig(){
    return settings.getUrl();
  }

  static getDbConfig(){
    return settings.getBd();
  }
}
