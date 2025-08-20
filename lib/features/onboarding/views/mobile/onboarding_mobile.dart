import 'package:block_base/core/services/screen_config/screen_config_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../widgets/animated_progress.dart';
import '../../../../widgets/glass_container.dart';
import '../../block/onboarding_state.dart';
import '../onboarding_screen.dart';

class OnboardingMobile extends StatelessWidget {
  final List<OnboardingItem> items;
  final PageController pageController;
  final OnboardingState state;
  final VoidCallback nextPage;

  const OnboardingMobile({
    super.key,
    required this.items,
    required this.pageController,
    required this.state,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: items.length,
            itemBuilder: (context, index) => Image.network(
              items[index].image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          Center(
            child: GlassContainer(
              width: double.infinity,
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              borderRadius: 12,
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
                    items[state.currentIndex].title,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    items[state.currentIndex].description,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 50.h,
            child: SizedBox(
              width: 80.w,
              height: 80.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 70.r,
                    height: 70.r,
                    child: AnimatedProgressIndicator(
                      progress: (state.currentIndex + 1) / items.length,
                    ),
                  ),
                  SizedBox(
                    width: 56.w,
                    height: 56.w,
                    child: FloatingActionButton(
                      onPressed: nextPage,
                      backgroundColor: kPrimaryColor,
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
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
