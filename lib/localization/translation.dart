import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "اهلا",
          "2": "مرحبا بك",

          // Onboarding
          "in_hospital_maintenance": "فريق الصيانة الداخلي في المستشفى",
          "in_hospital_maintenance_body":
              "فريقنا الخبير جاهز دائمًا للتعامل مع أي مشكلات صيانة بسرعة وكفاءة.",
          "advanced_equipment": "معدات متقدمة",
          "advanced_equipment_body":
              "نقدم أحدث التقنيات لضمان حلول صيانة عالية الجودة.",
          "emergency_repair_hotline": "خط الطوارئ للإصلاح على مدار 24/7",
          "emergency_repair_hotline_body":
              "فريقنا متاح على مدار الساعة لمعالجة جميع مخاوفكم.",
          "preventative_policy": "سياسة الصيانة الوقائية",
          "preventative_policy_body":
              "نركز على الصيانة الوقائية لتقليل الأعطال وضمان سير العمليات بسلاسة.",

          // Authentication
          "choose_login_method": "اختر طريقة تسجيل الدخول",
          "login_as_user": "تسجيل الدخول كمستخدم",
          "login_as_engineer": "تسجيل الدخول كمهندس",
          "login as admin": "تسجيل الدخول كمسؤول",
          "Login": "تسجيل الدخول ",
          "forget password": "نسيت كلمه المرور",
          " Don't have an account": "ليس لديك حساب",
          "email": "الايميل",
          // General
          "department": "القسم",
          "Electrical": "كهرباء",
          "Plumbing": "سباكة",
          "Air Conditioning": "تكييف",
          "role": "الدور",
          "User": "مستخدم",
          "Engineer": "مهندس",
          "Contractor": "مقاول",
          "phone number": "رقم الهاتف",
          "Success": "نجاح",
          "Error": "خطأ",
          "Logged in successfully!": "تم تسجيل الدخول بنجاح",
          "Please fill all fields": "يرجى ملء جميع الحقول",
          "Invalid email": "البريد الإلكتروني غير صحيح",
          "Something went wrong": "حدث خطأ أثناء تسجيل الدخول",

          // Dashboard & Settings
          "Hi, Doctor": "مرحبا دكتور",
          "Hi, Contractor": "مرحبا المقاول",
          "Maintenance": "الصيانة",
          "Pending": "قيد الانتظار",
          "More Details": "المزيد من التفاصيل",
          "Recent Complaints": "الشكاوى الحديثة",
          "Complaint Number": "رقم الشكوى",
          "Language": "اللغة",
          "Dark Mode": "الوضع الليلي",
          "Home": "الرئيسية",
          "AddComplaints": "إضافة شكوى",
          "Complaints": "الشكاوى",
          "Setting": "الإعدادات",
          "Profile": "الملف الشخصي",
          "Password": "كلمة المرور",
          "Details": "تفاصيل",

          // Complaint Form
          "Add Complaint": "إضافة شكوى",
          "Title": "العنوان",
          "Enter title complaint here": "أدخل عنوان الشكوى هنا",
          "Description": "الوصف",
          "Describe your complaint here": "صف شكواك هنا",
          "Category": "الفئة",
          "Select Category": "اختر الفئة",
          "Location": "الموقع",
          "Select Location": "اختر الموقع",
          "Submit": "إرسال",
          "Status": "الحالة",

          // Others
          "Change Language": "تغيير اللغة",
          "English": "الإنجليزية",
          "العربية": "العربية",

          "Electrical Engineering": "الهندسة الكهربائية",
          "Mechanical Engineering": "الهندسة الميكانيكية",
          "Electronic Engineering (Low voltage)":
              "الهندسة الإلكترونية (الجهد المنخفض)",
          "Civil Engineering": "الهندسة المدنية",
          "Admin": "مسؤول",

          "Hi, contractor": "مرحبًا المقاول",
          "Hi, Admin": "مرحبًا المسئول",
          'Hi enginner': " مرحبا مهندس",
          "Departments": "الأقسام",
          "Users": "المستخدمين",
          "Contractors": "المقاولين",
          "LogOut": "تسجيل الخروج",
          "Reply": "الرد",
          "Complaint details": "تفاصييل الشكوي",
          "Add Complaints": "اضافه شكوي",
          "Edit Profile": "تعديل الملف",

          "Delete Account": "حذف الحساب",
          "Add Reply": "اضافه الرد",
          'replys': "الردود",
          "Engineers ": "قائمة المهندسين",
          'Complaint Tracker': 'متابعة الشكاوى',
          'Please enter your email and password to log in.':
              'الرجاء إدخال البريد الإلكتروني وكلمة المرور لتسجيل الدخول.',
          "Log In": "تسجيل الدخول",
          "Sign Up": "انشاء الحساب",
          "Username": "اسم المستخدم",
          "password": "كلمه السر",
          "phoneNumber": "رقم التلفون",
          "Already have an account? ": " لديك حساب",
          "Sign In": "تسجيل الدخول",
          "Logout": "تسجيل الخروج",
          "Department": "القسم",
          "Role": "نوع المستخدم",
          "Continue": "استمر",
          "Enter OTP": "أدخل رمز التحقق",
          "We've sent an OTP code to your email,\nUser53684@gmail.com":
              "لقد أرسلنا رمز التحقق إلى بريدك الإلكتروني،\nUser53684@gmail.com",
          "Verify": "تحقق",
          "We will resend the code in s": "سنعيد إرسال الرمز خلال  ثانية",
          "Resend code": "إعادة إرسال الرمز",
          "new password": "كلمة المرور الجديدة",
          "comfirm password": "تأكيد كلمة المرور",
          "Add replyComplaints": "اضافه الرد علي الشكوي",
          "Select department": "اختر القسم ",
          "reply to complaint here": "اضف الرد علي الشكوي",
          "Save Changes": "حفظ التعديلات",
          "Notification": "الاشعارات",
          "Skip": "تخطي",
          "new_maintenance_request": "طلب صيانة جديد",
          "maintenance_request_sent":
              "تم إرسال طلب صيانة من المهندس. اضغط للمزيد من التفاصيل.",
          "New": "جديد",
          "maintenance_appointment_confirmation": "تأكيد موعد الصيانة",
          "appointment_confirmed": "تم تأكيد موعد الصيانة بنجاح.",
          "in_progress": "قيد التنفيذ",
          "maintenance_completed": "إكمال الصيانة",
          "maintenance_success": "تم إكمال طلب الصيانة بنجاح.",
          "completed": "مكتمل",
          "Remember Me": "تذكرني",
          "add notification": "اضافه اشعار",
          'notification_title': "عنوان الاشعار",
          'notification_message': "تفاصيل الاشعار",
          'notification_status': 'حاله الاشعار',
          'Add': "اضافه",
          'notification_details': " تفاصييل الاشعار",
          "engineers": "  قائمه المهندسين",
          "contractors": "قائمه المقاولين",
          "Settings": "إعدادات",
          "Enter your email to reset password":
              "أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور",
          "It has already finished": "لقد انتهى بالفعل ",
          "complaint is completed": "تم الانتهاء من الشكوى",
          "complaint in progress": "شكوى قيد التقدم",
          "received the complaint": "تلقى الشكوى",
          "Complaint": "شكوى",
          "take complaint": "أرسل هذا شكوى للمقاول",
          "Delete Complaint": "إكمال الحذف ",
          "Are you sure you want to delete this complaint?":
              "هل أنت متأكد أنك تريد حذف هذه الشكوى؟",
          "Are you sure you want to send this complaint to the contractor?":
              "هل أنت متأكد من أنك تريد إرسال هذه الشكوى إلى المقاول؟",
          "send complaint": "send complaint",
          "you already sent": "لقد أرسلت بالفعل",
          "بيانات اعتماد المصادقة المقدمة غير صحيحة أو مشوهة أو انتهت صلاحيتها ":
              " بيانات اعتماد المصادقة المقدمة غير صحيحة أو مشوهة أو انتهت صلاحيتها",
          "No user found with this email address":
              "لم يتم العثور على مستخدم مع عنوان البريد الإلكتروني هذا",
          "Incorrect password, please try again":
              "كلمة مرور غير صحيحة ، يرجى المحاولة مرة أخرى",
          "The email address is invalid": "عنوان البريد الإلكتروني غير صالح ",
          "This account has been disabled": "تم تعطيل هذا الحساب",
          "Too many attempts, please try again later":
              "الكثير من المحاولات ، يرجى المحاولة مرة أخرى لاحقًا",
          "Email/password sign-in is not enabled":
              "لم يتم تمكين تسجيل الدخول عبر البريد الإلكتروني/كلمة المرور",
          "This field cannot be empty": "هذا الحقل لا يمكن أن يكون فارغًا",
          "Invalid username": "اسم المستخدم غير صالح",
          "Invalid phone number": "رقم الهاتف غير صالح",
          "Password must be at least characters":
              "كلمة المرور يجب أن تكون على الأقل  حرفًا",
          "Password must contain letters and numbers":
              "كلمة المرور يجب أن تحتوي على أحرف وأرقام",
          "Value cannot be less than characters":
              "القيمة لا يمكن أن تكون أقل من  حرفًا",
          "Value cannot be greater than characters":
              "القيمة لا يمكن أن تكون أكبر من حرفًا",
          "Error while selecting the image": "خطأ أثناء اختيار الصورة",
          "Password too weak (min 6 chars)":
              "كلمة المرور ضعيفة جدًا (الحد الأدنى 6 أحرف)",
          "Invalid email format": "تنسيق البريد الإلكتروني غير صالح",
          "Email already registered": "البريد الإلكتروني مسجل بالفعل",
          "Email login is not enabled":
              "تسجيل الدخول عبر البريد الإلكتروني غير مفعل",
          "Network error. Check your connection.":
              "خطأ في الشبكة. تحقق من اتصالك.",

          "No user found with this email":
              "لا يوجد مستخدم بهذا البريد الإلكتروني",
          "EAndroid package name missing": "اسم حزمة Android مفقود",
          "Continue URL missing": "رابط المتابعة مفقود",
          "iOS bundle ID missing": "معرف حزمة iOS مفقود",
          "Invalid continue URL": "رابط المتابعة غير صالح",
          "Unauthorized domain for continue URL":
              "نطاق غير مصرح به لرابط المتابعة",
          "Network error occurred": "حدث خطأ في الشبكة",
          "forget password failed": "فشل إعادة تعيين كلمة المرور"
        },
        "en": {
          "Resend code": "Resend code",
          "new password": "new password",
          "comfirm password": "comfirmpassword",
          "Select department": "Select department",
          "reply to complaint here": "reply to complaint here",
          "Save Changes": "Save Changes",
          "Skip": "Skip",
          "new_maintenance_request": "New Maintenance Request",
          "maintenance_request_sent":
              "A maintenance request has been sent by the engineer. Tap for more details.",
          "New": "New",
          "maintenance_appointment_confirmation":
              "Maintenance Appointment Confirmation",
          "appointment_confirmed":
              "The maintenance appointment has been successfully confirmed.",
          "in_progress": "In Progress",
          "maintenance_completed": "Maintenance Completed",
          "maintenance_success":
              "The maintenance request has been successfully completed.",
          "completed": "Completed",
          "Remember Me": "Remember Me",
          "add notification": "add notification",
          'notification_title': 'notification_title',
          'notification_message': 'notification_message',
          'notification_status': 'notification_status',
          'notification_details': 'notification_details',
          'Add': 'Add',
          "1": "Hi",
          "2": "Welcome Back",

          // Onboarding
          "in_hospital_maintenance": "In-Hospital Maintenance Crew",
          "in_hospital_maintenance_body":
              "Our expert crew is always ready to handle any maintenance issues swiftly and efficiently.",
          "advanced_equipment": "Advanced Equipment",
          "advanced_equipment_body":
              "We provide the latest technology to ensure top-notch maintenance solutions.",
          "emergency_repair_hotline": "24/7 Emergency Repair Hotline",
          "emergency_repair_hotline_body":
              "Our team is available round-the-clock to address all your concerns.",
          "preventative_policy": "Preventative Policy",
          "preventative_policy_body":
              "We focus on preventative maintenance to minimize breakdowns and ensure smooth operations.",

          // Authentication
          "choose_login_method": "Choose Login Method",
          "login_as_user": "Login as User",
          "login_as_engineer": "Login as Engineer",
          "login as admin": "Login as Admin",
          "Login": "Login",
          "Department": "Department",
          "Role": "Role",

          // General
          "department": "Department",
          "Electrical": "Electrical",
          "Plumbing": "Plumbing",
          "Air Conditioning": "Air Conditioning",
          "role": "Role",
          "User": "User",
          "Engineer": "Engineer",
          "Contractor": "Contractor",
          "phone number": "Phone Number",
          "Success": "Success",
          "Error": "Error",
          "Logged in successfully!": "Logged in successfully!",
          "Please fill all fields": "Please fill all fields",
          "Invalid email": "Invalid email",
          "Something went wrong": "Something went wrong",

          // Dashboard & Settings
          "Hi, Doctor": "Hi, Doctor",
          "Maintenance": "Maintenance",
          "Pending": "Pending",
          "More Details": "More Details",
          "Recent Complaints": "Recent Complaints",
          "Complaint Number": "Complaint Number",
          "Language": "Language",
          "Dark Mode": "Dark Mode",
          "Home": "Home",
          "AddComplaints": "Add Complaints",
          "Complaints": "Complaints",
          "Setting": "Setting",
          "Password": "Password",
          "Details": "Details",

          // Complaint Form
          "Add Complaint": "Add Complaint",
          "Title": "Title",
          "Enter title complaint here": "Enter title complaint here",
          "Description": "Description",
          "Submit": "Submit",

          // Others
          "Change Language": "Change Language",
          "English": "English",
          "العربية": "Arabic",

          "Hi, contractor": "Hi, contractor",
          "Hi, Admin": "Hi, Admin",
          "Departments": "Departments",
          "Users": "Users",
          "Contractors": "Contractors",
          "LogOut": "LogOut",
          "Reply": "Reply",
          "Complaint details": "Complaint details",
          "Add Complaints": "Add Complaints",
          "Edit Profile": "Edit Profile",
          "Delete Account": "Delete Account",
          "Add Reply": "Add Reply",
          'replys': 'replys',
          "Engineers ": "Engineers ",
          'Complaint Tracker': 'Complaint Tracker',
          "Please enter your email and password to log in.":
              "Please enter your email and password to log in.",
          "  Log In": "Log In",
          "forget password": "forget password",
          " Don't have an account": " Don't have an account",
          "Sign Up": "Sign Up",
          "Username": "Username",
          "password": "password",
          "phoneNumber": "phoneNumber",
          "Already have an account? ": "Already have an account? ",
          "Sign In": "Sign In",
          "Logout": "Logout",
          " email ": " email ",
          "Continue": "Continue",
          "Enter OTP": "Enter OTP",
          "We've sent an OTP code to your email,\nUser53684@gmail.com":
              "We've sent an OTP code to your email,\nUser53684@gmail.com",
          "Verify": "Verify",
          "We will resend the code in s": "We will resend the code in  s",
          'Hi enginner': 'Hi enginner',
          "Add replyComplaints": "Add replyComplaints",
          "Notification": "Notification",
          "engineers": " engineers",
          "contractors": "contractors",
          "Hi, Contractor": "Hi, Contractor",
          "Enter your email to reset password":
              "Enter your email to reset password",
          "Settings": "Settings",
          "It has already finished": "It has already finished",
          "complaint is completed": "complaint is completed",
          "complaint in progress": "complaint in progress",
          "received the complaint": "received the complaint",
          "Complaint": "Complaint",
          "take complaint": "send complaint to contractor.",
          "Delete Complaint": "Delete Complaint",
          "Are you sure you want to delete this complaint?":
              "Are you sure you want to delete this complaint?",
          "Are you sure you want to send this complaint to the contractor?":
              "Are you sure you want to send this complaint to the contractor?",
          "send complaint": "send complaint",
          "you already sent": "you already sent",
          "The supplied auth credential is incorrect, malformed or has expired":
              "The supplied auth credential is incorrect, malformed or has expired",
          "No user found with this email address":
              "No user found with this email address",
          "Incorrect password, please try again":
              "Incorrect password, please try again",
          "The email address is invalid": "The email address is invalid",
          "This account has been disabled": "This account has been disabled",
          "Too many attempts, please try again later":
              "Too many attempts, please try again later",
          "Email/password sign-in is not enabled":
              "Email/password sign-in is not enabled",
          "Error while selecting the image": "Error while selecting the image",
          "Password too weak (min 6 chars)": "Password too weak (min 6 chars)",
          "Invalid email format": "Invalid email format",
          "Email already registered": "Email already registered",
          "Email login is not enabled": "Email login is not enabled",
          "Network error. Check your connection.":
              "Network error. Check your connection.",

          "No user found with this email": "No user found with this email",
          "EAndroid package name missing": "EAndroid package name missing",
          "Continue URL missing": "Continue URL missing",
          "iOS bundle ID missing": "iOS bundle ID missing",
          "Invalid continue URL": "Invalid continue URL",
          "Unauthorized domain for continue URL":
              "Unauthorized domain for continue URL",
          "Network error occurred": "Network error occurred",
          "forget password failed": "forget password failed",
        }
      };
}
