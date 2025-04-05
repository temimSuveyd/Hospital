import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// add user data to firestore
  addUserData(
      String userId,
      String name,
      String email,
      String role,
      String department,
      String phoneNumber,
      String location,
      String token,
      String accessToken,
      String userImage) async {
    _firestore
        .collection("users")
        .doc(role)
        .collection("${role}s")
        .doc(userId)
        .set({
      "userId": userId,
      "name": name,
      "email": email,
      "role": role,
      "department": department,
      "phoneNumber": phoneNumber,
      "location": location,
      "token": token,
      "accessToken": accessToken,
      "image": userImage,
    });
  }



  updateUserData(
      String userId,
      String name,
      String email,
      String role,
      String department,
      String phoneNumber,
      String location,
      String userImage) async {
    _firestore
        .collection("users")
        .doc(role)
        .collection("${role}s")
        .doc(userId)
        .update({
      "userId": userId,
      "name": name,
      "email": email,
      "role": role,
      "department": department,
      "phoneNumber": phoneNumber,
      "location": location,
      "image": userImage,
    });
  }







// update access token
  updateTokensData(String role, String userId, String accessToken,String token) async {
    _firestore
        .collection("users")
        .doc(role)
        .collection("${role}s")
        .doc(userId)
        .update({
      "accessToken": accessToken,
      "token": token,
    });
  }

// delete user data
  deleteUserData(String userId, String role) async {
    await _firestore
        .collection("users")
        .doc(role)
        .collection("${role}s")
        .doc(userId)
        .delete();
  }

// get user by id
  Future<Map<String, dynamic>?> getUserData(String userUid) async {
    final userRoles = ['User', 'Engineer', 'Admin', 'Contractor'];
    DocumentSnapshot documentSnapshot;
    for (final role in userRoles) {
      documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(role)
          .collection("${role}s")
          .doc(userUid)
          .get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>?;
      }
    }
  }

// get all users
  getAllUsersData() async {
    QuerySnapshot? querySnapshot;
    querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc("User")
        .collection("Users")
        .get();

    return querySnapshot;
  }

// get all engineers by department
  getAllEngineersData(String department) async {
    QuerySnapshot? querySnapshot;

    querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc("Engineer")
        .collection("Engineers")
        .where("department", isEqualTo: department)
        .get();
    return querySnapshot;
  }

// get all contractors by department

  getAllContactorsData(String department) async {
    QuerySnapshot? querySnapshot;

    querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc("Contractor")
        .collection("Contractors")
        .where("department", isEqualTo: department)
        .get();
    return querySnapshot;
  }
}
