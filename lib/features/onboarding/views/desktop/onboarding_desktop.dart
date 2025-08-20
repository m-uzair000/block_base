import 'package:block_base/core/services/screen_config/screen_config_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../widgets/animated_progress.dart';
import '../../../../widgets/glass_container.dart';
import '../../block/onboarding_state.dart';
import '../onboarding_screen.dart';

class OnboardingDesktop extends StatelessWidget {
  final List<OnboardingItem> items;
  final PageController pageController;
  final OnboardingState state;
  final VoidCallback nextPage;

  const OnboardingDesktop({
    super.key,
    required this.items,
    required this.pageController,
    required this.state,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: PageView.builder(
        controller: pageController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              // Left image
              Expanded(
                flex: 3,
                child: Image.network(
                  items[index].image,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),

              // Right content
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(40.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlassContainer(
                        width: double.infinity,
                        height: 350,
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        borderRadius: 24,
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
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              items[index].description,
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedProgressIndicator(
                            progress: (index + 1) / items.length,
                          ),
                          const SizedBox(width: 30),
                          FloatingActionButton(
                            onPressed: nextPage,
                            backgroundColor: kPrimaryColor,
                            child: const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
