class ResAgendaModel {
  List<Records>? records;
  ResAgendaModel({this.records});

  ResAgendaModel.fromJson(dynamic json) {
    if (json["data"] != null) {
      records = [];
      json["data"].forEach((v) {
        records?.add(Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (records != null) {
      map["records"] = records?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Records {
  int? code;
  String? date;
  String? plan;

  Records({this.code, this.date, this.plan});

  Records.fromJson(dynamic json) {
    code = json[0];
    date = json[1];
    plan = json[2];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["date"] = date;
    map["plan"] = plan;
    return map;
  }
}