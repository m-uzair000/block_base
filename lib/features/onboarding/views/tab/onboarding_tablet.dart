import 'package:block_base/core/services/screen_config/screen_config_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../widgets/animated_progress.dart';
import '../../../../widgets/glass_container.dart';
import '../../block/onboarding_state.dart';
import '../onboarding_screen.dart';

class OnboardingTablet extends StatelessWidget {
  final List<OnboardingItem> items;
  final PageController pageController;
  final OnboardingState state;
  final VoidCallback nextPage;

  const OnboardingTablet({
    super.key,
    required this.items,
    required this.pageController,
    required this.state,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: PageView.builder(
        controller: pageController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              // Left image
              Expanded(
                flex: 2,
                child: Image.network(
                  items[index].image,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),

              // Right content
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlassContainer(
                      width: double.infinity,
                      height: 300,
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      borderRadius: 20,
                      blur: 15,
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            items[index].title,
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            items[index].description,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    AnimatedProgressIndicator(
                      progress: (index + 1) / items.length,
                    ),
                    const SizedBox(height: 20),
                    FloatingActionButton(
                      onPressed: nextPage,
                      backgroundColor: kPrimaryColor,
                      child: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
