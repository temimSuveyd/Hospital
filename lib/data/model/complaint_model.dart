import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintModel {
  String? title;
  String? department;
  String? status;
  String? description;
  DateTime? userDate;
  DateTime? engineerDate;
  String? replycomplaint;
  String? location;
  String? id;
  String? userName;
  String? userToken;
  String? userAccessToken;
  String? engineerName;
  String? engineerToken;
  String? engineerAccessToken;
  String? contractorName;
  String? contractorToken;
  String? contractorAccessToken;

  ComplaintModel(
      this.title,
      this.department,
      this.status,
      this.description,
      this.userDate,
      this.replycomplaint,
      this.location,
      this.id,
      this.engineerDate);

  ComplaintModel.formateJson(QueryDocumentSnapshot mapToJson) {
    title = mapToJson["complaint_title"];
    department = mapToJson["department"];
    status = mapToJson["complaint_status"];
    description = mapToJson["complaint_description"];
    userDate = mapToJson["complaint_add_date"].toDate();
    location = mapToJson["complaint_location"];
    id = mapToJson.id;
    engineerDate = mapToJson["engineer_reply_date"].toDate();
    userName = mapToJson["user_name"];
    userToken = mapToJson["user_token"];
    userAccessToken = mapToJson["user_accessToken"];
    engineerName = mapToJson["engineer_name"];
    engineerToken = mapToJson["engineer_token"];
    engineerAccessToken = mapToJson["engineer_accessToken"];
    contractorName = mapToJson["contractor_name"];
    contractorToken = mapToJson["contractor_token"];
    contractorToken = mapToJson["contractor_accessToken"];
  }
}
