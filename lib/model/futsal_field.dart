class FutsalModel {
  String? message;
  List<Data>? data;
  int? statusCode;

  FutsalModel({this.message, this.data, this.statusCode});

  FutsalModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class Data {
  int? id;
  String? futsalName;
  String? futsalLocation;
  int? pricePerHour;
  String? facilities;

  Data(
      {this.id,
      this.futsalName,
      this.futsalLocation,
      this.pricePerHour,
      this.facilities});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    futsalName = json['futsalName'];
    futsalLocation = json['futsalLocation'];
    pricePerHour = json['pricePerHour'];
    facilities = json['facilities'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['futsalName'] = this.futsalName;
    data['futsalLocation'] = this.futsalLocation;
    data['pricePerHour'] = this.pricePerHour;
    data['facilities'] = this.facilities;
    return data;
  }
}
