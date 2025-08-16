import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'connectivity_event.dart';
import 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _subscription;

  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityChanged>((event, emit) {
      emit(event.isConnected ? ConnectivityOnline() : ConnectivityOffline());
    });

    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      add(ConnectivityChanged(result != ConnectivityResult.none));
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
