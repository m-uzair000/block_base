import 'package:block_base/core/services/screen_config/screen_config_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/colors.dart';
import '../../../widgets/glass_container.dart';
import '../../home/views/home.dart';
import '../block/onboarding_bloc.dart';
import '../block/onboarding_event.dart';
import '../block/onboarding_state.dart';

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  static const routeName = "/";

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      image:
          'https://i.pinimg.com/736x/84/69/28/846928829c417540f0b7ba19c3ac3982.jpg',
      title: 'Welcome',
      description: 'Discover new features and possibilities.',
    ),
    OnboardingItem(
      image:
          'https://images1.dnaindia.com/images/DNA-EN/900x1600/2025/2/7/1738919817897_bangiocwaterfalls11691138427.jpg',
      title: 'Stay Connected',
      description: 'Connect with people and share your ideas.',
    ),
    OnboardingItem(
      image:
          'https://i.pinimg.com/originals/9e/3d/0d/9e3d0dbb557dda4fd9d2894e537ddd4c.jpg',
      title: 'Get Started',
      description: 'Let\'s start your journey now!',
    ),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(totalPages: onboardingItems.length),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final bloc = context.read<OnboardingBloc>();

          void nextPage() {
            if (state.currentIndex < onboardingItems.length - 1) {
              _pageController.animateToPage(
                state.currentIndex + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              bloc.add(NextPageEvent());
            } else {
              context.go(HomeView.routeName);
            }
          }

          return Scaffold(
            backgroundColor: Colors.black12,
            body: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingItems.length,
                    onPageChanged: (index) {
                      bloc.add(PageChangedEvent(index));
                    },
                    itemBuilder: (context, index) {
                      final item = onboardingItems[index];
                      return Image.network(
                        item.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      );
                    },
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
                          onboardingItems[state.currentIndex].title,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          onboardingItems[state.currentIndex].description,
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
                            progress:
                                (state.currentIndex + 1) /
                                onboardingItems.length,
                          ),
                        ),
                        SizedBox(
                          width: 56.w,
                          height: 56.w,
                          child: FloatingActionButton(
                            onPressed: nextPage,
                            backgroundColor: kPrimaryColor,
                            shape: CircleBorder(),
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
        },
      ),
    );
  }
}

// Animated progress bar widget
class AnimatedProgressIndicator extends StatefulWidget {
  final double progress;

  const AnimatedProgressIndicator({required this.progress, super.key});

  @override
  State<AnimatedProgressIndicator> createState() =>
      _AnimatedProgressIndicatorState();
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double oldProgress = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation =
        Tween<double>(begin: oldProgress, end: widget.progress).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        )..addListener(() {
          setState(() {});
        });

    _controller.forward();
    oldProgress = widget.progress;
  }

  @override
  void didUpdateWidget(covariant AnimatedProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    _animation =
        Tween<double>(begin: oldProgress, end: widget.progress).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        )..addListener(() {
          setState(() {});
        });

    _controller.forward(from: 0);
    oldProgress = widget.progress;
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: _animation.value,
      strokeWidth: 5.w,
      backgroundColor: Colors.grey.shade300,
      color: kPrimaryColor,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
