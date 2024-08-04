class ChallengeModel {
  String? message;
  List<Data>? data;
  int? statusCode;

  ChallengeModel({this.message, this.data, this.statusCode});

  ChallengeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v)); //create a new Data object using Data.fromJson and add it to the data list.
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList(); //Converting Data List to JSON
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class Data {
  int? id;
  int? bookingID;
  String? acceptedBy;
  int? challengeStatus;
  String? usernameHash;
  int? futsalId;
  String? bookingDate;
  String? startTime;
  String? endTime;
  String? bookingStatus;
  String? futsalName;
  String? fieldImage;
  String? futsalLocation;
  int? pricePerHour;
  String? facilities;

  Data(
      {this.id,
      this.bookingID,
      this.acceptedBy,
      this.challengeStatus,
      this.usernameHash,
      this.futsalId,
      this.bookingDate,
      this.startTime,
      this.endTime,
      this.bookingStatus,
      this.futsalName,
      this.fieldImage,
      this.futsalLocation,
      this.pricePerHour,
      this.facilities});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingID = json['bookingID'];
    acceptedBy = json['acceptedBy'];
    challengeStatus = json['challengeStatus'];
    usernameHash = json['usernameHash'];
    futsalId = json['futsalId'];
    bookingDate = json['bookingDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    bookingStatus = json['bookingStatus'];
    futsalName = json['futsalName'];
    fieldImage = json['fieldImage'];
    futsalLocation = json['futsalLocation'];
    pricePerHour = json['pricePerHour'];
    facilities = json['facilities'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookingID'] = this.bookingID;
    data['acceptedBy'] = this.acceptedBy;
    data['challengeStatus'] = this.challengeStatus;
    data['usernameHash'] = this.usernameHash;
    data['futsalId'] = this.futsalId;
    data['bookingDate'] = this.bookingDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['bookingStatus'] = this.bookingStatus;
    data['futsalName'] = this.futsalName;
    data['fieldImage'] = this.fieldImage;
    data['futsalLocation'] = this.futsalLocation;
    data['pricePerHour'] = this.pricePerHour;
    data['facilities'] = this.facilities;
    return data;
  }
}
