class BookingModel {
  String? message;
  List<Data>? data;
  int? statusCode;

  BookingModel({this.message, this.data, this.statusCode});

  BookingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(
            v)); //create a new Data object using Data.fromJson and add it to the data list.
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this
          .data!
          .map((v) => v.toJson())
          .toList(); //Converting Data List to JSON
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class Data {
  int? id;
  String? usernameHash;
  int? futsalId;
  String? bookingDate;
  String? startTime;
  String? endTime;
  String? bookingStatus;
  String? futsalName;

  Data(
      {this.id,
      this.usernameHash,
      this.futsalId,
      this.bookingDate,
      this.startTime,
      this.endTime,
      this.bookingStatus,
      this.futsalName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usernameHash = json['usernameHash'];
    futsalId = json['futsalId'];
    bookingDate = json['bookingDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    bookingStatus = json['bookingStatus'];
    futsalName = json['futsalName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usernameHash'] = this.usernameHash;
    data['futsalId'] = this.futsalId;
    data['bookingDate'] = this.bookingDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['bookingStatus'] = this.bookingStatus;
    data['futsalName'] = this.futsalName;
    return data;
  }
}
