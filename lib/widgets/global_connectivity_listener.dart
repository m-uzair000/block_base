import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/services/connectivity/connectivity_bloc.dart';
import '../core/services/connectivity/connectivity_state.dart';

class GlobalConnectivityListener extends StatefulWidget {
  final Widget child;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  const GlobalConnectivityListener({
    required this.child,
    required this.scaffoldMessengerKey,
    super.key,
  });

  @override
  State<GlobalConnectivityListener> createState() =>
      _GlobalConnectivityListenerState();
}

class _GlobalConnectivityListenerState
    extends State<GlobalConnectivityListener> {
  ConnectivityState? _previousState;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityBloc, ConnectivityState>(
      listener: (context, state) {
        final messenger = widget.scaffoldMessengerKey.currentState;
        if (messenger == null) return;

        // Ignore first state (initial state)
        if (_previousState == null) {
          _previousState = state;
          return;
        }

        if (state is ConnectivityOffline &&
            _previousState is! ConnectivityOffline) {
          messenger.showSnackBar(
            const SnackBar(
              content: Text("No Internet Connection"),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is ConnectivityOnline &&
            _previousState is ConnectivityOffline) {
          messenger.showSnackBar(
            const SnackBar(
              content: Text("Back Online"),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green,
            ),
          );
        }

        _previousState = state;
      },
      child: widget.child,
    );
  }
}
