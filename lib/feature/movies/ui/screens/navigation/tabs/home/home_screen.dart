import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/home/cubit/home_cubit.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/available_now.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/custom_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var cubit = gitIt<HomeCubit>();
  @override
  void initState() {
    super.initState();
    cubit.loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  AvailableNow(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Actions',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Row(
                          children: [
                            Text(
                              'See More',
                              style: TextStyle(
                                color: AppColors.goldenYellow,
                                fontSize: 16,
                              ),
                            ),
                            5.horizontalSpace(),
                            Icon(
                              size: 15,
                              Icons.arrow_forward,
                              color: AppColors.goldenYellow,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 220, child: const CustomListView()),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
