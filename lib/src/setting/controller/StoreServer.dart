import 'package:localstorage/localstorage.dart';

class StoreServer {
  late String url     = "";
  late String server  = "";
  late String bd      = "";
  late String port    = "";
  late String _url    = "";

  getUrl(){
    final LocalStorage storage = new LocalStorage('settings');
    if(storage.getItem('settings')!=null){
      server = storage.getItem('settings');
      url = server.split(",")[0]+":"+server.split(",")[1]+"/";
      bd = server.split(",")[2];
    }
    return url;
  }
  getBd(){
    final LocalStorage storage = new LocalStorage('settings');
    if(storage.getItem('settings')!=null){
      server = storage.getItem('settings');
      bd = server.split(",")[2];
    }
    return bd;
  }
  getUrlA(){
    final LocalStorage storage = new LocalStorage('settings');
    if(storage.getItem('settings')!=null){
      server = storage.getItem('settings');
      _url = server.split(",")[0];
    }
    return _url;
  }
  getPort(){
    final LocalStorage storage = new LocalStorage('settings');
    if(storage.getItem('settings')!=null){
      server = storage.getItem('settings');
      port = server.split(",")[1];
    }
    return port;
  }

  save(String setting){
    final LocalStorage storage = new LocalStorage('settings');
    storage.setItem('settings', setting);
  }
}