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

  // القيمة الافتراضية للأفاتار
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
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _nameController.text = user.displayName ?? "";
      if (user.photoURL != null && user.photoURL!.isNotEmpty) {
        setState(() {
          selectedAvatar = user.photoURL!;
        });
      }
    }
  }

  Future<void> _updateUserData() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      _showSnackBar("Please enter a name", isError: true);
      return;
    }

    setState(() => isLoading = true);

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.updatePhotoURL(selectedAvatar);
        await user.reload();

        if (mounted) {
          _showSnackBar("Profile updated successfully!");
          Navigator.pop(context, true);
        }
      }
    } catch (e) {
      _showSnackBar("Error updating profile: $e", isError: true);
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void resetCurrentPassword(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email != null) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: user.email!);
        _showSnackBar("تم إرسال رابط إعادة التعيين إلى ${user.email}");
      } on FirebaseAuthException catch (e) {
        _showSnackBar("فشل الإرسال: ${e.message}", isError: true);
      } catch (e) {
        _showSnackBar("حدث خطأ غير متوقع، يرجى المحاولة لاحقاً", isError: true);
      }
    } else {
      _showSnackBar("يجب تسجيل الدخول أولاً", isError: true);
    }
  }

  void _confirmDelete() {
    bool isDeleting = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
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
            if (!isDeleting)
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            TextButton(
              onPressed: isDeleting
                  ? null
                  : () async {
                      setDialogState(() => isDeleting = true);

                      try {
                        await FirebaseAuth.instance.currentUser?.delete();
                        if (mounted) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.loginRoute,
                            (route) => false,
                          );
                        }
                      } catch (e) {
                        setDialogState(
                          () => isDeleting = false,
                        ); // إيقاف التحميل عند الخطأ
                        Navigator.pop(context);
                        _showSnackBar(
                          "Please re-login to delete your account",
                          isError: true,
                        );
                      }
                    },
              child: isDeleting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.red,
                      ),
                    )
                  : const Text("Yes", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Pick Avatar",
          style: TextStyle(fontSize: 16, color: AppColors.goldenYellow),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.goldenYellow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _showAvatarPicker,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: AppColors.lightBlack,
                              backgroundImage: AssetImage(selectedAvatar),
                            ),
                            const CircleAvatar(
                              radius: 18,
                              backgroundColor: AppColors.goldenYellow,
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      30.verticalSpace(),
                      CustomTextField(
                        controller: _nameController,
                        prefixIcon: Icons.person,
                        hint: "Name",
                        onChanged: (v) {},
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () => resetCurrentPassword(context),
                          child: const Text(
                            "Reset Password",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const Spacer(),
                      CustomMainButton(
                        backgroundColor: Colors.red,
                        text: "Delete Account",
                        onTap: _confirmDelete,
                      ),
                      16.verticalSpace(),
                      CustomMainButton(
                        text: "Update Data",
                        isLoading: isLoading,
                        onTap: _updateUserData,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
