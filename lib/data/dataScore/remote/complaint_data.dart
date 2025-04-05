import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addcomplaint(
    String user_name,
    String user_id,
    String user_email,
    String user_phone,
    String user_token,
    String complaint_title,
    String complaint_description,
    String complaint_location,
    String complaint_status,
    String department,
    String user_accessToken,
  ) {
    _firestore.collection("complaint").add({
      "user_name": user_name,
      "user_id": user_id,
      "user_email": user_id,
      "user_phone": user_phone,
      "user_token": user_token,
      "user_accessToken": user_accessToken,
      "complaint_title": complaint_title,
      "complaint_description": complaint_description,
      "complaint_add_date": DateTime.now(),
      "complaint_location": complaint_location,
      "complaint_status": complaint_status,
      "department": department,
      "engineer_reply_date": DateTime.now(),
      "engineer_name": "",
      "engineer_token": "",
      "engineer_accessToken": "",
      "contractor_name": "",
      "contractor_token": "",
      "contractor_accessToken": "",
    });
  }

  deleteComplaint(String complaintId) async {
    await _firestore.collection("complaint").doc(complaintId).delete();
  }

// get complaint data py id
  Future<Map<String, dynamic>?> getComplaintsById(String complaintId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('complaint')
        .doc(complaintId)
        .get();
    if (documentSnapshot.exists) {
      return documentSnapshot.data() as Map<String, dynamic>?;
    } else {
      return null;
    }
  }

// user complaint
  Stream<QuerySnapshot<Map<String, dynamic>>> getUserComplents(String userUid) {    
    return _firestore
        .collection("complaint")
        .where("user_id", isEqualTo: userUid)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserNotifactions(
      String userUid) {
    final List statusList = [
      "Engineer received",
      "contractor received",
      "in progress",
      "completed"
    ];
    return _firestore
        .collection("complaint")
        .where("user_id", isEqualTo: userUid)
        .where("complaint_status", whereIn: statusList)
        // .orderBy("complaint_add_date")
        .snapshots();
  }

// engeneer complaint
  updateComplaintDataEngineer(
    String complaintId,
    String engineer_name,
    String engineer_email,
    String engineer_phone,
    String engineer_token,
    String engineer_id,
    String engineer_accessToken,
  ) {
    _firestore.collection("complaint").doc(complaintId).update({
      "engineer_name": engineer_name,
      "engineer_email": engineer_email,
      "engineer_phone": engineer_phone,
      "engineer_token": engineer_token,
      "engineer_id": engineer_id,
      "engineer_accessToken": engineer_accessToken,
      "engineer_reply_date": DateTime.now(),
      "complaint_status": "Engineer received",
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getEngineerComplaints(
      String department) {
    return _firestore
        .collection("complaint")
        .where("department", isEqualTo: department)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getEngineerNotifications(
      String engineerId) {
    final List statusList = ["contractor received", "in progress", "completed"];
    return _firestore
        .collection("complaint")
        .where("complaint_status", whereIn: statusList)
        .where("engineer_id", isEqualTo: engineerId)
        .snapshots();
  }

// Contractor
  Stream<QuerySnapshot<Map<String, dynamic>>> getContractorComplaint(
      String department) {
            final List statusList = [
      "Engineer received",
      "contractor received",
      "in progress",
      "completed"
    ];
    return _firestore
        .collection("complaint")
        .where("department", isEqualTo: department)
        .where("complaint_status", whereIn:statusList)
        .snapshots();
  }

  updateComplaintDataContractor(
      String contractor_name,
      String contractor_email,
      String contractor_phone,
      String contractor_token,
      String contractor_id,
      String complaintId,
      String complaint_status,
      String contractor_accessToken) {
    _firestore.collection("complaint").doc(complaintId).update({
      "contractor_name": contractor_name,
      "contractor_email": contractor_email,
      "contractor_phone": contractor_phone,
      "contractor_token": contractor_token,
      "contractor_accessToken": contractor_accessToken,
      "contractor_id": contractor_id,
      "contractor_reply_date": DateTime.now(),
      "complaint_status": complaint_status,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDepartmentComplaints(
      String id, String user_type) {
    if (user_type == "Contractor") {
      return _firestore
          .collection("complaint")
          .where("contractor_id",isEqualTo: id)
          .snapshots();
    } else {
      return _firestore
          .collection("complaint")
          .where("engineer_id", isEqualTo: id)
          .snapshots();
    }
  }





// get all complaints
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllComplaints() {
    return _firestore.collection("complaint").snapshots();
  }



}
