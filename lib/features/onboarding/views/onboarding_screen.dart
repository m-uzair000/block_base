import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/responsive.dart';
import '../../home/views/home.dart';
import '../block/onboarding_bloc.dart';
import '../block/onboarding_event.dart';
import '../block/onboarding_state.dart';
import 'desktop/onboarding_desktop.dart';
import 'mobile/onboarding_mobile.dart';
import 'tab/onboarding_tablet.dart';

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
      image: 'https://i.pinimg.com/736x/84/69/28/846928829c417540f0b7ba19c3ac3982.jpg',
      title: 'Welcome',
      description: 'Discover new features and possibilities.',
    ),
    OnboardingItem(
      image: 'https://images1.dnaindia.com/images/DNA-EN/900x1600/2025/2/7/1738919817897_bangiocwaterfalls11691138427.jpg',
      title: 'Stay Connected',
      description: 'Connect with people and share your ideas.',
    ),
    OnboardingItem(
      image: 'https://i.pinimg.com/originals/9e/3d/0d/9e3d0dbb557dda4fd9d2894e537ddd4c.jpg',
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
          return Responsive(
            mobile: OnboardingMobile(
              items: onboardingItems,
              pageController: _pageController,
              state: state,
              nextPage: nextPage,
            ),
            tablet: OnboardingTablet(
              items: onboardingItems,
              pageController: _pageController,
              state: state,
              nextPage: nextPage,
            ),
            desktop: OnboardingDesktop(
              items: onboardingItems,
              pageController: _pageController,
              state: state,
              nextPage: nextPage,
            ),
          );
        },
      ),
    );
  }
}
