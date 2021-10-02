// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  String message;
  bool status;
  Data data;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    message: json["message"],
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.obj,
    required this.latLongList,
  });

  Obj obj;
  LatLongList latLongList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    obj: Obj.fromJson(json["obj"]),
    latLongList: LatLongList.fromJson(json["latLongList"]),
  );

  Map<String, dynamic> toJson() => {
    "obj": obj.toJson(),
    "latLongList": latLongList.toJson(),
  };
}

class LatLongList {
  LatLongList({
    required this.result,
    required this.id,
    required this.status,
    required this.isCanceled,
    required this.isCompleted,
    required this.isCompletedSuccessfully,
    required this.creationOptions,
    required this.isFaulted,
  });

  List<Result> result;
  int id;
  int status;
  bool isCanceled;
  bool isCompleted;
  bool isCompletedSuccessfully;
  int creationOptions;
  bool isFaulted;

  factory LatLongList.fromJson(Map<String, dynamic> json) => LatLongList(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    id: json["id"],
    status: json["status"],
    isCanceled: json["isCanceled"],
    isCompleted: json["isCompleted"],
    isCompletedSuccessfully: json["isCompletedSuccessfully"],
    creationOptions: json["creationOptions"],
    isFaulted: json["isFaulted"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
    "id": id,
    "status": status,
    "isCanceled": isCanceled,
    "isCompleted": isCompleted,
    "isCompletedSuccessfully": isCompletedSuccessfully,
    "creationOptions": creationOptions,
    "isFaulted": isFaulted,
  };
}

class Result {
  Result({
    required this.latLongId,
    required this.latitude,
    required this.longitude,
    required this.organizationId,
  });

  String latLongId;
  String latitude;
  String longitude;
  String organizationId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    latLongId: json["latLongId"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    organizationId: json["organizationId"],
  );

  Map<String, dynamic> toJson() => {
    "latLongId": latLongId,
    "latitude": latitude,
    "longitude": longitude,
    "organizationId": organizationId,
  };
}

class Obj {
  Obj({
    required this.employeeId,
    required this.name,
    required this.fatherName,
    required this.dob,
    required this.mobile,
    required this.email,
    required this.panNo,
    required this.uan,
    required this.esic,
    required this.state,
    required this.city,
    required this.pinCode,
    required this.address,
    required this.bankAccountNo,
    required this.confirmBankAccountNo,
    required this.bankAccountName,
    required this.ifsc,
    required this.branch,
    required this.panDocsName,
    required this.aadharDocsName,
    required this.employeementExchangeNo,
    required this.status,
    required this.gender,
    required this.category,
    required this.workExperience,
    required this.isEsic,
    required this.faceId,
    required this.apiPersonId,
    required this.apiGroupId,
    required this.isAuthenticate,
    required this.aadharNo,
    required this.isAppoints,
    required this.agencyId,
    required this.editPermission,
    required this.employeePhoto,
    required this.deletePermission,
    required this.verifyAadhar,
    required this.show,
    required this.statusName,
    required this.categoryName,
  });

  String employeeId;
  String name;
  String fatherName;
  String dob;
  String mobile;
  String email;
  String panNo;
  String uan;
  String esic;
  String state;
  String city;
  String pinCode;
  String address;
  String bankAccountNo;
  String confirmBankAccountNo;
  String bankAccountName;
  String ifsc;
  String branch;
  String panDocsName;
  String aadharDocsName;
  String employeementExchangeNo;
  String status;
  String gender;
  String category;
  String workExperience;
  int isEsic;
  String faceId;
  String apiPersonId;
  String apiGroupId;
  int isAuthenticate;
  String aadharNo;
  String isAppoints;
  String agencyId;
  String editPermission;
  String employeePhoto;
  String deletePermission;
  String verifyAadhar;
  String show;
  String statusName;
  String categoryName;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    employeeId: json["employeeId"],
    name: json["name"],
    fatherName: json["fatherName"],
    dob: json["dob"],
    mobile: json["mobile"],
    email: json["email"],
    panNo: json["panNo"],
    uan: json["uan"],
    esic: json["esic"],
    state: json["state"],
    city: json["city"],
    pinCode: json["pinCode"],
    address: json["address"],
    bankAccountNo: json["bankAccountNo"],
    confirmBankAccountNo: json["confirmBankAccountNo"],
    bankAccountName: json["bankAccountName"],
    ifsc: json["ifsc"],
    branch: json["branch"],
    panDocsName: json["panDocsName"],
    aadharDocsName: json["aadharDocsName"],
    employeementExchangeNo: json["employeementExchangeNo"],
    status: json["status"],
    gender: json["gender"],
    category: json["category"],
    workExperience: json["workExperience"],
    isEsic: json["isESIC"],
    faceId: json["faceId"],
    apiPersonId: json["apiPersonId"],
    apiGroupId: json["apiGroupId"],
    isAuthenticate: json["isAuthenticate"],
    aadharNo: json["aadharNo"],
    isAppoints: json["isAppoints"],
    agencyId: json["agencyId"],
    editPermission: json["editPermission"],
    employeePhoto: json["employeePhoto"],
    deletePermission: json["deletePermission"],
    verifyAadhar: json["verifyAadhar"],
    show: json["show"],
    statusName: json["statusName"],
    categoryName: json["categoryName"],
  );

  Map<String, dynamic> toJson() => {
    "employeeId": employeeId,
    "name": name,
    "fatherName": fatherName,
    "dob": dob,
    "mobile": mobile,
    "email": email,
    "panNo": panNo,
    "uan": uan,
    "esic": esic,
    "state": state,
    "city": city,
    "pinCode": pinCode,
    "address": address,
    "bankAccountNo": bankAccountNo,
    "confirmBankAccountNo": confirmBankAccountNo,
    "bankAccountName": bankAccountName,
    "ifsc": ifsc,
    "branch": branch,
    "panDocsName": panDocsName,
    "aadharDocsName": aadharDocsName,
    "employeementExchangeNo": employeementExchangeNo,
    "status": status,
    "gender": gender,
    "category": category,
    "workExperience": workExperience,
    "isESIC": isEsic,
    "faceId": faceId,
    "apiPersonId": apiPersonId,
    "apiGroupId": apiGroupId,
    "isAuthenticate": isAuthenticate,
    "aadharNo": aadharNo,
    "isAppoints": isAppoints,
    "agencyId": agencyId,
    "editPermission": editPermission,
    "employeePhoto": employeePhoto,
    "deletePermission": deletePermission,
    "verifyAadhar": verifyAadhar,
    "show": show,
    "statusName": statusName,
    "categoryName": categoryName,
  };
}
