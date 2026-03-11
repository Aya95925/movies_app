import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/core/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/main_button.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/text_field.dart';

class UpdateProfaile extends StatefulWidget {
  const UpdateProfaile({super.key});

  @override
  State<UpdateProfaile> createState() => _UpdateProfaileState();
}

class _UpdateProfaileState extends State<UpdateProfaile> {
  bool isLoading = false;

  final TextEditingController _nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _nameController.text = user.displayName ?? "";
      });
    }
  }

  //code for Update Name The current user
  Future<void> _updateUserData() async {
    // 1. التحقق من الحقول
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("يرجى إدخال اسم جديد")));
      return;
    }

    // 2. تفعيل حالة التحميل
    setState(() => isLoading = true);

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // تحديث الاسم في Firebase Auth
        await user.updateDisplayName(_nameController.text.trim());

        // هنا نقوم بتحديث رقم الهاتف في Firestore
        // (يجب التأكد من إضافة مكتبة cloud_firestore)
        /* await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
      }, SetOptions(merge: true));
      */

        await user.reload();

        if (mounted) {
          // إغلاق الصفحة بعد نجاح التحديث
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم تحديث البيانات بنجاح")),
          );
        }
      }
    } catch (e) {
      print("Error: $e");
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("حدث خطأ أثناء التحديث: $e")));
      }
    } finally {
      // 3. إيقاف حالة التحميل
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  //code for reset password for current user
  void resetCurrentPassword(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && user.email != null) {
      try {
        // إرسال طلب إعادة التعيين
        await FirebaseAuth.instance.sendPasswordResetEmail(email: user.email!);

        // رسالة النجاح
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("تم إرسال رابط إعادة التعيين إلى ${user.email}"),
            backgroundColor: Colors.green, // لون النجاح
            behavior: SnackBarBehavior.floating,
          ),
        );
      } on FirebaseAuthException catch (e) {
        // رسالة الخطأ من Firebase
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("فشل الإرسال: ${e.message}"),
            backgroundColor: Colors.red, // لون الخطأ
            behavior: SnackBarBehavior.floating,
          ),
        );
      } catch (e) {
        // أي خطأ غير متوقع آخر
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("حدث خطأ غير متوقع، يرجى المحاولة لاحقاً"),
            backgroundColor: Colors.orange,
          ),
        );
      }
      return;
    } else {
      // حالة عدم وجود مستخدم مسجل
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("يجب تسجيل الدخول أولاً")));
    }
    setState(() => isLoading = true);
  }

  // Code for Delete Account
  Future<void> deleteCurrentUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
        print("User account deleted successfully.");
        Navigator.pushReplacement(context, AppRoutes.login());
      } else {
        print("No user is currently signed in.");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print("User must reauthenticate before deletion.");
        // Trigger reauthentication flow here
      } else {
        print("Error deleting user: ${e.message}");
      }
    }
  }

  String selectedAvatar = AppAssets.avatarProfile;

  final List<String> avatars = [
    AppAssets.avatar1,
    AppAssets.avatar2,
    AppAssets.avatar3,
    AppAssets.avatar4,
    AppAssets.avatar5,
    AppAssets.avatar6,
    AppAssets.avatar7,
    AppAssets.avatar8,
    AppAssets.avatar9,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Pick Avatar",
          style: TextStyle(fontFamily: "Roboto", color: AppColors.goldenYellow),
        ),
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.goldenYellow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              10.verticalSpace(),

              GestureDetector(
                onTap: _showAvatarPicker,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(selectedAvatar),
                ),
              ),

              30.verticalSpace(),
              CustomTextField(
                controller: _nameController,
                prefixIcon: Icons.person,
                hint: "John Safwat",
              ),
              16.verticalSpace(),
              const CustomTextField(
                prefixIcon: Icons.phone,
                hint: "01200000000",
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: null,
                  child: InkWell(
                    onTap: () {
                      resetCurrentPassword(context);
                    },
                    child: Text(
                      "Reset Password",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              CustomMainButton(
                backgroundColor: AppColors.red,
                text: "Delete Account",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: const Color(0xFF121312),
                      title: const Text(
                        "Delete Account",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: const Text(
                        "Are you sure you want to Delete Your Account?",
                        style: TextStyle(color: Colors.white70),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            deleteCurrentUser();
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              16.verticalSpace(),
              CustomMainButton(
                text: "Update Data",
                isLoading: isLoading,
                onTap: () {
                  _updateUserData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.lightBlack,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: avatars.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAvatar = avatars[index];
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: selectedAvatar == avatars[index]
                          ? AppColors.goldenYellow
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      avatars[index],
                      fit: BoxFit.cover,
                      // حماية: إذا لم يجد الصورة يعرض أيقونة مستخدم
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
