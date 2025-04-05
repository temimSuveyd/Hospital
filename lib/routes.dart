import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hosptail/core/middleWare/appMiddleWare.dart';
import 'package:hosptail/screen/Contractor/view/add_notification_contractor.dart';
import 'package:hosptail/screen/Contractor/view/complaint_details_contractor.dart';
import 'package:hosptail/screen/Contractor/view/complaints_contractor.dart';
import 'package:hosptail/screen/Contractor/view/contractor_profile.dart';
import 'package:hosptail/screen/Contractor/view/departments.dart';
import 'package:hosptail/screen/Contractor/view/edit_profile_contractor.dart';
import 'package:hosptail/screen/Contractor/view/engineers_contractor.dart';
import 'package:hosptail/screen/Contractor/view/home_screen_contractor.dart';
import 'package:hosptail/screen/Contractor/view/notification_contractor.dart';
import 'package:hosptail/screen/Contractor/view/notification_details_contractor.dart';
import 'package:hosptail/screen/Engineering%20Department/view/complaint_replyeng.dart';
import 'package:hosptail/screen/Engineering%20Department/view/add_notifcatin_engineer.dart';
import 'package:hosptail/screen/Engineering%20Department/view/add_reply_complaint_engineer.dart';
import 'package:hosptail/screen/Engineering%20Department/view/complainst_engineer.dart';
import 'package:hosptail/screen/Engineering%20Department/view/complaint_detail_engineer.dart';
import 'package:hosptail/screen/Engineering%20Department/view/edit_profile_engineer.dart';
import 'package:hosptail/screen/Engineering%20Department/view/engineer_profile.dart';
import 'package:hosptail/screen/Engineering%20Department/view/home_screen_engineer.dart';
import 'package:hosptail/screen/Engineering%20Department/view/notification_details_egineer.dart';
import 'package:hosptail/screen/Engineering%20Department/view/notification_engineer.dart';
import 'package:hosptail/screen/admin/view/admin_all_complaints_view.dart';
import 'package:hosptail/screen/admin/view/admin_profile.dart';
import 'package:hosptail/screen/admin/view/complaint_details_admin.dart';
import 'package:hosptail/screen/admin/view/contractors.dart';
import 'package:hosptail/screen/admin/view/departmentcomplaint.dart';
import 'package:hosptail/screen/admin/view/departmentsadmin.dart';
import 'package:hosptail/screen/admin/view/editprofileadmin.dart';
import 'package:hosptail/screen/admin/view/engineers.dart';
import 'package:hosptail/screen/admin/view/homepage_admin.dart';
import 'package:hosptail/screen/admin/view/homescreen_admin.dart';
import 'package:hosptail/screen/admin/view/user_complaints.dart';
import 'package:hosptail/screen/admin/view/users.dart';
import 'package:hosptail/screen/shared/view/auth/forgetpassword.dart';
import 'package:hosptail/screen/shared/view/auth/login.dart';
import 'package:hosptail/screen/shared/view/auth/otpscreen.dart';
import 'package:hosptail/screen/shared/view/auth/resetpassword.dart';
import 'package:hosptail/screen/shared/view/auth/sighup.dart';
import 'package:hosptail/screen/shared/view/choose.dart';
import 'package:hosptail/screen/shared/view/onboarding_page.dart';
import 'package:hosptail/screen/user/view/add_complaint_suser.dart';
import 'package:hosptail/screen/user/view/add_location_from_map.dart';
import 'package:hosptail/screen/user/view/complains_details.dart';
import 'package:hosptail/screen/user/view/complaints_View.dart';
import 'package:hosptail/screen/user/view/editpage_user.dart';
import 'package:hosptail/screen/user/view/home_page_screen_user.dart';
import 'package:hosptail/screen/user/view/notification_user.dart';
import 'package:hosptail/screen/user/view/notification_details_user.dart';
import 'package:hosptail/screen/user/view/user_profile.dart';
import 'core/constant/Approutes.dart';

List<GetPage> routes = [
  ////////////////Start page
  GetPage(name: "/", page: () => Onboarding(), middlewares: [Appmiddleware()]),
  GetPage(name: Approutes.onboarding, page: () => Onboarding()),
  ////////////////auth
  GetPage(name: Approutes.sighup, page: () => SignupPage()),
  GetPage(name: Approutes.login, page: () => LoginPage()),
  GetPage(name: Approutes.chooseLoginPage, page: () => ChooseLoginPage()),
  GetPage(name: Approutes.forgetpasword, page: () => Forgetpasswordpage()),
  GetPage(
      name: Approutes.oTPVerificationPage, page: () => OTPVerificationPage()),
  GetPage(name: Approutes.respassword, page: () => Resetpassword()),
  GetPage(name: Approutes.addlocationfrommap, page: () => Addlocationfrommap()),

//user
  GetPage(name: Approutes.userhomepage, page: () => Userhomepage()),
  GetPage(
      name: Approutes.userComplaintdetails, page: () => UserComplaintdetails()),
  GetPage(name: Approutes.userProfile, page: () => Userprofile()),
  GetPage(
      name: Approutes.userEditProfilePage, page: () => UserEditProfilePage()),
  GetPage(name: Approutes.userComplaints, page: () => UserComplaints()),
  GetPage(name: Approutes.userAddcomplaint, page: () => UserAddcomplaint()),
  GetPage(
      name: Approutes.userNotificationPage, page: () => UserNotificationPage()),
  GetPage(
      name: Approutes.userNotificationDetails,
      page: () => UserNotificationDetails()),
  ////engineer
  GetPage(name: Approutes.engineerhomepage, page: () => Engineerhomepage()),
  GetPage(
      name: Approutes.engineerComplaintDetails,
      page: () => EngineerComplaintDetails()),
  GetPage(
      name: Approutes.engineerAddReplyComplaint,
      page: () => EngineerAddReplyComplaint()),
  GetPage(
      name: Approutes.engineerComplaintReply,
      page: () => EngineerComplaintReply()),
  GetPage(name: Approutes.engineerProfile, page: () => EngineerProfile()),
  GetPage(
      name: Approutes.engineerEditProfile, page: () => EngineerEditProfile()),
  GetPage(name: Approutes.engineerComplaints, page: () => EngineerComplaints()),
  GetPage(
      name: Approutes.engineerNotification, page: () => EngineerNotification()),
  GetPage(
      name: Approutes.engineerAddNotifcation,
      page: () => EngineerAddNotifcation()),
  GetPage(
      name: Approutes.egineerNotificationDetails,
      page: () => EgineerNotificationDetails()),
  //////////////contractor
  GetPage(name: Approutes.contractorHome, page: () => ContractorHome()),
  GetPage(name: Approutes.contractorProfile, page: () => ContractorProfile()),
  GetPage(
      name: Approutes.contractorEditProfile,
      page: () => ContractorEditprofile()),
  GetPage(
      name: Approutes.contractorComplaintDetails,
      page: () => ContractorComplaintDetails()),
  GetPage(
      name: Approutes.contractorComplaints, page: () => ContractorComplaints()),
  GetPage(
      name: Approutes.contractorEngineers, page: () => ContractorEngineers()),
  GetPage(
      name: Approutes.contractorDepartments,
      page: () => ContractorDepartments()),
  GetPage(
      name: Approutes.contractorNotification,
      page: () => ContractorNotification()),
  GetPage(
      name: Approutes.contractorAddNotification,
      page: () => ContractorAddNotification()),
  GetPage(
      name: Approutes.contractorNotificationDetails,
      page: () => ContractorNotificationDetails()),
  /////////////////////admin
  GetPage(name: Approutes.adminHomeScreen, page: () => AdminHomeScreen()),
  GetPage(name: Approutes.dminUsers, page: () => AdminUsers()),
  GetPage(name: Approutes.adminDepartments, page: () => AdminDepartments()),
  GetPage(name: Approutes.adminContractors, page: () => AdminContractors()),
  GetPage(
      name: Approutes.adminUserComplaints, page: () => AdminUserComplaints()),
  GetPage(
      name: Approutes.adminDepartmentComplaint,
      page: () => AdminDepartmentComplaint()),
  GetPage(name: Approutes.adminProfile, page: () => AdminProfile()),
  GetPage(name: Approutes.adminEditProfile, page: () => AdminEditProfile()),
  GetPage(
      name: Approutes.adminComplaintDetails,
      page: () => AdminComplaintDetails()),
  GetPage(name: Approutes.adminEngineers, page: () => AdminEngineersView()),
  GetPage(name: Approutes.adminhomePage, page: () => AdminhomePage()),
  GetPage(name: Approutes.adminAllComplaints, page: () => AdminAllComplaints()),

];
