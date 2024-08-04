class challengeHistory {
  String? message;
  List<Data>? data;
  int? statusCode;

  challengeHistory({this.message, this.data, this.statusCode});

  challengeHistory.fromJson(Map<String, dynamic> json) {
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
  int? bookingId;
  // String? acceptedBy;
  String? futsalName;
  String? fieldImage;
  String? futsalLocation;
  int? pricePerHour;
  String? challengeStatus;
  String? usernameHash;
  String? bookingDate;
  String? startTime;
  String? endTime;
  String? bookingStatus;

  Data(
      {this.id,
      this.bookingId,
      // this.acceptedBy,
      this.futsalName,
      this.fieldImage,
      this.futsalLocation,
      this.pricePerHour,
      this.challengeStatus,
      this.usernameHash,
      this.bookingDate,
      this.startTime,
      this.endTime,
      this.bookingStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['bookingId'];
    // acceptedBy = json['acceptedBy'];
    futsalName = json['futsalName'];
    fieldImage = json['fieldImage'];
    futsalLocation = json['futsalLocation'];
    pricePerHour = json['pricePerHour'];
    challengeStatus = json['challengeStatus'];
    usernameHash = json['usernameHash'];
    bookingDate = json['bookingDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    bookingStatus = json['bookingStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookingId'] = this.bookingId;
    // data['acceptedBy'] = this.acceptedBy ;
    data['futsalName'] = this.futsalName;
    data['fieldImage'] = this.fieldImage;
    data['futsalLocation'] = this.futsalLocation;
    data['pricePerHour'] = this.pricePerHour;
    data['challengeStatus'] = this.challengeStatus;
    data['usernameHash'] = this.usernameHash;
    data['bookingDate'] = this.bookingDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['bookingStatus'] = this.bookingStatus;
    return data;
  }
}
