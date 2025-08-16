import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final int totalPages;
  OnboardingBloc({required this.totalPages}) : super(const OnboardingState(currentIndex: 0)) {
    on<NextPageEvent>((event, emit) {
      if (state.currentIndex < totalPages - 1) {
        emit(state.copyWith(currentIndex: state.currentIndex + 1));
      }
    });

    on<PageChangedEvent>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });
  }
}
