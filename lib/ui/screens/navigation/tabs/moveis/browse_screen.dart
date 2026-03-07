import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/extension/int_extensions.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedCategoryIndex = 0;

  // قائمة تجريبية للتصنيفات (سيتم استبدالها ببيانات الـ API)
  final List<String> categories = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            10.verticalSpace(),

            /// HORIZONTAL CATEGORIES LIST
            SizedBox(
              height: 45,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => 10.horizontalSpace(),
                itemBuilder: (context, index) {
                  bool isSelected = selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedCategoryIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.goldenYellow
                            : AppColors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.goldenYellow,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.black
                                : AppColors.goldenYellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            15.verticalSpace(),

            /// MOVIES GRID SECTION (Fetching from API)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                // هنا نستخدم FutureBuilder لجلب البيانات من الـ API
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عمودين كما في الصورة
                    childAspectRatio: 0.7, // لضبط تناسب طول وعرض البوستر
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: 10, // هذا الرقم سيأتي من snapshot.data.length
                  itemBuilder: (context, index) {
                    return _buildMoviePoster(
                      "https://image.tmdb.org/t/p/w500/poster_path.jpg", // رابط الصورة من API
                      "7.7", // التقييم من API
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ويدجت بناء بوستر الفيلم مع التقييم
  Widget _buildMoviePoster(String imageUrl, String rating) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          // صورة الفيلم من الشبكة
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            // في حالة فشل التحميل تظهر صورة مؤقتة أو لودر
            errorBuilder: (context, error, stackTrace) => Container(
              color: AppColors.lightBlack,
              child: const Icon(Icons.broken_image, color: AppColors.white),
            ),
          ),

          // ويدجت التقييم (الذي يظهر في أعلى يسار الصورة)
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xCC121312), // لون داكن شفاف
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    rating,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.star,
                    color: AppColors.goldenYellow,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
