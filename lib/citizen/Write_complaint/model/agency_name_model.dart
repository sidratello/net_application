class AgencyNameModel {
  String? message;
  List<Agencies>? agencies;

  AgencyNameModel({this.message, this.agencies});

  AgencyNameModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['agencies'] != null) {
      agencies = <Agencies>[];
      json['agencies'].forEach((v) {
        agencies!.add(new Agencies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (agencies != null) {
      data['agencies'] = agencies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Agencies {
  int? id;
  String? agencyName;
  String? complaints;

  Agencies({this.id, this.agencyName, this.complaints});

  Agencies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyName = json['agencyName'];
    complaints = json['complaints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['agencyName'] = agencyName;
    data['complaints'] = complaints;
    return data;
  }
}
