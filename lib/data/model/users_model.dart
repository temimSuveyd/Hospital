import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userName;
  String? userEmail;
  String? userUid;
  String? userPhone;
  String? userRole;
  String? userAccessToken;
  String? userDepartment;
  String? userLocation;
  String? userToken;

  UserModel(
    this.userAccessToken,
    this.userDepartment,
    this.userEmail,
    this.userLocation,
    this.userName,
    this.userPhone,
    this.userRole,
    this.userToken,
    this.userUid,
  );

  UserModel.formateJson(QueryDocumentSnapshot mapToJson) {
    userAccessToken = mapToJson["accessToken"];
    userDepartment = mapToJson["department"];
    userEmail = mapToJson["email"];
    userLocation = mapToJson["location"];
    userName = mapToJson["name"];
    userPhone = mapToJson["phoneNumber"];
    userRole = mapToJson["role"];
    userToken = mapToJson["token"];
    userUid = mapToJson["userId"];
  }
}
