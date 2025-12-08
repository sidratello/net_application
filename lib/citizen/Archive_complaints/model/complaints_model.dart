class ComplaintsModel {
  int? status;
  int? total;
  List<Complaints>? complaints;

  ComplaintsModel({this.status, this.total, this.complaints});

  ComplaintsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    total = json['total'];
    if (json['complaints'] != null) {
      complaints = <Complaints>[];
      json['complaints'].forEach((v) {
        complaints!.add(Complaints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['total'] = total;
    if (complaints != null) {
      data['complaints'] = complaints!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Complaints {
  int? id;
  String? date;
  String? governmentAgencyName;
  String? description;
  String? statusName;
  String? notes;

  Complaints({
    this.id,
    this.date,
    this.governmentAgencyName,
    this.description,
    this.statusName,
    this.notes,
  });

  Complaints.fromJson(Map<String, dynamic> json) {
    id = json['id'].toInt();
    date = json['date'];
    governmentAgencyName = json['governmentAgencyName'];
    description = json['description'];
    statusName = json['statusName'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id!.toInt();
    data['date'] = date;
    data['governmentAgencyName'] = governmentAgencyName;
    data['description'] = description;
    data['statusName'] = statusName;
    data['notes'] = notes;
    return data;
  }
}
