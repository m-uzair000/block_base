import 'package:flutter_bloc/flutter_bloc.dart';

// EVENTS
abstract class LoaderEvent {}

class ShowLoader extends LoaderEvent {}
class HideLoader extends LoaderEvent {}

// STATE
class LoaderState {
  final bool isLoading;
  LoaderState({required this.isLoading});
}

// BLOC
class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(LoaderState(isLoading: false)) {
    on<ShowLoader>((event, emit) => emit(LoaderState(isLoading: true)));
    on<HideLoader>((event, emit) => emit(LoaderState(isLoading: false)));
  }
}
