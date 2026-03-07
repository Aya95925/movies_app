import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/ui/widgets/main_button.dart';
import 'package:flutter_application_new/ui/widgets/text_field.dart';

class UpdateProfaile extends StatefulWidget {
  const UpdateProfaile({super.key});

  @override
  State<UpdateProfaile> createState() => _UpdateProfaileState();
}

class _UpdateProfaileState extends State<UpdateProfaile> {
  String selectedAvatar = AppAssets.avatarProfile;
  // متغير لتخزين الصورة المختارة حالياً

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

              // جعل الصورة قابلة للضغط لفتح القائمة
              GestureDetector(
                onTap: _showAvatarPicker,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(selectedAvatar),
                ),
              ),

              30.verticalSpace(),
              const CustomTextField(
                prefixIcon: Icons.person,
                hint: "John Safwat",
              ),
              16.verticalSpace(),
              const CustomTextField(
                prefixIcon: Icons.phone,
                hint: "01200000000",
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: null,
                  child: Text(
                    "Reset Password",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const Spacer(),

              CustomMainButton(
                backgroundColor: AppColors.red,
                text: "Delete Account",
                onTap: () {},
              ),
              16.verticalSpace(),
              CustomMainButton(text: "Update Data", onTap: () {}),
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
